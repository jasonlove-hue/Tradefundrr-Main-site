# Crypto Page — Rationale & Build Log

**Date:** 2026-06-20
**File documented:** `main-site/crypto-full-site-mockup.html` (draft — not yet ported to live `pages/crypto.html`)
**Live target:** tradefundrr.com (currently staging at tradefundrr-main-site.vercel.app)

This explains *why* the crypto page is built the way it is, and the path we took to get there.

---

## The core audience call (the decision everything hangs on)

- We deliberately targeted the **hyper-aware crypto trader**, not a beginner. In Eugene Schwartz terms this buyer is "most aware": they already know what funded trading is, they speak the language (bag, size, liquidation, perps, the majors, alts), and many have been burned by a rug.
- So the page **recognizes** the trader rather than educating them.
- This single choice drove every downstream decision: native vocabulary, proof over explanation, and an anti-scam/trust spine instead of a "here's how prop firms work" tutorial.

---

## Structure — match the family, don't clone it

- Modeled on the live stocks/futures pages so crypto reads as the same brand: sticky header with the Products mega-dropdown, two-column hero with a product visual + live ticker, consistent section rhythm.
- Rebuilt the **accounts section to the futures pattern**: 50K/100K size toggle → three cards → feature-chip strip → always-open full comparison table. It's the strongest, most-proven pricing layout on the site, and crypto traders comparison-shop hard.
- One adaptation: the **$5K Promo is a fixed card outside the toggle**, since it doesn't fit a 50K/100K size switch.

---

## Voice & copy

- Rewrote every section hook→CTA in trader voice: *"Your edge is real. Your bag's just too small to prove it."* / *"Keep 80% of what you pull."* / *"Stop trading your own bag. Trade ours."*
- Kept compliance intact throughout: "simulated funded account," the T3 distinction (T3 Trading Group is the registered entity, not T3 Global), and honest risk framing.
- Stripped every em dash from the copy (replaced with commas, plus a colon/period where they read better).

---

## The trust spine (the biggest lever for this audience)

Added five sections that do the work this buyer actually needs — they don't need teaching, they need to believe you'll pay. Placed as one arc *after* the offer and programs, so skeptics hit the proof right when interest peaks.

- **The crypto graveyard** — names the enemy: rugs, vanished firms, moving goalposts.
- **Us vs. the rest** — head-to-head against the typical crypto firm.
- **Where your payout actually comes from** — kills the "you profit when I lose" fear by explaining the business model (fees fund ops; real profit comes from scaled capital via T3; 80/20 alignment).
- **Payout proof** — weekly cadence, with the 10-trading-day minimum noted.
- **Not for everyone** — qualifies the serious trader, repels the degen.

---

## Motion — credibility, not decoration

Four hero-quality, scroll-triggered, reduced-motion-safe canvas animations. Each illustrates a claim a trader cares about rather than moving for effect, and all carry "illustrative, not a promise" captions.

1. **Candlestick run** (the offer).
2. **Liquidation curve** (your bag vs. our capital).
3. **Count-up stats** (what you keep).
4. **Cumulative-payout curve** (the payout-proof section).

---

## Polish that compounds

- Unified typography to the site's exact stack (**Inter + Geist Mono**; dropped the stray Space Grotesk) so it stops looking like a different site.
- Tuned the hero orbit so the rings nest cleanly (matched tilt, smaller inner ring) and sit lower in the frame.

---

## Where it stands / what's deliberately not done

- Still a **draft** (`crypto-full-site-mockup.html`) — not yet ported to live `pages/crypto.html`; plan buttons are placeholders pending real checkout URLs.
- **Verify before launch:** the **Trustpilot 4.3 / 67+** numbers and the **0.5% max-risk** figure.
- The **platform section** (showing TradeFundrr Trader) is the one remaining futures-page idea we skipped — it needs a real UI screenshot to be worth building.
- Pending changes across the repo (this page + Clarity install + futures Mechanic 01 fix) remain **uncommitted/unpushed**.
