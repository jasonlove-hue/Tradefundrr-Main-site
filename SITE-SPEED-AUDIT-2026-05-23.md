# TradeFundrr Marketing Site — Speed Audit

**Date:** 2026-05-23
**URL tested:** https://tradefundrr-main-site.vercel.app/
**Tools:** Google PageSpeed Insights (Lighthouse 13.0.1), live network inspection via Chrome DevTools

---

## Scores

| Metric | Mobile | Desktop | Threshold (good) |
|---|---|---|---|
| **Performance** | **54** (orange) | **87** (orange) | 90+ |
| First Contentful Paint | 3.0 s | 0.8 s | ≤ 1.8 s |
| **Largest Contentful Paint** | **12.4 s** | 2.2 s | ≤ 2.5 s |
| Total Blocking Time | 10 ms | 10 ms | ≤ 200 ms |
| Cumulative Layout Shift | **0.176** | 0.003 | ≤ 0.1 |
| Speed Index | 8.1 s | 1.3 s | ≤ 3.4 s |
| Accessibility | 97 | 92 | — |
| Best Practices | 100 | 100 | — |
| SEO | 100 | 100 | — |

**Headline:** desktop is in OK shape, mobile is failing badly. LCP at 12.4s on a Slow-4G Moto G Power means a real mobile visitor sits on a near-blank screen for 12+ seconds before the hero image paints. That's the single most important number to fix.

---

## What's actually happening on the wire

Live measurement on initial homepage load (before any user scrolling):

- **54 network requests**, **4,522 KB transferred**
- Of that, **4,197 KB is images** (93% of payload)
- Single biggest asset: `Vault Hero New.png` at **1,878 KB** (1672×941 PNG) — this is the LCP element
- The 21 falling-rain payout PNGs (`1.png`–`21.png`) are NOT in the initial load — they're behind `loading="lazy"` and the IntersectionObserver — BUT each is 1.27 MB / 1535×1024, so the moment a real user scrolls into that section they'll pull **~27 MB** more

So the homepage is roughly a **4.5 MB initial paint + 27 MB on first scroll = ~31 MB total**. That's the core problem.

---

## Prioritized fix list

### Tier 1 — Quick wins with massive impact (do these first)

#### 1. Convert the 21 payout cards from PNG → WebP and resize to display dimensions
- **Impact:** Reduces ~27 MB to ~1.2 MB (95%+ savings). Will single-handedly fix mobile data usage and LCP-on-scroll.
- **Current:** 1535×1024 PNG @ ~1.27 MB each. Displayed at max 420px wide.
- **Target:** 840×560 WebP @ quality 80 ≈ 50–60 KB each. (2× display width for retina.)
- **How:** Run a one-liner with `cwebp` or `sharp` over `assets/images/1.png` through `21.png`. Update the JS in `index.html` to reference `.webp`. Bump cache-buster `?v=`.
- **Effort:** 30 minutes including the script.

#### 2. Shrink and optimize the hero PNG (`Vault Hero New.png`)
- **Impact:** Cuts LCP on mobile from 12.4 s toward the 2.5 s "good" threshold. Removes ~1.7 MB from the initial paint.
- **Current:** 1672×941 PNG, **1,878 KB**.
- **Target:** Export as WebP at 1200×675 quality 82 → ~150 KB. Or AVIF for even more savings.
- **Bonus:** Add `<link rel="preload" as="image" href="..." fetchpriority="high">` in `<head>` so the browser starts downloading it before parsing past the CSS. This alone can shave 1–2 s off LCP.
- **Effort:** 15 minutes.

#### 3. Add explicit `width` and `height` attributes to every `<img>`
- **Impact:** Eliminates the 0.176 mobile CLS (Lighthouse calls this out: "Image elements do not have explicit width and height"). Gets CLS back to <0.1 "good" zone.
- **How:** PowerShell pass that finds every `<img src="...">` without `width=` and sets `width` / `height` from the source file. Same script can also add `decoding="async"`.
- **Effort:** 1 hour for a script that handles all 9 pages.

### Tier 2 — High impact, more effort

#### 4. Eliminate render-blocking requests (Lighthouse: 1,160 ms savings on mobile)
The current `<head>` blocks the first paint on:
- Google Fonts CSS (`fonts.googleapis.com/css2?...`)
- Swiper CSS from jsdelivr
- `assets/css/main.css` (203 KB)
- `assets/css/mobile-fixes.css`

Fixes:
- **Self-host Inter / Open Sans / Geist Mono** as `woff2` from `assets/fonts/` with `font-display: swap` in CSS. Removes the jsdelivr/googleapis round-trips entirely. Use `<link rel="preload" as="font" type="font/woff2" crossorigin>` for the two weights actually visible above the fold (probably Inter 700 and 500).
- **Inline critical CSS** (the ~3 KB worth of rules that style the hero) directly in `<head>`, defer the rest of main.css with `media="print" onload="this.media='all'"` trick or `rel="preload" as="style"`.
- **Drop Swiper if you don't use it** — check whether any visible component is actually a Swiper carousel. If you're only using Slick now, remove the Swiper CSS+JS entirely. Saves ~150 KB and one DNS lookup.
- **Effort:** 2–3 hours.

#### 5. Cut unused CSS (26 KB) and JS (48 KB)
- `main.css` is 203 KB. Lighthouse says ~26 KB is unused on the homepage.
- **How:** Run PurgeCSS against the 9 HTML pages → emit a stripped `main.css`. Keep `mobile-fixes.css` separate. Even a 30% trim helps parse time on mobile CPUs.
- **JS:** jQuery 3.7.1 (~30 KB gzipped) is loaded but you're using almost none of it — Slick needs it. If you swap Slick for a vanilla carousel (Embla, Splide, or pure CSS), you can drop jQuery entirely.
- **Effort:** 1–2 hours for CSS purge; 4–6 hours for jQuery removal.

#### 6. Compress the other oversized images
| File | Current | Target | Savings |
|---|---|---|---|
| `beyond.webp` | 1,080 KB | 200 KB | 880 KB |
| `why-us-back.webp` | 956 KB | 180 KB | 776 KB |
| `human-support.webp` | 803 KB | 150 KB | 653 KB |
| `funnels-back.webp` | 840 KB | 160 KB | 680 KB |
| `coinsimage.webp` | 754 KB | 140 KB | 614 KB |
| `Vault Hero Transparent.png` (2.5 MB) | 2,500 KB | 250 KB WebP | 2,250 KB |

These are likely the LCP elements on `pages/about.html`, `pages/why-us.html`, etc. Same WebP-resize treatment as the payout cards.
- **Effort:** 30 minutes with `cwebp` on the whole `assets/images/` folder.

### Tier 3 — Polish

#### 7. Use `<picture>` with responsive sources
For the hero and any large background, ship a 480w version for phones, 1200w for desktop:
```html
<picture>
  <source media="(max-width: 768px)" srcset="hero-mobile.webp">
  <source media="(min-width: 769px)" srcset="hero-desktop.webp">
  <img src="hero-desktop.webp" alt="..." width="1200" height="675" fetchpriority="high">
</picture>
```
Mobile gets a 60-KB asset instead of a 1.9-MB one.

#### 8. Move jQuery, Slick, and Swiper to `defer` with `async` where safe
Already mostly `defer`-loaded — but jQuery loads from `code.jquery.com` (third-party DNS). Self-host it under `js/` to avoid the extra DNS+TLS handshake. Same for Swiper.

#### 9. Fix the "Avoid non-composited animations" warning
The CSS keyframes on `.tf-ticker` and `.payout-card` likely animate properties like `left`/`top` instead of `transform`. Switch to `transform: translateX()` / `translateY()` for GPU compositing. Cheaper paints, smoother on mobile.

#### 10. Tighten the `vercel.json` cache headers
Already good for `/assets/*` and `/js/*` (1-year immutable). Add `/pages/*.html` with a shorter `s-maxage=300, stale-while-revalidate=86400` so HTML pages still update fast but cache well at the edge.

#### 11. Kill the `mov_bbb.mp4` placeholder
`assets/video/mov_bbb.mp4` (771 KB "Big Buck Bunny" sample) is in the repo. If nothing references it, delete it — keeps git/Vercel slim.

---

## Recommended sequence (a ~half day of work for huge gains)

1. **Hour 1 — Tier 1 #1 + #2:** WebP-convert the 21 payout cards and the hero. Push. Re-test PSI. Expect mobile Performance to jump from 54 → ~75 and LCP to drop from 12.4s → ~5s.
2. **Hour 2 — Tier 1 #3:** Add `width`/`height` to all `<img>`. CLS should drop to <0.1.
3. **Hour 3 — Tier 2 #6:** Compress the other 5 oversized images (`beyond`, `why-us-back`, `human-support`, `funnels-back`, `coinsimage`).
4. **Hour 4–5 — Tier 2 #4:** Self-host fonts + preload hero + drop Swiper if unused. Expect mobile Performance to land at 90+.

After all of Tier 1 and Tier 2 you should be looking at:
- Mobile Performance: 90+
- LCP mobile: ~2.0 s
- CLS mobile: ~0.02
- Initial payload: ~700 KB (down from 4.5 MB)
- Total scrollable payload: ~2 MB (down from ~31 MB)

---

## Quick reference: what's NOT a problem
- TBT (Total Blocking Time) is 10 ms on both — JS isn't the bottleneck.
- Best Practices and SEO are 100 — no work there.
- Vercel cache headers are already configured correctly.
- The `defer` attribute is already on third-party scripts.
- HTTP/2 multiplexing is active (Vercel handles this).

The story is overwhelmingly about **image weight**, plus a small amount of render-blocking work in `<head>`.

---

## UPDATE: 2026-05-25 Optimization Round

Significant perf work completed in the 2026-05-25 session. Desktop scores:

| Page | Before (2026-05-23) | After (2026-05-25) | Delta |
|---|---|---|---|
| `/` (homepage) | 77 (LCP 4.5s) | **98** (LCP ~0.9s) | +21 |
| `/pages/pro-funding` | 49 (LCP 4.9s, TBT 800ms) | **100** (LCP 0.7s) | +51 |

### What landed (summary)

**Homepage (`index.html`):**
- Resized 5 dropdown PNG thumbnails → WebP (saved 212 KiB). Sweep updated all 14 HTML files.
- Recompressed vault hero WebP at quality=78 (saved 2.3 KiB).
- Lazy-loaded Swiper CSS+JS via IntersectionObserver (saved ~50 KiB render-blocking). Carousel still works identically, just no longer in critical path.
- Simplified the Journey/Timeline animation — removed IntersectionObserver complexity, cycles from page load at 1500ms cadence. Added `window.__tfJourneyDebug` for diagnostics.

**Pro-funding (`pages/pro-funding.html`):**
- Converted the 5,066 KB WordPress GIF hero to MP4 (960 KB) + WebM (495 KB) with WebP poster (1.1 KB). 90% size reduction.
- Replaced `<img>` with `<video autoplay loop muted playsinline fetchpriority="high">` element.
- Preloaded 3 additional critical fonts (inter-500, inter-600, geist-mono-400) in `<head>`.
- Added `<link rel="preconnect">` for js.hsforms.net and forms.hsforms.com.
- Lazy-loaded HubSpot form (`embed/v2.js` 197 KiB) — only fetches when apply-form section approaches viewport.

### Patterns established (use for future page optimization)

1. **GIF → video** for any animation > 100 KB. Use `<video autoplay loop muted playsinline>` with WebM source first, MP4 fallback, GIF inside as ultimate fallback.
2. **Lazy-load third-party scripts** via IntersectionObserver on the consuming element. Watch with `rootMargin: '400-600px 0px'`. Add preconnect for the third-party domain so DNS+TLS is warm.
3. **Preload all critical fonts in `<head>`** before the CSS link. Otherwise browser only discovers fonts after parsing CSS — chained request, slow LCP.
4. **Image audit:** any image > 50 KB. Resize to 2× display dimensions with PIL Lanczos, convert to WebP. PNG with transparency → WebP lossless.

Full session details: `HANDOFF-2026-05-25.md`.
