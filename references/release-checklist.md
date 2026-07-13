# Website release checklist

Copy this into `docs/release-checklist.md` and attach evidence beside each item.

## Brief and truth

- [ ] Legal/public name, audience, CTA, domain, sitemap, contact route confirmed
- [ ] Claims, ownership, services, portfolio, location, and regulated implications verified
- [ ] Unknown facts omitted or labeled, never invented
- [ ] Source/reference copy and irrelevant product logic removed

## Direction and identity

- [ ] Two or three real-content visual directions compared
- [ ] Selected direction recorded in `docs/website-spec.md`
- [ ] Every logo/identity asset sourced from an official or approved origin
- [ ] Asset provenance recorded and rendered logo pixels visually verified
- [ ] Destination previews use actual linked sites and work on hover, focus, and touch

## Architecture and behavior

- [ ] Organization, routes, contacts, roster, URLs, metadata facts, and FAQ centralized
- [ ] Repeated UI/schema/sitemap facts derive from canonical data where practical
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
- [ ] No secrets, generated noise, stale names/counts, or bad commit author in final diff

## Rendered QA

- [ ] All pages inspected at desktop
- [ ] Exact 320, 375, 768, 1024, and 1440 width checks complete
- [ ] No horizontal overflow, clipping, console errors, or inaccessible focus
- [ ] Navigation, external links, contact action, 404, and error states work
- [ ] Browser vision/raster review confirms composition, typography, logos, and previews
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
- [ ] Stable production alias returns expected title and key page markers
- [ ] Rendered desktop/mobile QA repeated against stable alias
- [ ] Apex and `www` attached and verified independently
- [ ] MX/SPF/DKIM/DMARC and unrelated DNS preserved
- [ ] Every authoritative nameserver and two public resolvers return expected records
- [ ] HTTPS certificates succeed for both hosts
- [ ] Canonical redirect/200 behavior observed, not assumed
- [ ] Contact route/form delivery verified end to end

Any unchecked fail-closed item means the release is incomplete.
