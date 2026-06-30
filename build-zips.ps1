# build-zips.ps1 -- (re)build the per-skill download zips for the grill skills.
#
# Makes grill-me/grill-me.zip and grill-with-docs/grill-with-docs.zip. Each zip holds
# the skill's own files plus LICENSE and NOTICE, because the grill skills are adapted
# from Matt Pocock's MIT-licensed work and the licence/attribution must travel with them.
#
# educational-worksheets has its own builder (educational-worksheets/build-bundle.ps1)
# with a regression guard, so it is intentionally NOT handled here -- run that one for it.
#
# Usage:
#   pwsh -File build-zips.ps1           # build the zips
#   pwsh -File build-zips.ps1 -Check    # verify the zips exist and hold the expected files

param([switch]$Check)

$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot

# skill folder -> files (relative to the skill folder) that ship inside its zip.
# LICENSE and NOTICE are added from the repo root to every skill.
$skills = @{
    'grill-me'        = @('README.md', 'SKILL.md')
    'grill-with-docs' = @('README.md', 'SKILL.md', 'CONTEXT-FORMAT.md', 'ADR-FORMAT.md')
}
$rootFiles = @('LICENSE', 'NOTICE')

function Get-ExpectedEntries($skill) {
    @($skills[$skill]) + $rootFiles | Sort-Object
}

if ($Check) {
    $ok = $true
    foreach ($skill in $skills.Keys) {
        $zipPath = Join-Path $root (Join-Path $skill "$skill.zip")
        if (-not (Test-Path $zipPath)) {
            Write-Host "MISSING: $zipPath" -ForegroundColor Red
            $ok = $false
            continue
        }
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        $zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
        try {
            $have = @($zip.Entries | ForEach-Object { $_.FullName } | Sort-Object)
        } finally {
            $zip.Dispose()
        }
        $want = Get-ExpectedEntries $skill
        if (($have -join '|') -ne ($want -join '|')) {
            Write-Host "STALE: $skill.zip" -ForegroundColor Red
            Write-Host "  have: $($have -join ', ')"
            Write-Host "  want: $($want -join ', ')"
            $ok = $false
        } else {
            Write-Host "OK: $skill.zip" -ForegroundColor Green
        }
    }
    if (-not $ok) { throw "One or more zips are missing or stale -- run build-zips.ps1 with no args to rebuild." }
    return
}

foreach ($skill in $skills.Keys) {
    $skillDir = Join-Path $root $skill
    $zipPath  = Join-Path $skillDir "$skill.zip"

    $staging = Join-Path ([System.IO.Path]::GetTempPath()) ("skillzip-" + [System.Guid]::NewGuid().ToString('N'))
    New-Item -ItemType Directory -Path $staging -Force | Out-Null
    try {
        foreach ($f in $skills[$skill]) {
            Copy-Item (Join-Path $skillDir $f) -Destination $staging
        }
        foreach ($f in $rootFiles) {
            Copy-Item (Join-Path $root $f) -Destination $staging
        }
        if (Test-Path $zipPath) { Remove-Item $zipPath -Force }
        Compress-Archive -Path (Join-Path $staging '*') -DestinationPath $zipPath -Force
        Write-Host "Built $zipPath" -ForegroundColor Green
    } finally {
        Remove-Item $staging -Recurse -Force -ErrorAction SilentlyContinue
    }
}
