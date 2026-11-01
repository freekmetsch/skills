# Moonshot

AI agents often improve the system they see without questioning whether it is the right system.
Moonshot asks the agent to explore a radical alternative, test its hardest assumption, and build
what the evidence supports.

Before tuning a steam train's coal feed, consider electric trains, magnetic levitation, helicopters,
teleportation that would require invention, or whether the trip is needed at all. Treat fictional
capabilities as hypotheses: name the missing invention and test what the evidence supports.

## Install in Codex

Ask Codex:

```text
Use $skill-installer to install Moonshot from https://github.com/freekmetsch/skills/tree/main/moonshot
```

For manual installation, copy only this repository's `moonshot` folder into `~/.agents/skills/`.
The files must be:

```text
~/.agents/skills/moonshot/
|-- SKILL.md
|-- README.md
`-- agents/
    `-- openai.yaml
```

On Windows, `~` means your user folder. Keep any existing Moonshot installation until you have
checked the differences. Codex discovers personal skills in `~/.agents/skills/`.
See the [official skills documentation](https://learn.chatgpt.com/docs/build-skills).

Moonshot needs no other skills, scripts, services, or credentials. The optional `agents/openai.yaml`
file supplies Codex display settings. Other agents can use `SKILL.md` through their own skill loader.

## Use

Give the agent a problem, a time budget, and a stopping point. For example:

```text
Use $moonshot to rethink this slow import process. Spend up to 45 minutes.
Test the hardest assumption and build a local proof. Do not push or deploy.
```

For investigation without changes:

```text
Use $moonshot as a read-only investigation of our search design.
Compare a radical alternative with the obvious improvement. Spend up to 20 minutes.
```

A standalone run defaults to 12 hours when you give no budget. It repeats investigation,
implementation, review, and authorized delivery. When Moonshot accompanies another task, it
follows that task's budget and stopping point. Reading or editing the skill starts no run.

The skill does not grant permission to merge, deploy, spend money, or remove data. Those actions
must already be authorized by your request and repository rules.

## Share

Share [this Moonshot page](https://github.com/freekmetsch/skills/tree/main/moonshot).
