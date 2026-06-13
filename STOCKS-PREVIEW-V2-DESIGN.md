# TradeFundrr Stocks Preview v2 — Design + Messaging System

**Lives at:** `stocks-preview-v2.html` (the canonical preview going forward)
**Companion docs:**
- `STOCKS-PAGE-DESIGN.md` — the production stocks-page design (the live deployed system this preview is iterating on)
- `HANDOFF-2026-05-28.md` — latest session notes
- `HOMEPAGE-DESIGN-MESSAGING.md` — homepage system

**Built:** 2026-05-28 (capital-gap v3, time-tax, pricing, security-deposit upgrade pass)
**Status:** Preview / work-in-progress. Not promoted to production yet.
**Replaces:** `stocks-page-mockup-preview.html` (broken at 68 KB by an Edit-tool size-cap incident; v2 is the working file going forward)

**File size:** 103 KB
**Sections added this session:** 3 new (capital-gap v3, time-tax, pricing) + 1 upgrade pass (security-deposit graphic)
**Subdirectory:** `security-deposit-mockups/` — 4 design-direction explorations + AI base PNG + animation overlay

---

## CHANGELOG

### 2026-05-29 — Security-deposit redesign, full content migration, restyles, accordion FAQ

Big build session. The preview grew 110 KB → 175 KB. Summary (full detail in `HANDOFF-2026-05-29.md`):

1. **Security-deposit graphic replaced.** The pocket+vault `.pocket-viz` block is gone. Built 3 fresh animated concepts (Round Trip / Refund Stamp / Net to Zero) in `security-deposit-mockups/security-deposit-concepts-v3.html`; Jason chose **Refund Stamp**. Installed as the `.sd-*` premium "account statement" with line items that resolve, then a rotated **REFUNDED** stamp slams down (`@keyframes sdStampSlam`). Scoped under `.sd-stmt-card`, `.sd-row`, `.sd-stamp`. Reduced-motion rule updated to disable the slam.

2. **Full content migration from production (`pages/stocks.html`), everything except the competitor table.** New sections added (all copy/numbers pulled from production so they stay compliance-accurate): T3 Global trust block (+FINRA/SIPC), Growth vs Express comparison table (`.gx-table`), full per-plan rules accordion with working tabs (Growth/Express/Pro, `<details>` rows, "Which means", consistency example), business-model block, scale-math ("haven't proven you can scale"), "what funded trading actually means" 3-step, mission/did-you-know, trader's dictionary glossary, "What separates TradeFundrr" trio + Christian Bose pull-quote, risk-math "downside capped", and the legal disclosures + footer. New scoped prefixes: `.mig-*`, `.scale-*`, `.mission-*`, `.gx-*`, `.cap-*`, `.rules-*`, `.econ-*`, `.t3-*`, `.gloss-*`, `.sep-*`, `.fquote-*`, `.legal-disc`, `.sfoot`.

3. **FAQ rewritten + restyled.** The 11 placeholder questions were replaced with the 8 production decision-driving questions, then converted to a `<details>` **accordion** with the green left-bordered "which means" treatment from the old page (`.faq-acc`, `.faq-means` — mirrors the old `.stx-faq-means`).

4. **Two Paths + testimonials restyled to existing designs.** Two Paths now uses the production design (Them/Us `.contrast-row`s, animated `.two-paths__arrow`, "Earned" badge, CTA + footnote). Testimonials now use the homepage `.featured-reviews` design AND the fabricated quotes were replaced with **6 real verbatim Trustpilot reviews** (compliance win).

5. **Copy fixes.** Closing CTA "Start trading with ours" → "Start trading our capital" (the old line read as "our savings"). The "Until now" pivot box label "A third option" → "The path that didn't exist" (the section sets up *no* option, so "third" miscounted).

6. **Compliance review (not yet applied).** A full marketing-compliance pass flagged ~11 issues (4 critical) — see `TradeFundrr-Stocks-Page-Compliance-Review.pdf`. The worst share one root: the page promises an unconditional "fee refunded when you pass / risk nothing" deal that the rebate callout and disclosures contradict. The PDT-rule "repealed" claim is also currently inaccurate. **These fixes are still pending.**

### 2026-05-28 — Capital-gap v3, time-tax, pricing, security-deposit upgrade

Five connected changes that build the emotional + financial argument for funded trading:

1. **Capital-gap section rebuilt to v3.** Replaced the old stick-figure-and-money-pile SVG block with an isometric pile system: diamonds-quote pull at the top ("Most traders quit right before they strike the diamonds"), centered VS divider, two isometric piles (left = 5K, right = 100K with 12 stacked bills + glowing top bill), 100% return vs 5% return result blocks with count-up percentages, then a closing stat-row (100% / 5% featured / 80/20 profit split) and an insight closer.

2. **Headline tone correction.** "Something is quietly murdering your gains potential" → "Something is quietly stealing your gains." The "murdering" verb read as melodramatic for a regulated prop firm. "Stealing" keeps the emotional pull while leaning more institutional.

3. **Capital-gap → time-tax bridge added.** Closing insight rewritten to tease "a second problem most traders never see coming" — sets up the time-tax section that follows.

4. **Time-tax section ported.** New section immediately after capital-gap. Hockey-stick canvas chart: red line = $5K compounded over 5 years (slow grind, crosses $100K only at end of Year 5), teal line = TradeFundrr starts at $100K from Day 1 (wavy growth to $200K+). Gold dashed threshold line at $100K marks "$3K-5K/mo income threshold." Annotations fade in at end of animation. Closes with "It's not just a capital gap. It's a time gap" — mirrors the capital-gap closer.

5. **Pricing section built.** Three-card grid (Growth $399 + $99/mo + $149 activation / Express $899 + $99/mo with $800 first-payout rebate [featured] / Pro Trader from $100K+ contribution) plus the "About the rebate, in plain terms" callout box explaining what's rebated and what isn't (Express ✓ / Growth ✗ / Pro ⚊). Inserted between the "Until TradeFundrr" pivot and "How it works."

6. **Security-deposit graphic upgrade.** Rebuilt the pocket+vault SVG: wider/flatter denim-pocket silhouettes (vs. the old rounded boxes that read as headstones), proper currency-design bill (corner numerals, decorative inner borders, TF seals), vault with depth shading + combination dial + corner rivets + HELD bar, +FIRST PAYOUT badge with glow + sparkle particles, 10s slower animation choreography with settle + lock + glow + return beats.

7. **Security-deposit design-exploration alternatives.** Four full standalone mockups built in `security-deposit-mockups/`:
   - **A — Hands + Safety Deposit Box:** stylized hands offering/receiving the bill, glass safety-deposit box in the middle with "HOLDING" stamp during hold phase, bonus envelope on return
   - **B — Type-driven institutional:** three big-type cards, status stamps PAID / HELD / RETURNED, no illustration
   - **C — Isometric 3D:** isometric trading desk → vault → trading desk (Stripe/Linear/Ramp visual language)
   - **D — Polished current pocket+vault:** lowest-risk evolution of the existing concept

   Jason chose to AI-generate a base image from the image-only JSON prompt (compliance-safe — "SECURED" replaces "HELD IN ESCROW" since TradeFundrr is not running a regulated escrow), then animate it.

8. **`security-deposit-animated.html` built.** Animation overlay using the AI-generated `security-deposit-base.png` as a static base layer, with a navy mask hiding the bill baked into the image and an animated CSS/SVG bill that flies left pocket → vault → right pocket on a 10s loop. +FIRST PAYOUT badge fades in below the right pocket on return.

---

## 1. Brand System (shared across all new sections)

### 1.1 Color tokens

| Token | Hex | Usage |
|---|---|---|
| `--bg` | `#060914` | Page background (dark navy) |
| `--teal` | `#22d3a8` | Primary accent — brand color, used for headlines/buttons/badges |
| `--warn` | `#FF5F5F` | Warning/loss state (red return needed, scared-money emotional cost) |
| `--gold` | `#ffd54f` | Threshold/income marker (time-tax $100K line, profit split 80/20 stat card) |
| `--border` | `hsla(0, 0%, 100%, 0.08)` | Card hairline borders |
| `--white-72` | `hsla(0, 0%, 100%, 0.72)` | Primary body text |
| `--white-55` | `hsla(0, 0%, 100%, 0.55)` | Secondary text, captions |
| `--white-45` | `hsla(0, 0%, 100%, 0.45)` | Tertiary text, labels |

Brand teal `#22d3a8` is THE preview's identity. Anywhere you need a callout, link, accent, or status pill — use teal first, gold only for special highlights (threshold lines, profit-split stat), warn only for the explicit loss/risk states.

### 1.2 Typography

Two font families. No serifs. The preview deliberately avoided Playfair Display from the source material because the rest of the page sits in Inter + Geist Mono and a serif accent would clash.

| Family | Source | Usage |
|---|---|---|
| `'Inter'` (300–900) | Google Fonts | All body text, headlines, large display numerals |
| `'Geist Mono'` (400–700) | Google Fonts | Eyebrows, step labels, stat labels, status pills, captions inside cards, bill numerals |

**Source-material font mapping (for porting more uploaded HTML files into the preview):**

| Source file font | Preview file font | Notes |
|---|---|---|
| Playfair Display 700–900 (italic + roman) | Inter 700–900 italic for emotional accents | Drop the serif entirely; use italic Inter for the same emotional weight |
| JetBrains Mono 400–700 | Geist Mono 400–700 | Direct swap, same vibe |
| Inter (already in source) | Inter | Pass through |

### 1.3 Source-material color mapping

| Source | Preview | Notes |
|---|---|---|
| `#1de9b6` (uploaded teal) | `#22d3a8` (brand teal) | All teal accents |
| `#e53935` / `#ef5350` (uploaded crimson) | `#FF5F5F` (brand warn) | All red/loss states |
| `#ffd54f` (gold) | `#ffd54f` | Pass through, used identically |
| `#050810` (uploaded bg) | `#060914` (brand bg) | Subtle navy shift |

### 1.4 CSS class scoping convention

Each new section's CSS is scoped under a 2-3 letter prefix to prevent collisions:

| Prefix | Section |
|---|---|
| `.cg-*` | Capital gap (v3) — diamonds quote, isometric piles, stat row |
| `.tt-*` | Time tax — hockey-stick chart, callouts, closing |
| `.price-card`, `.rebate-callout`, `.rebate-row` | Pricing — 3 program cards, rebate callout |
| `.pk*`, `.pocket-*`, `.sd-*` | Security deposit — pocket+vault, animated overlay |

When adding new sections in future sessions, follow the same pattern — pick a unique prefix and scope all classes under it.

---

## 2. Section Architecture (in render order, top to bottom)

The preview file's section list (line-numbered from `stocks-preview-v2.html`):

Updated render order as of 2026-05-29 (⭐ = added 05-29, 🔄 = changed 05-29):

1. Sticky mockup banner (preview-only)
2. Sticky nav bar
3. **Hero** — "Stop trading your money. Start trading ours."
4. **Credibility ticker** — 7-item auto-scroll
5. **"The truth most traders figure out too late"** — capital-gap narrative intro
6. **Capital-gap visual (v3)**
7. **Time-tax visual**
8. **"Built for the equity day trader"** — scale math, the 20% problem ⭐
9. **"What keeps you stuck"** — scared-money emotional cost
10. **"Until now…" pivot** — box label now "The path that didn't exist" 🔄
11. **"What funded trading actually means"** — 3-step explainer ⭐
12. **"Why TradeFundrr exists / Did you know"** — mission ⭐
13. **Pricing section (3 programs + rebate callout)**
14. **"Compare Growth and Express"** — per-rule table (`.gx-table`) ⭐
15. **"Risk math, plain — your downside, capped"** ($25K vs $899) ⭐
16. **"How it works · 3 steps"** — Pass → Get paid → Optionally graduate
17. **Security-deposit graphic — Refund Stamp** (`.sd-*`) 🔄 REPLACED (was pocket+vault)
18. **Full per-plan rules accordion** — Growth/Express/Pro tabs + "Which means" ⭐
19. **Business model** — "Where the payouts actually come from" ⭐
20. **Two paths · one mission** — production restyle: Them/Us, animated arrow, Earned badge 🔄
21. **T3 Global institutional partner** — + FINRA/SIPC ⭐
22. **"Here's what you're really choosing between"** — own-vs-ours 10-row table
23. **DXTrade + Deep Charts** — platform cards
24. **Testimonials** — homepage `featured-reviews` design, 6 real Trustpilot reviews 🔄 RESTYLED
25. **Trader's dictionary glossary** — 9 terms ⭐
26. **FAQ** — 8 decision-driving Qs, `<details>` accordion + green "which means" 🔄 REPLACED
27. **"What separates TradeFundrr"** trio + Christian Bose pull-quote ⭐
28. **Closing CTA** — "Stop risking your savings. Start trading our capital." 🔄
29. **Footer** ⭐
30. **Legal disclosures** — General / Risk / CFTC hypothetical / Testimonial ⭐

---

## 3. Capital-gap section (v3) — `.cg-*`

### 3.1 Structural overview

Three vertical blocks inside the section:

1. **Header trio** — `.cg-eyebrow` ("The retail trader's hidden handicap, exposed") + `.cg-headline` ("Something is quietly stealing your gains") + `.cg-sub` (one sentence framing)
2. **Diamonds pull-quote** — `.cg-quote` with a small diamond SVG icon + italic Playfair-style quote + body copy
3. **Main viz card** — `.cg-card` containing:
   - **`.cg-vs`** — centered vertical divider with "VS" label (scoped to span only `.cg-compare`, NOT extending into the closing stat row below)
   - **`.cg-compare`** — 2-column grid: left = $5K account, right = $100K buying power
   - **`.cg-pile`** — isometric SVG with stacked bills + stick figure (5 bills on left, 12 bills on right)
   - **`.cg-result`** — count-up percentage block (100% / 5%) + return-to-make caption + $5,000 result + badge
   - **`.cg-closing`** — stat-row (100% reality / 5% featured / 80/20 profit split) + closing insight ("It's not a skill gap. It's a capital gap.")
4. **`.cg-strip`** — bottom badge row ($100K Buying Power / 80/20 Profit Split / Evaluation Fee Refunded on Pass)

### 3.2 Animation choreography

| Time | Element | Animation |
|---|---|---|
| 0s | Section enters viewport | IntersectionObserver fires `.is-running` on `.cg-card` |
| 0–1.7s | Bills cascade in | `.cg-anim-bill` with `transition-delay` from 0.2s to 1.7s — bills appear bottom-up, slight stagger between sides |
| 2.8s | Left stick figure resolves | `.cg-anim-fig` scales up from 0.82, opacity 0→1 |
| 3.2s | Right stick figure resolves | Same as left but starting from a different scale baseline |
| 3.4–3.8s | Result blocks fade up | `.cg-anim-block` slide up + fade in |
| 3.5–5.9s | Left percentage counts | `countUp(leftEl, 100, 2400)` — eased cubic over 2.4s, 0% → 100% |
| 3.9–4.7s | Right percentage counts | `countUp(rightEl, 5, 800)` — eased cubic over 0.8s, 0% → 5% |
| 4.6s | Closing stat row appears | `.cg-anim-block` with delay |
| 5.2s | Bottom strip appears | Final element to resolve |
| 6.8s | All animations lock | `.is-final` added, `opacity: 1 !important; transform: none !important` |

### 3.3 Locked content

- **Eyebrow:** "The retail trader's hidden handicap, exposed"
- **Headline:** "Something is quietly **stealing your gains**" (em-italic-warn on the second line)
- **Sub:** "It's not your emotions. Not your strategy. Not your experience. The single biggest thing holding most retail traders back is something almost nobody talks about, and it has nothing to do with skill."
- **Diamonds quote:** "Most traders quit right before they strike the diamonds." → body: "They grind for years, put in the hours, build the skills, then quit because a small account makes meaningful profits feel **impossible**. The diamonds were always there. The only thing missing was **capital**."
- **Closing h3:** "It's not a skill gap. It's a **capital gap.**" — `<span class="accent">capital gap.</span>`
- **Closing p (BRIDGE TO TIME-TAX):** "But the capital gap creates a **second** problem most traders never see coming."
- **Bottom strip badges:** `$100K Buying Power` / `80/20 Profit Split` / `Evaluation Fee Refunded on Pass`

---

## 4. Time-tax section — `.tt-*`

### 4.1 Structural overview

1. **Header trio** — `.tt-eyebrow` ("The retail trader's time tax, exposed") + `.tt-headline` ("Most traders quit *before it gets good*") + `.tt-sub` + `.tt-body` × 2 (paragraph framing)
2. **Main viz card** — `.tt-card` containing:
   - **`.tt-compare`** — 3-column grid: left chart / VS divider / right chart
   - **`.tt-chart-col`** with chart label + chart amount + `<canvas>` for the line chart + `.tt-callout` (warn for left, teal for right)
   - **`.tt-vs-col`** — vertical VS divider (`.tt-vs-line` + `.tt-vs-label`)
   - **`.tt-closing`** — h3 ("It's not just a capital gap. It's a **time gap.**") + 3 paragraphs of closing copy
3. **`.tt-strip`** — bottom badges (Trade $100K from Day 1 / Cash Out from Week 1 / Skip 5 Years of Grinding)

### 4.2 Chart spec

- **Canvas resolution:** scaled to `window.devicePixelRatio` for crisp retina rendering
- **Margins:** left 54, right 18, top 16, bottom 36
- **Y-axis ticks:** $0 / $25K / $50K / $75K / $100K / $150K / $200K
- **X-axis labels:** Year 1 / Year 2 / Year 3 / Year 4 / Year 5
- **Grid lines:** teal at 5% opacity, vertical lines at year boundaries at 4% opacity
- **Threshold line:** dashed gold at $100K with a "$3K-5K/mo income threshold" label pinned at top-left of the threshold

**Left line (Trading your own money):**
- Color: `--warn` `#FF5F5F`
- Data: `[5000, 5500, 6000, 6500, 7000, 7500, 8200, 9000, 10000, 11500, 13000, 15000, 18000, 22000, 28000, 35000, 45000, 60000, 80000, 100000]`
- Annotations (fade in at 88% progress):
  - "Most traders quit here" — Year 2 flat zone, red callout arrow
  - "Finally big enough to earn $3K-$5K/mo" — Year 5 endpoint, gold callout arrow

**Right line (TradeFundrr funded account):**
- Color: `--teal` `#22d3a8`
- Data: `[100000, 95000, 108000, 102000, 115000, 110000, 125000, 118000, 135000, 128000, 150000, 142000, 162000, 155000, 178000, 168000, 190000, 182000, 205000, 220000]`
- Annotations:
  - "Earning $3K-$5K/mo from Week 1" — start of line, teal callout arrow
  - "Scale to $200K+" — endpoint, teal callout arrow

### 4.3 Animation choreography

- **Trigger:** IntersectionObserver fires when `.tt-card` reaches 15% visibility
- **Duration:** 2800ms (`DURATION` constant)
- **Easing:** custom cubic — `progress < 0.5 ? 2*p*p : 1 - Math.pow(-2*p+2, 2)/2`
- **Draw loop:** `requestAnimationFrame(animate)` redraws BOTH charts on every frame, progressing the data-point count from 2 to 20
- **Final state:** `.is-final` class added; `.tt-anim-block` callouts fade up via CSS transitions
- **Resize handler:** debounced 150ms, redraws both charts at progress=1 on viewport resize

### 4.4 Locked content

- **Eyebrow:** "The retail trader's time tax, exposed"
- **Headline:** "Most traders quit *before it gets good*" (em-italic-warn on second line)
- **Sub:** "It's not just about capital. It's about TIME."
- **Body 1:** "Here's what nobody tells you about trading your own money. Even the **SUCCESSFUL** ones don't make life-changing income until Year 4 or 5. A $5K account, even compounding steadily, takes **YEARS to grow big enough** to generate $3K-$5K/month. You need $50K-$100K in your account before the math even works."
- **Body 2:** "Most people tap out long before the hockey stick hits."
- **Left callout title:** "⚠ The 5-Year Grind"
- **Right callout title:** "✓ Skip the grind"
- **Closing h3:** "It's not just a capital gap. It's a **time gap.**"
- **Bottom strip badges:** `Trade $100K from Day 1` / `Cash Out from Week 1` / `Skip 5 Years of Grinding`

---

## 5. Pricing section — `.price-card`, `.rebate-callout`

### 5.1 Structural overview

1. **Eyebrow + h2 + lead** — standard section header pattern
2. **`.price-grid`** — 3-column grid (`grid-template-columns: repeat(3, 1fr)`, gap 20px)
   - 3 cards: Growth (left) / Express featured (middle, elevated) / Pro Trader (right)
3. **`.rebate-callout`** — explanation box with 3 rows (Express ✓ / Growth ✗ / Pro ⚊)

### 5.2 Card spec

Each `.price-card` has:

- **`.price-card__eyebrow`** — Geist Mono caps with a leading dot ("Eval path" / "Most popular" / "Real capital")
- **`.price-card__title`** — 22px Inter 700 ("Growth Account" / "Express Funding" / "Pro Trader Funding")
- **`.price-card__tag`** — 14px Inter 400, 72%-white, 1-sentence positioning
- **`.price-card__hi`** — Glass-dark inset highlight box with the buying-power claim
- **`.price-card__list`** — bulleted feature list with teal `→` glyph as marker
- **`.price-card__rebate`** — colored status pill: `.no` (red ✗) / `.yes` (teal ✓) / `.na` (gold ⚊)
- **`.price-card__price`** — Geist Mono large value + small `<small>` second line
- **`.price-card__cta`** — pill button

**Featured card (`.price-card--featured`) treatment:**
- Background: `linear-gradient(180deg, rgba(34,211,168,0.07) 0%, rgba(34,211,168,0.02) 100%)`
- Border: teal-shifted
- Transform: `translateY(-6px)` to lift visually
- Box-shadow: teal glow `0 24px 60px -24px rgba(34,211,168,0.18)`
- Top-edge teal gradient line via `::before`
- CTA inverted: solid teal background, dark-teal text (vs. ghost-style on the non-featured cards)

### 5.3 Locked content (build-sheet v2 numbers)

| Card | Price | Monthly | Other fees | Buying power | Daily loss | Breach | Drawdown | Rebate |
|---|---|---|---|---|---|---|---|---|
| Growth Account | $399 | $99/mo | $149 activation | $100K (4× on $25K) | $1,000 | Hard | $3,000 EOD | ✗ Not eligible |
| Express Funding (featured) | $899 | $99/mo | — | $100K (4× on $25K) | $1,000 | Soft | $3,000 EOD | ✓ $800 of $899 on first qualifying payout |
| Pro Trader Funding | from $100K+ contribution | — | — | up to $1M (entry) → $20M+ | Custom | Custom | Custom | ⚊ No rebate mechanism (real capital model) |

### 5.4 Rebate callout — the legal cover

Three rows, each with a status icon and a paragraph:

- **✓ Express Funding** — "Eligible for the **$800 first-payout rebate**. Pass the eval and earn a qualifying payout, and $800 of your $899 signup is rebated as part of that payout. The $99 first-month data access fee is **not** rebated. Ongoing monthly platform fees ($99/mo) are **not** rebated. **Earning a qualifying payout depends on your trading performance and is not guaranteed.**"
- **✗ Growth Account** — "No rebate applies. The $399 eval fee is **not** rebated. If you fail a stage, the $99 reset fee lets you restart from Stage 1 (the reset is a re-entry, not a rebate). The $149 activation fee and the $99/month platform fee are also **not** rebated."
- **⚊ Pro Trader Funding** — "Real-money trading via capital contribution. There is no eval fee, so **no rebate mechanism applies**. Your contributed capital remains your capital, subject to trading P&L per the desk agreement."

The non-guarantee language ("Earning a qualifying payout depends on your trading performance and is not guaranteed") is **legally required** per the homepage Nadav 2026-05-26 gap #4 cleanup. Do not strip it.

---

## 6. Security-deposit graphic — `.pocket-viz`, `.sd-*` (alternates)

### 6.1 Current state

The live `stocks-preview-v2.html` still contains the original `.pocket-viz` SVG section (upgraded this session to the better pocket+vault treatment). Four alternative design directions exist as standalone files in `security-deposit-mockups/`, and a fifth file (`security-deposit-animated.html`) is the leading candidate for production install — it uses an AI-generated PNG as the visual base + a CSS/SVG animated overlay for the bill flight.

### 6.2 Design directions (parked for Jason's final pick)

| File | Direction | Strengths | Risks |
|---|---|---|---|
| `A-hands-safe.html` | Hands + safety deposit box | Most narrative (YOU offer → WE hold → YOU receive); +bonus envelope on return | Hand SVGs are abstract, could read cartoonish |
| `B-typography.html` | Type-driven institutional | Most brand-appropriate; reads like a financial document; mobile-stacks beautifully | No illustration moment — less visually arresting |
| `C-isometric.html` | Isometric 3D (Stripe / Linear / Ramp style) | Most modern fintech feel; matches industry-leader visual language | Higher production effort; isometric done at SVG fidelity can feel handmade |
| `D-polish.html` | Polished current pocket+vault | Lowest risk; preserves the existing metaphor with proper execution | Pocket metaphor leans casual for a regulated prop firm |
| `security-deposit-animated.html` | AI image base + CSS animation overlay | Best of both worlds — high-quality art direction + animation | Bill positioning depends on pixel-precise alignment; requires manual nudges |

### 6.3 `security-deposit-animated.html` spec

**Layers (z-index ascending):**

1. `<img class="sd-base">` — `security-deposit-base.png` (1672×941, AI-generated). Contains the static scene: pockets, vault, dial, step labels, owner labels, connectors, "SECURED" bar.
2. `.sd-vault-mask` — solid navy rectangle (`#060914`) positioned at `left: 36%, top: 28%, width: 28%, height: 27%`. Covers the bill baked into the AI image so the vault appears empty when the animated bill is elsewhere.
3. `.sd-bill` — CSS-positioned SVG bill (16% wide, aspect 120:56). Always visible (`opacity: 1`). Animated via `@keyframes sd-billFlight`.
4. `.sd-payout` — `+ FIRST PAYOUT` pill positioned under the right pocket. Fades in at the end of the loop.

**Animation choreography (`@keyframes sd-billFlight`, 10s loop):**

| Time | Bill position | Bill state |
|---|---|---|
| 0–0.9s | Left pocket (`left: 6%, top: 40%`) | Rest |
| 0.9–1.6s | Flying left → vault (apex at `left: 24%, top: 33%`, `rotate(-5deg)`) | Arc up + tilt |
| 1.6–2.5s | Arriving at vault | Settle |
| 2.5–6.4s | **In vault** (`left: 43%, top: 40%`) | HOLD — visible throughout |
| 6.4–7.2s | Flying vault → right pocket (apex at `left: 68%, top: 33%`, `rotate(5deg)`) | Arc up + tilt |
| 7.2–8.4s | Arriving at right pocket (`left: 84%, top: 40%`) | Settle |
| 8.4–10s | Right pocket rest | Final state; `+ FIRST PAYOUT` pill fades in |
| Loop | Returns to 0% | — |

**+ FIRST PAYOUT badge (`@keyframes sd-payoutPop`):**

- 0–83%: hidden (`opacity: 0; scale(0.6); translateY(10px)`)
- 88–96%: visible + slight overshoot (`opacity: 1; scale(1.06); translateY(0)`)
- 100%: settled (`opacity: 1; scale(1)`)

**Position tuning (CSS percentages, relative to the scene container's aspect-locked box):**

- Left pocket bill landing: `left: 6%`
- Vault transit/hold position: `left: 43%`
- Right pocket bill landing: `left: 84%`
- Vertical baseline: `top: 40%`
- Mid-flight arc apex: `top: 33%`
- Badge: `left: 73%, top: 82%, width: 24%`
- Vault mask: `left: 36%, top: 28%, width: 28%, height: 27%`

These percentages were tuned empirically against the specific AI image. If the image is regenerated, the mask + landing positions will need re-tuning.

### 6.4 Locked content

- **Eyebrow:** "Pass the evaluation · we return the fee"
- **Headline:** "It's not a fee. **It's a security deposit.**"
- **Lead:** "You pay an evaluation fee to enter. When you pass, we return it. The only way you lose money is if you don't pass. And even then, you can retake it."
- **Caption:** "$1,499 in. **$1,499 back when you pass.** Plus your first payout. The only way it stays with us is if you don't pass."

### 6.5 Compliance-safe language list

The following words/phrases were **deliberately avoided** in the security-deposit visual at Jason's direction:

- ❌ "Rebate" — Christian compliance constraint, used only for the pricing section's `$800 rebate` language with the non-guarantee disclaimer
- ❌ "Held in escrow" — TradeFundrr is not running a regulated escrow. The vault bar reads "SECURED" instead
- ❌ "Refund" — replaced by "rebate" sitewide per HANDOFF-2026-05-26

If a future copywriter pushes back on "SECURED," safer alternatives are: `IN DEPOSIT` / `HELD` (just the word, no "in escrow") / a visual lock icon with no text at all.

---

## 7. Component inventory (cross-section)

### 7.1 Section header pattern

Every new section uses this 3-line stack:

```html
<span class="eyebrow">Mono-caps teaser line</span>
<h2 class="h2">Headline with <span class="accent">teal accent</span></h2>
<p class="lead">Lead paragraph in 72%-white.</p>
```

`.eyebrow`, `.h2`, `.accent`, `.lead` are page-level utilities defined in the top of the inline `<style>`. Don't re-scope these per section.

### 7.2 Card hairline pattern

Standard card styling used by capital-gap card, time-tax card, pricing cards, security-deposit card:

```css
background: rgba(255,255,255,0.025);   /* glass-dark fill */
border: 1px solid var(--border);        /* hairline */
border-radius: 4–16px;                  /* 4 for serious data, 14 for content cards */
position: relative;
overflow: hidden;
```

Optional teal top-edge gradient via `::before` for emphasis cards:

```css
&::before {
  content: '';
  position: absolute; top: 0; left: 10%; right: 10%; height: 1px;
  background: linear-gradient(90deg, transparent, rgba(34,211,168,0.4), transparent);
}
```

Optional radial inner glow via `::after`:

```css
&::after {
  content: '';
  position: absolute; inset: 0;
  background: radial-gradient(ellipse 70% 40% at 50% 0%, rgba(34,211,168,0.04) 0%, transparent 60%);
  pointer-events: none;
}
```

### 7.3 Animation trigger pattern

All scroll-triggered animations use IntersectionObserver with `threshold: 0.15–0.2`, scoped to a single IIFE per section, with a `started` guard flag. Single `setupTrigger(selector, finalDelay)` helper at the bottom of the script handles the simple cases; more complex animations (time-tax canvas chart, capital-gap count-ups) have their own bespoke IIFE.

The lock-in pattern uses `.is-final` (or `.final` in older sections) class that, when added, applies `opacity: 1 !important; transform: none !important;` to all animated elements — this is the belt-and-suspenders fix for the animation-shorthand-resets-animation-fill-mode CSS quirk.

---

## 8. Known issues + parked decisions

### 8.1 stocks-page-mockup-preview.html (broken)

The original preview file was truncated at 68 KB by the Edit-tool size cap incident. It contains content through the mid-comparison-table row. **Do not edit it.** All new work goes into `stocks-preview-v2.html`. Once v2 is signed off, the broken file can be archived or deleted.

### 8.2 Bill landing precision (security-deposit animation)

The animated bill's final landing position in the right pocket was tuned to `left: 84%` after multiple iterations. Jason flagged it as still slightly left of center at the most recent ping. A 1-2% nudge right may finalize it. The position is controlled by these two keyframe lines in the `@keyframes sd-billFlight`:

```css
72%       { left: 68%;   top: 33%; transform: rotate(5deg); }
80%, 100% { left: 84%;   top: 40%; transform: rotate(0);    }
```

Increase `84%` to `85%` or `86%` to nudge right. Increase `68%` proportionally (e.g. to `70%`) so the arc apex shifts with the landing.

### 8.3 Production install of the security-deposit graphic

The current preview still has the old `.pocket-viz` SVG inline. The animated PNG-based version (`security-deposit-animated.html`) is the candidate for production install. To install:

1. Copy the `<div class="sd-scene">` markup from `security-deposit-animated.html` into `stocks-preview-v2.html` in place of `<div class="pocket-viz" id="pocketviz">...</div>`
2. Copy the `.sd-*` CSS rules and `@keyframes` into the inline `<style>` block (after the existing `.pocket-viz` rules; remove or comment out the old rules)
3. Copy the JS IIFE from `security-deposit-animated.html`'s `<script>` into the existing script block
4. Move `security-deposit-base.png` from `security-deposit-mockups/` into `assets/images/` (or wherever the production asset path is) and update the `<img src="">` accordingly

Verify image loads, animation starts on scroll-into-view, and the bill lands centered in both pockets after the move.

### 8.4 FAQ rewrite (parked)

The 11-question FAQ in the preview is placeholder content. Per the live-page audit, the 8 questions on the production page are stronger (hard vs soft breach with example, consistency rule with example math, sim vs real capital, Path 02 graduation, etc.). HANDOFF-2026-05-28 has the punch list.

---

## 9. References

- **Built from:** `tradefundrr-capital-gap-v3 (1).html`, `tradefundrr-time-tax (2).html` (Jason-uploaded design files)
- **Audited against:** `https://tradefundrr-main-site.vercel.app/pages/stocks` (production live page)
- **Numbers locked from:** `futures-programs-build-sheet.html` (build-sheet v2, never modified)
- **Christian's design brief:** `TF Website May 2026 - Stocks and Options Inner pages.pdf`
- **Christian's meeting note:** `01 Meetings/2026-05-28 - Jason × Christian.md`
- **Daily activity log:** `09 Daily Notes/2026-05-28.md`
- **Session handoff:** `HANDOFF-2026-05-28.md`
