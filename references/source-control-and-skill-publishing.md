# Source Control and Skill Publishing

Use this when a website-factory session produces or updates the reusable skill and the next request is to commit or publish “it.”

## Scope resolution

- Bind “it/this” to the immediately preceding deliverable.
- Name the exact artifact and target repository before external mutation.
- Dirty state elsewhere is evidence to inspect, not permission to change scope.
- Do not stage, commit, reconfigure, or create a remote for an unrelated generated site.
- If an unrelated edit was made while investigating, restore only the agent-created edit and preserve pre-existing user changes.

## Standalone repository shape

```text
company-website-factory/
├── README.md
├── SKILL.md
├── references/
├── scripts/
└── templates/
```

The README should explain installation, authentication requirements for private repositories, scaffold usage, and update instructions. Preserve executable bits on scripts.

## Pre-commit verification

1. Compare every packaged skill file against the installed source with `cmp` or checksums.
2. Run `bash -n` or the appropriate syntax checker for each script.
3. Exercise at least one deterministic invalid-input guard and confirm no output directory or partial artifact is created.
4. Confirm every file referenced by `SKILL.md` exists and is non-empty.
5. Run `git diff --cached --check` before committing.
6. Inspect staged paths to ensure no secrets, generated artifacts, or unrelated files entered the commit.

A previously successful scaffold smoke test remains evidence for unchanged byte-identical script content. Rerun the expensive positive smoke test when script bytes changed.

## GitHub publication

- Create a private repository by default for internal operational skills.
- Use a conventional initial commit such as `feat: add reusable company website factory skill`.
- Push the default branch and verify all three SHAs match:
  - local `HEAD`
  - remote tracking branch
  - GitHub API commit for the default branch
- Read repository visibility and default branch back from GitHub rather than inferring them from the create command.
- Require a clean working tree before reporting completion.

## Failure handling

- If the intended repository already exists, inspect it before copying or overwriting files.
- If the target directory already exists, stop packaging there and inspect its ownership and Git state.
- If tests expose an unrelated pre-existing defect, do not silently bundle a fix into the publishing commit. Keep the skill publication scoped and report the separate issue only when relevant.
- Never force-push merely to improve commit metadata without explicit authorization.