# Changelog

All notable changes to copybykaine.com, newest first.

## 2026-08-31 — Multi-page build begins (local, not yet deployed)
- New page: /services/ (services hub)
- New page: /services/facebook-lead-generation/ (Service + FAQPage schema)
- New page: /services/trade-websites/ (Service + FAQPage schema)
- New page: /about/ (Person + ProfilePage schema; real facts: ex-plumber, left Feb 2026, first client Wüsch since Apr 2026)
- Nav: added Services + About (both now resolve; no 404s)
- Footer: added sitemap block (homepage + shared sub-page footer)
- Shared components: booking CTA band, sub-page footer, page layout
- QA passed: 5 JSON-LD blocks valid, all internal links resolve, unique titles/descriptions, 320px clean

## 2026-08-27 — Eleventy migration + technical SEO baseline (local)
- Migrated homepage to Eleventy (11ty v3); CSS to /assets/site.css; single base layout
- Homepage ported pixel-identical (visible text byte-identical)
- Added robots.txt, auto-generated sitemap.xml, branded 404
- Generated 5 video posters (were referenced but missing)
- Added branded og-image.jpg (fixes the meta-image 404)
- Preserved /privacy.html
- Hid Google Preferred Sources button until site is eligible (was showing a broken placeholder)
