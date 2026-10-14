# Company Website Factory

A reusable Hermes skill for producing distinctive, production-ready company websites with rigorous research, implementation, QA, search discovery, and deployment controls.

## Included

- `SKILL.md`: complete operating workflow
- `scripts/new-company-site.sh`: Next.js project scaffold
- `templates/website-spec.md`: structured discovery and website specification
- `references/release-checklist.md`: fail-closed release and domain checklist
- `references/source-control-and-skill-publishing.md`: scoped GitHub publishing and SHA verification

## Install for Hermes

```bash
mkdir -p ~/.hermes/skills/creative/company-website-factory
git clone https://github.com/kofiowusuai-lab/company-website-factory.git /tmp/company-website-factory
cp -R /tmp/company-website-factory/. ~/.hermes/skills/creative/company-website-factory/
```

The public repository can be cloned without access to a private project.
Authentication is needed only for write operations or private downstream repositories.

## Generate a website project

```bash
~/.hermes/skills/creative/company-website-factory/scripts/new-company-site.sh company-slug /path/to/company-slug
```

The slug must use lowercase kebab-case.

## Workflow coverage

- Company brief and source discovery
- Multiple visual directions before implementation
- Canonical company data model
- Official asset provenance and destination previews
- Test-driven implementation
- Responsive, keyboard, touch, and reduced-motion QA
- SEO, AEO, GEO, JSON-LD, `llms.txt`, and IndexNow
- Vercel deployment and stable production aliases
- DNS, email-record, TLS, and canonical-host verification
- Fail-closed release controls

## Updating the installed skill

```bash
cd /tmp/company-website-factory
git pull
cp -R . ~/.hermes/skills/creative/company-website-factory/
```

## What is implemented

This repository contains a reusable agent workflow and a Bash scaffold, not a
finished company website or hosted product. [`SKILL.md`](SKILL.md) defines the
research/design/build/release process. The scaffold installs a current Next.js
App Router project and test dependencies; the agent still has to implement the
company pages, canonical content model, assets, metadata, interactions, and QA.
The workflow coverage above describes required downstream work, not features
already generated automatically by the script.

## Requirements and configuration

Use Bash, Node.js and npm, a writable npm cache, and network access to the npm
registry. The script invokes `create-next-app@latest`, so scaffold output and Node
requirements follow the current generator rather than a pinned template version.
Check the generated project's dependency requirements on the target machine.

Hermes is needed to consume the skill as a Hermes workflow; the shell scaffold can
be run independently. The skill refers to `superpowers:brainstorming`,
`superpowers:test-driven-development`, and
`superpowers:verification-before-completion` as required companion skills, plus
optional holding-company/design-reference skills. Those packages are not bundled
here. Install the matching skills in your agent environment or explicitly adapt
the workflow before relying on it.

There is no `.env` template or service credential requirement for this factory.
`npm_config_cache` can override the cache, with `NPM_CONFIG_CACHE` as its fallback;
otherwise the script selects `~/.cache/npm`. Vercel, domain-provider, form-backend,
and IndexNow configuration belongs to the generated site's chosen integrations.
Do not place deployment credentials in this skill repository.

## Scaffold walkthrough

From a source checkout, the equivalent independent command is:

```bash
bash scripts/new-company-site.sh company-slug /absolute/path/to/new-company-site
```

The target must not exist and the slug must be lowercase kebab-case. The slug is
validated, but project generation uses the target directory; no company copy,
identity, or domain is inferred from it.

The script runs the Next.js generator with TypeScript, ESLint, App Router,
`src/`, npm, and the `@/*` import alias. It installs Zod plus Vitest, jsdom,
React Testing Library, and Playwright test dependencies, then adds `typecheck`,
`test`, and `test:e2e` npm scripts. It creates:

- `docs/START-HERE.md` with the implementation handoff.
- `src/app/__tests__/harness.test.ts` and `vitest.config.ts` for a minimal jsdom smoke test.
- `docs/`, `src/components/`, `src/lib/`, `e2e/`, `public/brand/`, and `public/previews/` directories.

Copy [`templates/website-spec.md`](templates/website-spec.md) into the new site's
`docs/website-spec.md`, fill in sources and decisions, then follow the skill's
implementation sequence. The scaffold does not author browser tests, a Playwright
configuration, or a production deployment. Its installed React Vite plugin is not
a substitute for configuring downstream TSX tests where needed.

## Verification and release

Validate the factory without downloading packages or creating a site:

```bash
bash -n scripts/new-company-site.sh
```

From a completed generated site, use the scripts that actually exist in its
package manifest:

```bash
npm run typecheck
npm test -- --run
npm run build
npm run test:e2e
```

Run the generated project's lint command too, adding/configuring one if the
current Next.js generator did not provide it. Install Playwright browsers and
configure the application server/browser suite before expecting `test:e2e` to
pass. The single scaffold smoke test establishes a working test harness, not a
verified business website.

Use the [release checklist](references/release-checklist.md) for responsive,
keyboard, visual, content, SEO/schema, production alias, domain, and TLS checks.
Use [source-control and publishing guidance](references/source-control-and-skill-publishing.md)
when distributing this skill itself. Deployment and DNS changes are separate
consequential operations, not side effects of running the scaffold.

## Troubleshooting and limitations

- Invalid slug/argument count exits 64; existing target exits 73; missing Node/npm exits 69.
- Cache permissions: supply a writable `npm_config_cache` or `NPM_CONFIG_CACHE` directory.
- Installation interrupted: `set -e` stops at the failing command, but can leave a partial target. Inspect it before cleanup or choose a new target; rerunning against the same existing directory is intentionally refused.
- E2E command reports no tests: author/configure Playwright tests; none are generated by the factory.
- Dependency behavior changes: the generator and npm installs are unpinned here. Keep the downstream lockfile and validate upgrades in that site.

The workflow requires official/approved assets and grounded company claims;
there are no bundled customer logos or guaranteed search-ranking outcomes.
`SKILL.md` retains its author metadata and declares MIT. This checkout does not
include a separate LICENSE file.
