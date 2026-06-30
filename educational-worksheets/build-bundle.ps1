# build-bundle.ps1 -- rebuild the educational-worksheets skill bundle (educational-worksheets.zip).
#
# The bundle is what gets uploaded to ChatGPT / claude.ai as the skill's Knowledge,
# and the same files would be exposed by a shared skills-library repo. It ships only
# SKILL.md + assets/ + references/ + examples/curated-patterns.md. The 14 legacy sample
# HTMLs (outdated patterns + course-specific teaching materials) were deleted; the
# examples/archive/ guard below stays as a regression check so they can never be
# resurrected into the bundle. It also excludes this build script and the zip itself.
#
# Run from anywhere:  pwsh -File build-bundle.ps1   (or right-click > Run with PowerShell)

$ErrorActionPreference = 'Stop'
$skillRoot = $PSScriptRoot
$zipPath   = Join-Path $skillRoot 'educational-worksheets.zip'

# What ships, with folder structure preserved.
$shipFiles   = @('SKILL.md')
$shipFolders = @('assets', 'references')
$shipExamples = @('curated-patterns.md')   # from examples/ -- NOT examples/archive/

# Stage the wanted files in a temp tree so the zip preserves the folder layout
# (Compress-Archive flattens a flat file list, so staging is the reliable path).
$staging = Join-Path ([System.IO.Path]::GetTempPath()) ("ews-bundle-" + [System.Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $staging -Force | Out-Null
try {
    foreach ($f in $shipFiles) {
        Copy-Item (Join-Path $skillRoot $f) -Destination $staging
    }
    foreach ($d in $shipFolders) {
        Copy-Item (Join-Path $skillRoot $d) -Destination $staging -Recurse
    }
    $exDir = Join-Path $staging 'examples'
    New-Item -ItemType Directory -Path $exDir -Force | Out-Null
    foreach ($e in $shipExamples) {
        Copy-Item (Join-Path $skillRoot (Join-Path 'examples' $e)) -Destination $exDir
    }

    if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
    Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $zipPath -Force

    Write-Host "Built $zipPath" -ForegroundColor Green
    Write-Host "Contents:"
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
    try {
        foreach ($entry in ($zip.Entries | Sort-Object FullName)) { Write-Host "  $($entry.FullName)" }
        if ($zip.Entries.FullName -match '^examples/archive/') {
            throw "FAIL: examples/archive/ leaked into the bundle."
        }
    } finally { $zip.Dispose() }
}
finally {
    Remove-Item $staging -Recurse -Force -ErrorAction SilentlyContinue
}
