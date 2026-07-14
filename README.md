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

The repository is private, so GitHub authentication is required when cloning.

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
