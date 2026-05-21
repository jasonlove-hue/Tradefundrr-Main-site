# TradeFundrr Marketing Site

Static marketing site for TradeFundrr — funded trading accounts, real institutional capital.

## Pages

- `index.html` — home
- `pages/about.html` — about
- `pages/why-us.html` — why us
- `pages/pricing.html` — pricing
- `pages/options.html` / `pages/options-offer.html` — options program
- `pages/stocks.html` / `pages/stocks-offer.html` — stocks program
- `pages/funnel.html` — funnel landing

## Stack

Pure static — no build step.

- HTML, CSS, vanilla JS
- jQuery + Swiper loaded from CDN
- Slick carousel (local: `js/slick.min.js`)
- Google Fonts: Inter, Open Sans, Geist Mono

## Local preview

Just open `index.html` in a browser, or run a tiny local server:

```
python -m http.server 8080
```

Then visit http://localhost:8080.

## Deploy

Hosted on Vercel as a static site (no framework, no build command). Push to `main` to deploy.

`vercel.json` sets long-lived cache headers for `/assets/*` and `/js/*` and enables `cleanUrls`.
