---
name: company-website-factory
description: Use when repeatedly creating, redesigning, cloning, or launching polished corporate, portfolio, parent-company, agency, consultancy, or multi-brand marketing websites from short briefs, especially when Next.js, official brand assets, responsive interactions, search discovery, Vercel, or custom domains are involved.
version: 1.0.0
author: Hermes Agent
license: MIT
metadata:
  hermes:
    tags: [websites, nextjs, corporate, marketing, seo, aeo, geo, vercel]
    related_skills: [holding-company-websites, popular-web-designs, superpowers-brainstorming, superpowers-test-driven-development, superpowers-verification-before-completion]
---

# Company Website Factory

## Overview

Turn a short company brief into a credible, differentiated, production website. The factory optimizes for repeatability without producing template-looking sites.

Core rule: reuse the operating system, not the visible design. Every site gets a distinct art direction, truthful content, one canonical data model, tests, visual QA, search/answer-engine surfaces, and verified production delivery.

## Required skills

- **REQUIRED:** Load `superpowers:brainstorming` before creative decisions.
- **REQUIRED:** Load `superpowers:test-driven-development` before implementation.
- **REQUIRED:** Load `superpowers:verification-before-completion` before release claims.
- Load `holding-company-websites` for parent, portfolio, venture-studio, or multi-brand sites.
- Load `popular-web-designs` when a named visual reference or design-system family applies.

## Factory sequence

### 1. Ground the brief

Inspect live sources before asking for retrievable facts. Establish:

- legal and public name, purpose, audience, primary CTA, canonical domain
- page roster, company/service roster, contact destination, location
- approved claims, prohibited implications, regulatory boundaries
- official URLs, logos, brand sources, reference sites, and desired tone

Ask one concise round only for missing decisions that materially change output. Never invent ownership, scale, history, customers, licensing, or performance.

Write `docs/website-spec.md` with facts, assumptions, source URLs, sitemap, page goals, CTA hierarchy, and approval risks.

### 2. Choose a visual direction

Produce 2–3 materially different directions using real company content. Vary hierarchy, typography, composition, surfaces, and interaction, not only colors. Record the selected direction and rejected alternatives.

If adapting a reference website, extract its design language while removing its product logic, copy, unsupported claims, and obsolete architecture. Never clone another brand's identity.

Do not begin page implementation until the visual direction is selected and recorded in `docs/website-spec.md`.

### 3. Scaffold and centralize truth

Run `scripts/new-company-site.sh <slug> <target-dir>` or create an equivalent current Next.js App Router project.

Create one canonical site-data module for:

- organization identity and contact details
- navigation and canonical routes
- companies, services, sectors, URLs, logos, and preview images
- metadata facts, social links, and FAQ content

UI cards, page copy, footer links, JSON-LD, sitemap, LLM files, counts, and tests should derive from shared data where practical. A roster change is a site-wide migration.

### 4. Build through TDD

Start with behavioral tests covering:

- complete route and navigation roster
- exact company/service names and destinations
- CTA links and contact values
- no source-reference copy or unsupported claims
- mobile menu hydration and keyboard behavior
- portfolio hover, focus, touch, and reduced-motion behavior
- metadata, schema, sitemap, crawler rules, and LLM files

Watch each focused test fail, implement the smallest passing behavior, then refactor. Build Server Components by default. Add Client Components only for interaction.

### 5. Use official assets

Source logos from official live sites, manifests, Open Graph assets, or approved files. Record provenance. Preserve geometry and identity. Do not replace real operation logos with generic marks or text approximations.

For destination previews, capture the real linked website as an optimized static image. Desktop previews respond to hover and keyboard focus. Touch receives a persistent or explicit preview treatment. Text and links remain usable if imagery fails.

### 6. Pass visual and responsive QA

Verify actual rendered pages, not only source or DOM assertions:

- desktop and exact mobile widths, including 320/375/768/1024/1440
- no horizontal overflow, clipped headings, or unsafe touch targets
- keyboard navigation, focus contrast, menu open/close, Escape, focus return
- reduced motion, route-away-and-back animation lifecycle
- official logo pixels visible against their rendered backgrounds
- all pages, long content, broken/missing images, and console errors

A screenshot file, HTTP 200, or nonzero image bounds is not visual proof. Inspect the rendered raster or use vision QA.

### 7. Ship SEO, AEO, GEO, and AI discovery together

After visible facts and the canonical domain are stable, synchronize:

- unique title, description, canonical, Open Graph, and X metadata
- `Organization`, `WebSite`, `BreadcrumbList`, and visible-content-backed FAQ schema
- framework-native `robots.ts` and `sitemap.ts`
- public plain-text `/llms.txt` and optional `/llms-full.txt`
- IndexNow verification key and submission after the key is live

Optimize entity clarity and direct answers, not keyword density. No hidden keyword blocks, cloaking, fabricated FAQs, or promises of rankings/citations. Escape JSON-LD before inserting it into HTML.

### 8. Run the release gate

From a clean production state:

```bash
npm run lint
npm run typecheck
npm test -- --run
npm run build
npm run test:e2e
```

Adapt only when scripts differ. Keep unit and Playwright collection scopes separate. Stop old Next processes before rebuilding `.next`, then start a fresh production server for browser tests.

Review the final diff, staged files, secrets, generated noise, commit author, and source-reference remnants. Do not deploy any failed or unreviewed visual state.

### 9. Deploy and verify Vercel

Deploy the tested commit. Verify the stable production alias through raw HTTP and rendered desktop/mobile checks. A successful Vercel build is not release approval.

For a custom domain:

1. Read `.vercel/project.json` and attach apex plus `www` to the intended project.
2. Treat current `vercel domains verify` output as authoritative.
3. Preserve MX, SPF, DKIM, DMARC, and unrelated records.
4. Verify every authoritative nameserver and at least two public resolvers.
5. Verify Vercel domain state, HTTPS certificates, expected content, and canonical-host behavior separately.

Do not claim IndexNow submission, DNS completion, TLS completion, or redirects from preparation alone. Capture the actual response or observed behavior.

## Parallel execution

Parallelize only independent work: official-asset sourcing, source-copy audit, page implementation, and test authoring. Keep shared data-model changes serialized or partitioned by file. Integrate and rerun the whole gate once.

## Fail-closed conditions

Do not publish when any of these remains:

- invented or unsupported business claim
- unofficial, generic, invisible, or distorted identity asset
- reference-brand copy or product logic
- inaccessible menu, hover-only content, clipped mobile layout, console error
- stale roster count, URL, schema, sitemap, or LLM fact
- failed visual review, lint, typecheck, test, build, or browser gate
- unverified domain, TLS, contact destination, or production content

## Common mistakes

- Reusing the previous site's appearance instead of its workflow.
- Coding before visual direction is selected.
- Duplicating portfolio/service facts across components and schema.
- Treating tests as visual approval.
- Checking only the deployment URL, not the stable custom domain.
- Publishing `llms.txt` as hidden SEO spam.
- Preparing an IndexNow key and reporting a completed submission.
- Changing DNS without preserving email records.
- Stopping after deployment instead of verifying every public surface.

## Verification checklist

Use `references/release-checklist.md`. Completion requires checked evidence for brief, sources, visual direction, shared data, tests, rendered QA, discovery surfaces, Vercel, domain, HTTPS, and production content.
