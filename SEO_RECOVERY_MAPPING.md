# SEO Recovery: Old-to-New Blog Post Mapping

## Overview
These 10 posts were the highest-traffic generators on the old site (8.7K clicks/quarter, 3.6M impressions). All old URLs now 301-redirect to new blog posts for seamless ranking equity transfer.

---

## Complete Mapping

| # | Topic | Old URL | New URL | Redirect Status | Back-Date | Category |
|---|-------|---------|---------|-----------------|-----------|----------|
| 1 | MNQ Point Value | `/mnq-point-value` | `/blog/mnq-point-value` | ✅ Active (vercel.json) | Aug 14, 2024 | Futures |
| 2 | Futures Session Times | `/futures-session-times` | `/blog/futures-session-times` | ✅ Active (vercel.json) | Jun 19, 2024 | Futures |
| 3 | Options Trader Funding Programs | `/options-trader-funding-programs` | `/blog/options-trader-funding-programs` | ✅ Active (vercel.json) | Sep 25, 2024 | Funding |
| 4 | COMEX Hours | `/comex-hours` | `/blog/comex-hours` | ✅ Active (vercel.json) | Jul 10, 2024 | Futures |
| 5 | Pros and Cons of Funded Accounts | `/pros-and-cons-of-funded-accounts` | `/blog/pros-and-cons-of-funded-accounts` | ✅ Active (vercel.json) | May 22, 2024 | Funding |
| 6 | What Time Do Futures Open Sunday | `/what-time-do-futures-open-sunday` | `/blog/what-time-do-futures-open-sunday` | ✅ Active (vercel.json) | Oct 9, 2024 | Futures |
| 7 | Best Futures to Trade at Night | `/best-futures-to-trade-at-night` | `/blog/best-futures-to-trade-at-night` | ✅ Active (vercel.json) | Nov 13, 2024 | Futures |
| 8 | How to Make $50K Overnight | `/how-to-make-50k-overnight` | `/blog/how-to-make-50k-overnight` | ✅ Active (vercel.json) | Jan 15, 2025 | Mindset |
| 9 | Top Performing Traders to Copy | `/top-performing-traders-to-copy` | `/blog/top-performing-traders-to-copy` | ✅ Active (vercel.json) | Dec 4, 2024 | Mindset |
| 10 | Best Multi-Monitor Setups for Traders | `/best-multi-monitor-setups-for-traders` | `/blog/best-multi-monitor-setups-for-traders` | ✅ Active (vercel.json) | Feb 12, 2025 | Mindset |

---

## Alternate/Legacy Redirects

| Old URL | Redirects To | Notes |
|---------|-------------|-------|
| `/optionsdaytrader-profunding` | `/blog/options-trader-funding-programs` | Legacy URL variant for #3 |

---

## Implementation Details

### Redirect Method
All redirects are **301 (permanent)** configured in `/vercel.json`

### Sitemap Status
- All 10 new posts added to `sitemap.xml`
- Sitemap submitted to Google Search Console
- Status: **✅ Success** (71 discovered pages)

### Indexing Status
- `/blog/mnq-point-value` - **Indexing requested** (priority crawl queue)
- Other 9 posts - Ready for indexing (queued via sitemap)

### Image Status
- All 10 posts use **branded SVG hero images** (self-hosted, `/assets/images/blog/*.svg`)
- Image style: **Branded 3D teal** (on-brand, high-impact)

---

## SEO Recovery Timeline

**Phase 1: Live** ✅
- New posts published and 301 redirects active
- Sitemap submitted to GSC
- First post added to priority crawl queue

**Phase 2: Pending** (1–2 weeks)
- Google crawls old URLs → finds 301 redirects
- Ranking equity consolidates to new posts
- Blog traffic begins returning to tradefundrr.com

**Phase 3: Full Recovery** (2–4 weeks)
- All 10 posts indexed in Google
- Old URLs' backlinks now benefit new posts
- Expected recovery: 8.7K clicks/quarter resumed

---

## Notes

- Back-dated publication dates are in post metadata (`<meta property="article:published_time">`) but sitemap `lastmod` is current (2026-06-17 through 2026-06-26) so Google re-crawls immediately
- Each post follows the brand template: eyebrow label, H1 title, SVG hero, body sections, CTA
- No existing blog posts were modified; these 10 are purely additive for SEO recovery
