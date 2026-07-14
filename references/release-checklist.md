# Website release checklist

Copy this into `docs/release-checklist.md` and attach evidence beside each item.

## Brief and truth

- [ ] Legal/public name, audience, CTA, domain, sitemap, contact route confirmed
- [ ] Claims, ownership, services, portfolio, location, and regulated implications verified
- [ ] Legal facts have an authoritative source or explicit owner attestation recorded
- [ ] Unknown facts omitted or labeled, never invented
- [ ] Source/reference copy and irrelevant product logic removed

## Direction and identity

- [ ] Two or three real-content visual directions compared
- [ ] Selected direction recorded in `docs/website-spec.md`
- [ ] Every logo/identity asset sourced from an official or approved origin
- [ ] Asset provenance recorded and rendered logo pixels visually verified
- [ ] Intrinsic logo aspect ratios and artwork backgrounds preserved; no unapproved UI frame/padding/border/shadow added
- [ ] Destination previews use actual linked sites and work on hover, focus, and touch

## Architecture and behavior

- [ ] Organization, routes, contacts, roster, URLs, metadata facts, and FAQ centralized
- [ ] Repeated UI/schema/sitemap facts derive from canonical data where practical
- [ ] Roster counts, ordinals, layouts, map paths, schema, discovery files, and tests agree
- [ ] Mobile menu hydrates and supports keyboard, Escape, and focus return
- [ ] Reduced motion works; route-away-and-back animation regression passes
- [ ] Missing images and long content degrade safely

## Automated gates

- [ ] Focused tests failed before implementation and now pass
- [ ] `npm run lint`
- [ ] `npm run typecheck`
- [ ] `npm test -- --run`
- [ ] `npm run build`
- [ ] `npm run test:e2e`
- [ ] Any isolated flaky retry is followed by an unchanged full-suite pass
- [ ] No secrets, generated noise, stale names/counts, or bad commit author in final diff

## Rendered QA

- [ ] All pages inspected at desktop
- [ ] Exact 320, 340, 375, 390, 600, 768, 800, 1024, and 1440 width checks complete
- [ ] No horizontal overflow, clipping, console errors, or inaccessible focus
- [ ] Automated pairwise overlap checks pass for maps, cards, labels, connectors, and center elements
- [ ] Navigation, external links, contact action, 404, and error states work
- [ ] Browser vision/raster review confirms composition, typography, logos, and previews
- [ ] Lazy-loaded portfolio logos/previews are scrolled into view and verified loaded
- [ ] Visual review logged separately from code/browser test results

## SEO, AEO, GEO, and AI discovery

- [ ] Unique route titles, descriptions, canonicals, Open Graph, and X metadata
- [ ] Organization/WebSite/Breadcrumb/FAQ schema matches visible facts
- [ ] `robots.txt` and canonical-only `sitemap.xml` return correct content types
- [ ] `/llms.txt` and optional `/llms-full.txt` are public plain text and factual
- [ ] No hidden keyword content, fabricated FAQ, or unsupported regulated schema
- [ ] IndexNow key is live before submission
- [ ] Submission response recorded separately from key preparation

## Production and domain

- [ ] Tested commit deployed to intended Vercel project
- [ ] Deployed commit SHA recorded and matched to the reviewed commit where platform data permits
- [ ] Stable production alias returns expected title and key page markers
- [ ] Every public stable alias independently returns expected roster and legal markers
- [ ] Rendered desktop/mobile QA repeated against every public stable alias
- [ ] Production roster count, external destinations, asset load state, overflow, and overlap checks pass
- [ ] Apex and `www` attached and verified independently
- [ ] MX/SPF/DKIM/DMARC and unrelated DNS preserved
- [ ] Every authoritative nameserver and two public resolvers return expected records
- [ ] HTTPS certificates succeed for both hosts
- [ ] Canonical redirect/200 behavior observed, not assumed
- [ ] Contact route/form delivery verified end to end

Any unchecked fail-closed item means the release is incomplete.
