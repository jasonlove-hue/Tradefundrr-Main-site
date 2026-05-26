# TradeFundrr Options Page — Design + Messaging System

**Lives at:** `pages/options.html` (production). Backup of pre-rebuild simple page: `pages/options-old.html`.
**Deployed:** `https://tradefundrr-main-site.vercel.app/pages/options`
**Companion docs:** `HOMEPAGE-DESIGN-MESSAGING.md` (homepage), `STOCKS-PAGE-DESIGN.md` (stocks sibling, this page's structural ancestor), `HANDOFF-2026-05-26.md` (build session notes)
**Built:** 2026-05-26 (cloned from `pages/stocks.html` and rewritten for options-specific content)
**Sections:** 22 (same architecture as stocks page, options-specific copy throughout)

---

## 1. Page Purpose

The options page targets **retail options day traders** who can't deploy real size at their current account level. Same low-awareness onramp as the stocks page, but every section reframed for options-specific frictions:

- **Mid-aware (primary):** "I'm a retail options trader with $5-25K, my edge works on 1-2 contracts at a time, multi-leg strategies eat my margin alive." Page speaks directly to contract-count constraint, retail margin treatment on multi-leg, PFOF execution costs.
- **Low-aware (secondary):** "I'm exploring options funded trading, what is this?" Page opens with orientation panel, glossary including options-specific terms (Greeks via existing entries, Defined-risk options).

**Key differentiation from stocks page:** the binding constraint isn't account size (stocks page narrative), it's **contract count**. A retail account caps you to 1-2 contracts per setup; TradeFundrr's funded options account unlocks 10 (Growth) or 20 (Express) contracts at the same $25K simulated balance.

---

## 2. Section Architecture (in render order)

Same 22-section flow as stocks page. Options-specific replacements noted below.

### 2.1 Header / Navigation

Standard sitewide nav. Login link points at `https://dashboard.tradefundrr.com/Identity/Account/Login?ReturnUrl=%2FClient` with `target="_blank" rel="noopener"`.

### 2.2 Hero (`.stx-hero`)

**Layout:** 2-column grid (text + media), same `.stx-hero` CSS as stocks page.

**Eyebrow:** "Funded options trading · T3 Global infrastructure" (Geist Mono, 12px, uppercase, teal).

**H1:** "Scale your edge. **Not your risk.**" — Differentiated from stocks page ("Use your edge. Not your $25K."). Active-verb opening (`Scale`) + reassurance closer (`risk`). Picked by Jason from a set of 10 candidates on 2026-05-26.

**Sub:** "Trade a $25K simulated options account with up to 20 contracts. Top performers graduate to live capital through T3 Global."

**Buttons:** "Get Funded →" (primary, anchors to `#plans`) and "See how it works →" (secondary, anchors to `#how-it-works-3step`).

**Ticks:** Weekly payouts · Up to 20 contracts · Real institutional routing

**Worst-case line:** "**Worst case:** you lose the eval fee. Never your savings."

**Hero image:** `assets/images/options-hero-chain.webp` (1672x941, ~37 KB WebP at quality 82). Live SPY options chain render with strikes, premiums, deltas, ATM strike highlighted in teal. Generated via GPT Image 2 from a structured JSON prompt (preserved in session transcript).

- `fetchpriority="high"` + `decoding="async"` on the img tag
- `<link rel="preload" as="image">` in `<head>` for LCP boost
- Mouse-follow 3D tilt + floor reflection inherited from stocks page CSS (cloned `.stx-hero__media` rules)
- Responsive variants: `options-hero-chain-1200w.webp` (25 KB), `options-hero-chain-800w.webp` (15 KB)

### 2.3 Trust Ticker (`.reassurance` / `.tf-ticker`)

Same homepage credibility ribbon, no changes from stocks page.

### 2.4 "What is funded trading?" orientation panel (`.stx-explain`) — LOW-AWARENESS

Same as stocks page (asset-class agnostic framing).

### 2.5 Empathy / Mission (`.stx-empathy`)

**Left column ("If you're here, you've already done the hard part"):**
> You can read the tape. You've sat through the bad fills, the bad days, the strategies that quietly worked once you stopped tweaking them. You've put in the screen time.
>
> But every position is still sized for a **$5K to $25K personal account**, and somewhere along the way it became obvious: the strategy isn't the problem. The size is.
>
> If that's where you are, you're not alone. Most of the options traders we fund were exactly here a year ago.

**Right column ("Why TradeFundrr exists"):**
> Capital isn't free. Retail options traders with real edges get parked behind small contract counts, retail margin treatment that crushes multi-leg setups, payment-for-order-flow execution that costs them on fills, and platforms whose options engines were bolted onto retail-equity infrastructure.
>
> We built TradeFundrr so an options trader with a working strategy can **size up beyond a retail-account contract count, trade with transparent rules, and follow a real graduation path** to T3 Global desk capital, without putting their savings on the line first.
>
> Your job is the trading. Our job is the capital, the infrastructure, and the runway.

**Difference from stocks page:** stocks talks about PDT rule + "small account sizes." Options drops PDT entirely (doesn't apply to options) and names options-specific frictions: small contract counts, retail margin on multi-leg, PFOF, retail platforms.

### 2.6 Did You Know callout (`.stx-didyou`)

> One disciplined options trader can move **seven figures of P&L per year** for an institutional desk. That's why we back individual traders with up to **$1M+ in real desk capital through T3 Global*** once they prove sustained edge.

Disclaimer: *Reserved for top-performing traders. Subject to T3 Global review and audition. Not all traders qualify.*

### 2.7 "Where the payouts actually come from" (`.stx-econ`) — LOW-AWARENESS

Same as stocks page.

### 2.8 Avatar — The Options Day Trader (`.stx-avatar`)

**Eyebrow:** "Built for the options day trader"

**Label:** "The Options Day Trader"

**Narrative:**
> You've been trading options on a retail account, 1 or 2 contracts at a time. The edge is there. The size isn't. Most retail options traders never escape that gap.
>
> You've been trading options on **$5K to $25K of personal capital**, 1 to 2 contracts per setup. You've built a real read on flow, real strategy work, real screen time. But every position is sized to a retail account, and every winning streak ends with the same realization: at this contract count, the math doesn't matter.
>
> A $0.50 winner on 2 contracts is $100. The same $0.50 winner on 20 contracts is $1,000. **Same edge. Different scale.** That's the gap TradeFundrr closes, with simulated capital you don't have to risk to access.

**Kicker:** "Your edge works. Your 2 contracts don't."

**Difference from stocks page:** stocks uses dollar math ("20% return on $25K vs $100K"), options uses contract math ("$0.50 winner on 2 vs 20 contracts").

### 2.9 "How it works in 3 steps" (`.stx-hiw3`) — LOW-AWARENESS

Three steps: Buy your seat → Trade on a $25K simulated options account with up to 20 contracts → Earn weekly payouts.

DXTrade platform mention preserved; Deep Charts removed (stocks-only).

### 2.10 Two Paths (`.two-paths`)

**Path 01 — Retail option:** Stocks routed through retail brokers with PFOF (kept — PFOF applies to options too).

**Path 02 — Earned:** $25K simulated funded options account, up to 20 contracts on real-time options data + institutional routing. Audition for T3 Global's actual options trading desk.

### 2.11 Plans (`.stx-plans` id="plans")

Three cards in render order. All visually styled identically to stocks page.

**Card 1 — Options Growth**
- Badge: "Eval path"
- Sub: "Best for options traders who want to prove themselves through a structured 2-stage evaluation at the lowest upfront cost."
- Claim: **$25K simulated options account** with up to 10 contracts per position. Hard breach on daily loss, $99 reset if you fail.
- Features:
  - $25K simulated account · **10 contracts** max position
  - 2-stage evaluation: Stage 1 → Stage 2 → Funded
  - Profit target · **$1,250**
  - Daily loss limit · $1,000 (**hard** breach)
  - Max drawdown · $3,000 EOD
  - Minimum hold time · **15 seconds**
  - **$99 reset fee** if you fail an eval stage
  - 80/20 split · weekly payouts
- Refund mark: ✗ (Eval fee not eligible for the rebate)
- Price: **$399** + $99/mo + $149 activation

**Card 2 — Options Express (featured "Most popular")**
- Badge: "Most popular"
- Sub: "Skip the evaluation entirely. Trade the funded account from day one, with a softer safety net on rough days and a higher contract limit."
- Claim: **$25K simulated options account** with up to **20 contracts** from day one. Soft breach on daily loss, rough days pause the session, not the account.
- Features:
  - $25K simulated account · **20 contracts** max position
  - No evaluation · trade day one
  - Profit target · **$1,250**
  - Daily loss limit · $1,000 (**soft** breach)
  - Max drawdown · $3,000 EOD
  - Minimum hold time · **15 seconds**
  - Earliest payout · 5 days
  - 80/20 split · weekly payouts
- Refund mark: ✓ ($800 of $899 rebated on first qualifying payout)
- Price: **$899** + $99/mo

**Card 3 — Pro Trader Funding**
- Badge: "Real capital"
- Sub: "For traders who already have the edge and the capital, and want to skip the evaluation entirely. Real-money buying power through T3 Global."
- Claim: **Up to $5M** at the entry-popular tier, scaling to **$20M+** at higher tiers. Capital-contribution model.
- Features:
  - Capital contribution from **$100K+**
  - Real-money buying power: **Up to $1M** (entry) → **$20M+** (top tier)*
  - No evaluation, no audition
  - **80%** profit split
  - Setup in as little as **5 days**
  - Custom tailored rules per trader
  - Available across stocks, options, and futures
- Refund mark: ⊖ (Real capital model, no rebate mechanism)
- Price: From **$100K+** /capital contribution
- CTA links to `pro-funding.html`

**About the rebate, in plain terms** explainer block sits below the cards (3 stacked rows, same structure as stocks page).

### 2.12 Comparison table (`.stx-compare`)

**Compare Growth and Express side-by-side.** Pro Trader is its own product class, not in this comparison.

Rows (in order):
- Path: Evaluation / Direct funded
- Signup cost: $399 / $899
- Monthly fees: $99/mo / $99/mo
- Reset fee: $99 to restart from Stage 1 / No reset (direct funded)
- **Max position size: 10 contracts / 20 contracts** ← this row replaces stocks page's "Buying power" row
- Daily loss limit: $1,000 / $1,000
- Breach type: Hard breach / Soft breach
- Max drawdown: $3,000 EOD / $3,000 EOD
- Min trade duration: 15 seconds / 15 seconds
- Profit target: $1,250 / $1,250
- Consistency rule: 30%** / 30%**
- Profit split: 80 / 20 (both)
- Payout caps: $1,000 → $1,500 → $2,000 → $25,000 / $2,000 → $2,500 → $3,500 → $25,000

Footnotes: activation-fee timing, consistency rule explanation, reset-fee scope.

### 2.13 "Your downside, capped" reframe (`.stx-cap`)

Two-card comparison: "Trading your own $25K" (full personal money at risk) vs "Express Funding eval ($899, your upfront cost is the ceiling)." Bullets updated to use rebate language. Personal-account bullet "PDT rule is gone, but capital math hasn't changed" replaced with "Retail account size caps your contract count, no matter how clean your edge."

### 2.14 Account Details accordion (`.stx-rules`)

Three tabs: **Options Growth** / **Options Express** / **Pro Trader Funding**.

Each panel uses the same accordion structure as stocks. Key options-specific rows:
- "Intraday buying power" (stocks) → "**Max position size**" (options): 10 contracts (Growth) / 20 contracts (Express)
- 15-second minimum hold rule preserved with "Which means: scalping is fine; pure HFT-style sub-second flips aren't allowed" plain-English
- Express signup-cost row description: "$800 evaluation fee (**rebated** with your first qualifying payout) + $99 first-month data access (**not rebated**)"

Multi-leg context added to the contract-size rows: "Applies across calls, puts, and multi-leg strategies (the contract cap is the total open exposure, not per leg)."

### 2.15 Platforms (`.stx-platforms` id="how-it-works")

**Single-platform framing** for options (Deep Charts is stocks-only).

- Eyebrow: "Platform · professional execution"
- H2: "The platform. **Built for options.**"
- Sub: "The same execution stack a professional desk uses. DXTrade, by the team behind tastyworks and thinkorswim."

Two-card grid:
- **Left card (text):** DXTrade name + tag "options · stocks". Features: Multi-leg ticket support / Real-time Greeks (Delta, Gamma, Theta, Vega) / Institutional execution speed / Chart-to-trade execution.
- **Right card (visual):** DXTrade platform screenshot at `assets/images/hero-options-reference.webp` (862x825, ~214 KB, TradeFundrr-branded interface). Caption: "DXTrade · TradeFundrr-branded interface"

### 2.16 Loss-Aversion three-stage (`.stx-loss`)

Three cards left→right showing the progression:
1. **Trading your own money** — $25,000 — "your ceiling" — *Every loss is your money. Every win is capped by how many contracts you can put on. Retail accounts pin you to 1-2 contracts at a time, no matter how clean your edge.*
2. **Funded options account** — 20 — "contracts simulated" — *Simulated funded options account with up to 20 contracts per position. Keep up to 80% of what you make. No personal capital tied up.*
3. **T3 Global desk** — $1M+ — "desk capital" — *Top performers earn a seat. Institutional infrastructure. Real fills.*

**Critical fix from stocks clone:** Card 2 was originally "$100,000 / simulated capital" (stocks leftover from 4× leverage on $25K). Options doesn't have that math — corrected to "20 / contracts simulated" so the progression now reflects contract capacity rather than dollar BP.

**Closer:** "Start at 20 contracts. **Earn your way to live desk capital.**"

### 2.17 T3 Global trust panel (`.stx-t3`) — LOW-AWARENESS

Standard T3 panel inherited from stocks/homepage. Includes the "Sim is sim. Live is live. T3 is live." brand catchphrase.

### 2.18 Featured Reviews (`.stx-reviews`)

Verbatim Trustpilot reviews (options-relevant comment in the dev comment).

### 2.19 Trustpilot summary panel (`.stx-tp`) — LOW-AWARENESS

Same as stocks page.

### 2.20 Founder Card (`.stx-founder`)

Same as stocks page.

### 2.21 Glossary (`.stx-gloss`) — LOW-AWARENESS

Same structure as stocks page glossary, with one critical swap:

**Removed:** PDT rule (Pattern Day Trader) entry — stocks-only, doesn't apply to options.

**Added:** Defined-risk options entry:
> Multi-leg options strategies where the maximum loss is known upfront and capped by the structure of the position itself. Verticals, iron condors, butterflies, and calendars are all defined-risk. Naked short options are not. TradeFundrr permits both, but defined-risk strategies tend to fit the program rules cleaner because the max loss is baked into the position.

Buying-power entry rewritten for options: "The dollar value of options exposure you can hold intraday. On TradeFundrr options accounts, exposure is gated by the contract limit (10 for Growth, 20 for Express) rather than a raw buying-power figure."

### 2.22 FAQ (`.stx-faq`)

8 decision-driving questions. Options-specific reframes:
- "Can I trade **options**, stocks, AND futures on one account?" (question reordered to lead with options)
- Growth-vs-Express answer uses rebate language: "Express ($899, $800 rebated on first qualifying payout)"
- Simulated-vs-real-money question now reads: "Options Growth and Options Express use **simulated funded accounts** sized at $25K with up to 10 (Growth) or 20 (Express) contracts per position."

### 2.23 More-X-Than-Y triplet (`.stx-morethan`)

Same triplet structure as stocks page.

### 2.24 Final CTA (`.stx-final`)

> Trade $25K of simulated options capital with up to 20 contracts. Keep up to 80% of what you make. Pass once, earn back your eval fee. Top performers graduate to live capital through T3 Global.

---

## 3. Options Program Parameters Reference

Source-of-truth table for the per-plan numbers used across the page:

| Field | Options Growth | Options Express | Pro Trader |
|---|---|---|---|
| Signup cost | $399 | $899 | $100K+ capital contribution |
| Monthly fee | $99 | $99 | n/a (real-money) |
| Reset fee | $99 (on stage failure) | n/a | n/a |
| Activation fee | $149 (after passing eval) | n/a | n/a |
| Simulated account size | $25,000 | $25,000 | (real capital, no sim) |
| Max position size | 10 contracts | 20 contracts | Custom |
| Daily loss limit | $1,000 (hard breach) | $1,000 (soft breach) | Custom |
| Max EOD drawdown | $3,000 | $3,000 | Custom |
| Min hold time | 15 seconds | 15 seconds | Custom |
| Profit target | $1,250 | $1,250 | n/a |
| Payout requirement | 5 days @ $250 | 5 days @ $250 | per desk agreement |
| Consistency rule | 30% | 30% | n/a |
| Profit split | 80 / 20 | 80 / 20 | 80 / 20 |
| Payout caps (progressive) | $1,000 → $1,500 → $2,000 | $2,000 → $2,500 → $3,500 | none |
| Max payout per request | $25,000 | $25,000 | per desk agreement |
| First-payout rebate | n/a | $800 of $899 signup | n/a |

If any of these change in the underlying product, update this table AND the corresponding values in the Plans cards, Comparison table, and Account Details accordion. Single source of truth lives in the offer documentation; this page reflects it.

---

## 4. Build History

**2026-05-26:** Page built from scratch by cloning `pages/stocks.html` and rewriting every section for options-specific content. Stocks-bleed audit found 26 candidate references; 4 fixed in body copy (PDT mentions in mission/cap card/loss-aversion/glossary), remaining 22 verified legitimate (mostly Pro Trader Funding context where "buying power" is correct).

Per Nadav 2026-05-26 weekly sync ask, the T3 trust panel and "Your downside, capped" reframe were preserved from the stocks clone — explicit Nadav request to mirror both onto the options page.

Hero image and DXTrade platform screenshot generated/sourced separately and dropped into `assets/images/`. Hero went through Concept 1 (options chain) vs Concept 2 (Iron Condor payoff) decision, with chain ultimately picked for the "real trading platform" credibility read.

---

## 5. Outstanding Items

- **Pricing-page sweep:** the homepage `100K Future Account` card points to `pages/pricing.html` (the futures page) — verify Futures Express rebate amount ($179) is reflected there as well.
- **About / Futures / Crypto rebuilds:** Nadav 2026-05-26 gaps #6 and #7 — still pending. Options page can serve as the template.

---

**End of options page design doc.**
