# TradeFundrr Stocks Page — Design + Messaging System

**Lives at:** `pages/stocks.html` (production) and `stocks-redesign-preview.html` (preview)
**Deployed:** `https://tradefundrr-main-site.vercel.app/pages/stocks`
**Companion docs:** `HOMEPAGE-DESIGN-MESSAGING.md` (homepage), `HANDOFF-2026-05-25.md` (session notes)
**Built:** 2026-05-24 → 2026-05-25
**Sections:** 22 (Hero → Trust Ticker → Empathy → Did You Know → Avatar → Two Paths → Plans → Account Details → Platforms → Loss Aversion → T3 Trust → Reviews → Trustpilot → Founder → Glossary → FAQ → More-X-Than-Y → Final CTA → Legal Disclosure)

---

## 1. Page Purpose

The stocks page targets **equity day traders** at the moment they're deciding whether to fund through TradeFundrr or stay at retail brokerages. It also serves as a **low-awareness onramp** for visitors who landed via a Google ad without knowing what "funded trading" means.

Two reader profiles are intentionally addressed:
- **Mid-aware (primary):** "I'm a retail day trader with $5-25K, my edge works, my account doesn't." Page speaks directly to the math of small accounts (avatar, loss-aversion, plans).
- **Low-aware (secondary):** "I'm exploring day trading or prop firms, what is this?" Page opens with orientation panel + jargon glossary + 3-step explainer.

---

## 2. Section Architecture (in render order)

### 2.1 Header / Navigation

Same as homepage. Nav loads from `../assets/css/main.css` and uses the standard sticky-on-scroll behavior.

### 2.2 Hero (`.stx-hero`)

**Layout:** 2-column grid (text 1.05fr | media 1fr), max-width 1320px, 180px top padding.

**Visual:**
- 38 floating sparkles in the background with float-drift animation (each sparkle has its own `--dur` and `--delay` CSS custom property)
- Hero media is a real-time-data charting platform mockup with mouse-follow 3D tilt (CSS perspective + rotateY on mousemove)
- Floor reflection via `-webkit-box-reflect`

**Copy:**
- Eyebrow: "Funded stock trading · T3 Global infrastructure"
- Headline: "**Use your edge.** Not your $25K." (teal accent on second line)
- Subhead: "Trade a $100K simulated equity account with transparent rules. Top performers graduate to live capital through T3 Global."
- Primary CTA: "Get Funded →" → `#plans`
- Secondary CTA: "See how it works →" → `#how-it-works-3step` (the 3-step explainer section)
- Ticks: Weekly payouts · $100K simulated buying power · Real institutional routing
- **Worst-case reassurance line:** *"Worst case: you lose the eval fee. Never your savings."* (added during low-awareness pass)

**Sparkle animation pattern:** see `.stx-hero__sparkles span` CSS. Each sparkle does both opacity twinkle AND translateY float in a single combined keyframe (`stxTwinkle`). Per-sparkle `--dur` between 3.6s-5.6s prevents synchronized pulsing.

### 2.3 Trust Ticker (`.reassurance` / `.tf-ticker`)

Ported verbatim from homepage. Continuously scrolling list of credibility highlights (Growing Community / Consistent Payouts / Scalable to $1M+ / T3 Partnership / Weekly Payout Cycle / Multiple Markets). Items repeat for seamless loop. Pauses on hover.

**Outstanding:** These claims are abstract. Need real numbers ("3,400+ funded traders" instead of "Growing Community") for stronger conversion. See HANDOFF-2026-05-25.md Outstanding Items.

### 2.4 "What is funded trading?" orientation panel (`.stx-explain`) — LOW-AWARENESS

**Purpose:** orients the visitor before the Empathy section assumes they're already a trader.

**Layout:** 3 cards (01, 02, 03 numbered), each with a number + headline + paragraph.

**Copy:**
- 01 — You trade a $100K simulated account
- 02 — The payouts are real money
- 03 — Top performers earn real desk capital

Closer: "**The point:** you prove you can trade with someone else's risk, then we put real firm capital behind you when you do."

### 2.5 Empathy / Mission (`.stx-empathy`)

**Layout:** 2-column grid, each column with eyebrow + h3 + 3 paragraphs.

**Copy:**
- Left column ("If you're here, you've already done the hard part"): "You're **not the only trader** stuck at the same ceiling." Empathetic copy about the strategy working but the account being too small. Closes with "you're not alone."
- Right column ("Why TradeFundrr exists"): "We're on a mission to **back the traders the industry skips**." Explains PDT repeal + capital still being scarce + TradeFundrr's mission.

**Inline edit:** PDT mention was originally "The PDT rule is gone" — expanded to "The PDT rule, the old $25,000 minimum required to day-trade more than three times a week, was repealed." for low-awareness clarity.

### 2.6 Did You Know callout (`.stx-didyou`)

**Layout:** single centered box with teal-gradient background + teal border.

**Copy:** "One disciplined equity trader can move **seven figures of P&L per year** for an institutional desk. That's why we back individual traders with up to **$1M+ in real desk capital through T3 Global*** once they prove sustained edge."

Closer (italic, smaller): "Your success is our success. Not a slogan. The entire business model."

**Disclaimer** (smaller, white-45 color, italic): *"Reserved for top-performing traders. Subject to T3 Global review and audition. Not all traders qualify."* — matches the homepage $1M+ disclaimer pattern.

### 2.7 "Where the payouts actually come from" (`.stx-econ`) — LOW-AWARENESS

**Purpose:** answers the skeptic's immediate next question after Did You Know: "where does this money come from?"

**Layout:** 2-column grid (1fr | 1.2fr, right card featured with teal-gradient background).

**Copy:**
- Part 1: The eval fee — "You pay an evaluation fee to participate." Honest about aggregate eval fees funding infrastructure + payouts.
- Part 2 (featured): The graduation bet — "Our real business is graduating top performers to T3 Global."

Closer: "Plain version: **we win when you win, scaled to a real desk.** That's why the rules are published, the math is verifiable, and there's a real audition path on the other side."

### 2.8 Avatar (`.stx-avatar`)

**Purpose:** confirms the reader's self-image and reframes the gap.

**Layout:** centered eyebrow + h2, then a featured card below with label + h3 + 3 paragraphs + kicker.

**Copy:**
- Section head: "Your strategy works. **Your account doesn't.**"
- Card label: "The Equity Day Trader"
- Card h3: "You've proven you can trade. You haven't proven you can scale."
- Card body: The 20% return on $25K = $5K vs 20% on $100K = $20K math. "Same edge. Different scale."
- Kicker: "Your edge works. Your $25K doesn't."

**Inline edit (low-awareness):** Added a subtle teal link below the section head: *"Just exploring? Start with what funded trading actually means →"* anchored to `#stx-explain`. Helps visitors who arrive without trader context.

### 2.9 "How it works in 3 steps" (`.stx-hiw3`) — LOW-AWARENESS

**Anchor:** `#how-it-works-3step` (target of hero secondary CTA)

**Layout:** 3 step cards separated by teal arrow dividers. Mobile: stacks vertically with rotated arrows.

**Copy:**
- 01 — Pick a plan and start.
- 02 — Trade the funded account under our rules.
- 03 — Get paid weekly. Earn the T3 path.

Closer: "No hidden steps. No 'wait 60 days for approval.' Just **pick → trade → get paid → graduate**."

### 2.10 Two Paths (`.two-paths`)

Inherits styling from homepage via `mobile-fixes.css` (`.path-card`, `.contrast-row`). Two cards: "$100K simulated funded equity account" (start) and "Graduate to real money via T3 Global" (earned). Each card has THEM/US contrast rows ("Stocks routed through retail brokers with PFOF" vs "Institutional routing on DXTrade with real fills").

### 2.11 Plans (`.stx-plans` id="plans")

**Anchor target:** `#plans` (primary CTA destination)

**Layout:** 3 plan cards in a grid (Growth, Express featured, Pro).

**Copy:** Each card has eyebrow + badge + h3 + sub + claim block + feature list + price + CTA.

**⚠ Outstanding:** Growth Account and Pro Trader show `$TBD/first month`. Only Express Funding has real numbers (price block, profit target $1,000, daily loss limit $1,000, max drawdown $2,500, earliest payout 5 days, min trade duration 15 seconds).

### 2.12 Account Details accordion (`.stx-rules`)

**Purpose:** comprehensive plain-English rule breakdown for the Express Funding account. Bridges the plan card "highlights" with the full rule set without forcing the reader to ask.

**Layout:** centered header + 10 `<details>/<summary>` accordion rows + footnote. Each row has chevron + label on left, dollar value pinned right in teal. First row open by default, others collapsed (per low-awareness audit feedback).

**Row format:** label + dollar value + description paragraph(s) + "Which means:" plain-English closer.

The 10 rows:
1. Account Size — $25,000
2. Intraday Buying-Power — $100,000 (with 25% per-ticker cap explanation)
3. Daily Loss Limit — $1,000
4. Max End of Day Drawdown — $3,750
5. Weekly Payouts Unlocked At Profit Target — $1,250 (the long one with 5-day disciplined trading requirement + 50%→100% payout progression + live desk promotion)
6. Drawdown High Water Mark — $25,000
7. Profit Split — 80/20
8. Payout Cycle — Weekly
9. Min Payout Amount — $250
10. Max Payout Amount — $15,000

**"Which means:" pattern:** every row ends with `<strong class="stx-faq-means">Which means: [plain English translation]</strong>`. Example for "Account Size $25,000": *"Which means: you start with a $25,000 funded account size, with a path to scale up through performance — no waiting on slow evals."*

**Footnote:** "Account parameters apply to the Express Funding simulated account. Top performers may graduate to live capital through T3 Global per the published audition path. Sim is sim. Live is live."

### 2.13 Platforms (`.stx-platforms` id="how-it-works")

DXTrade (built by tastyworks/thinkorswim devs) + Deep Charts (professional charting, one-click execution). 2-card grid.

### 2.14 Loss-Aversion three-stage (`.stx-loss`)

The "math of staying small" progression: $25,000 (your ceiling) → $100,000 (simulated) → $1M+ (T3 desk). Two teal arrows separating. Closer: "Start at $100K. **Earn your way to $1M+.**"

### 2.15 T3 Global trust panel (`.stx-t3`) — LOW-AWARENESS

**Purpose:** humanizes T3 Global, which is treated as a known entity throughout the page.

**Layout:** 2-column grid (1.15fr copy | 1fr T3 card).

**Copy (pulled directly from homepage):**
"TradeFundrr is partnered with **T3 Global**, an institutional trading firm operating within the T3 group of companies. Member firms include a **regulated SEC broker-dealer and FINRA/SIPC member**. Most funded-trader programs can't say that."

Two more paragraphs about the audition path + sim/live distinction. Closes with "**Sim is sim. Live is live. T3 is live.**"

**Right card:** T3 Global logo (rendered white via CSS filter), "Partnered with T3 Global" label, 3 checkmark bullets (Experienced operational support / Professional trading technology and infrastructure / Structured processes designed for trader accountability).

**White logo technique:** the source asset (`assets/images/t3_global_logo.png`) is the colored version (red T3 mark + dark "GLOBAL" text). CSS filter `filter: brightness(0) invert(1)` converts every pixel to pure white while preserving alpha. No white-variant asset exists; the filter is the solution.

### 2.16 Featured Reviews (`.stx-reviews`)

3 verbatim Trustpilot reviews (5-star). Each card: stars + title + body excerpt + name attribution. Source: trustpilot.com/review/tradefundrr.com.

### 2.17 Trustpilot summary panel (`.stx-tp`) — LOW-AWARENESS

**Purpose:** gives the 3 reviews above aggregate context.

**Layout:** 2-column grid (1.05fr copy | 1fr summary card).

**Copy:**
- Left: "Read the full review history on Trustpilot." + caveat about including any not-so-great ones
- Right (summary card): 5-star row + "**4.2 / 5**" rating + "across **66+ verified reviews**" + teal pill CTA "Read all 66+ reviews →" pointing to trustpilot.com/review/tradefundrr.com

**Note:** values hardcoded from homepage as of 2026-05-24. Mirror future refreshes from `index.html` line ~1499.

### 2.18 Founder Card (`.stx-founder`)

Christian Bose. Pulled from homepage founders section. Headshot + bio + credentials.

### 2.19 Glossary (`.stx-gloss`) — LOW-AWARENESS

**Purpose:** defines every jargon term used elsewhere on the page.

**Layout:** centered header + 2-column grid of `<details>/<summary>` items. All collapsed by default.

**9 terms defined:**
1. Eval / Evaluation
2. Simulated capital
3. Drawdown / Max drawdown
4. PDT rule (Pattern Day Trader)
5. PFOF (Payment for Order Flow)
6. Sharpe ratio
7. Profit split
8. Buying power
9. Audition path / Graduation

Each definition is 1-3 sentences in plain English, optimized for someone who's never traded before.

### 2.20 FAQ (`.stx-faq`)

**Layout:** centered header + collapsible `<details>/<summary>` accordion (refactored from `<div>` in this session). All closed by default.

**6 questions:**
1. Is the $100K real money or simulated capital?
2. Does the PDT rule still apply?
3. When do I get paid?
4. What if I blow the account?
5. What platforms can I trade on?
6. Can I really graduate to live capital?

Each answer ends with `<strong class="stx-faq-means">Which means: [...]</strong>` plain-English closer.

### 2.21 More-X-Than-Y triplet (`.stx-morethan`)

**Purpose:** brand-voice declaration of what makes TradeFundrr different.

**Layout:** 3-card grid + centered closer.

**Copy (REWRITTEN this session — see Voice section below):**
- **Real rules. Not vague promises.** — "Drawdown limits, profit targets, and payout cycles all published before you pay. The rules don't change after you pass."
- **Real fills. Not retail PFOF.** — "Top performers route through T3 Global's institutional desk infrastructure. Not a retail broker pocketing the spread on every trade."
- **Real desk capital. Not a bigger sim.** — "Earn your way and you trade real firm capital at T3 Global. Other prop firms call sim 'live capital.' We don't. Sim is sim. Live is live."

Closer: "It's time for **TradeFundrr**."

### 2.22 Final CTA (`.stx-final`)

**Layout:** 2-column grid (1.2fr left | 1fr right).

**Left:** eyebrow "Stop watching. Start trading." + h2 + body + primary CTA + secondary CTA + ticks.

**Headline:** "Your edge isn't the problem. **Your small account is.**" (changed from "Your $25K is." for broader appeal beyond exact $25K traders.)

**Primary CTA:** "Stop Risking Your Savings →" → `#plans`
**Secondary CTA:** "Talk to our team →" → `#` ⚠ **dead link, needs real Calendly/contact link**
**Ticks:** Weekly payouts · Upfront rules · Phone & email support

**Right:** repeat of the Christian Bose founder card with shorter quote.

### 2.23 Legal Disclosure (`.legal-disclosure`)

Ported from homepage footer pattern. CFTC + risk + testimonial disclosures.

---

## 3. Voice + Messaging Rules

### 3.1 Brand voice (matches homepage)

- Direct, honest, no-BS
- Short declarative sentences
- "Real X. Not Y." pattern for contrasts ("Sim is sim. Live is live.")
- Numbers always specific ("$1M+", "80/20", "$1,250 target") never vague ("substantial", "competitive")
- Active voice
- Second person ("you") for trader-facing copy, first person plural ("we") for TradeFundrr

### 3.2 Hard rules

- **Em dashes:** removed from visible body copy (this session). Use commas, colons, or periods. Em dashes still allowed in CSS/HTML comments (not user-facing) and in footer/legal disclosures (not edited).
- **"Sim is sim. Live is live."** is the canonical phrase distinguishing simulated trading from real T3 desk capital. Use it anywhere the distinction matters.
- **Always disclaim the $1M+ figure** with: *"Reserved for top-performing traders. Subject to T3 Global review and audition. Not all traders qualify."* — same exact wording as homepage.
- **"Which means:"** plain-English closer required on every FAQ and every Account Details rule.
- **No "TBD" copy in production.** Express Funding is real, Growth + Pro are still placeholder — see Outstanding Items.

### 3.3 Acceptable jargon (because glossary exists)

These terms appear without inline definitions, but the glossary defines them: Eval, Simulated capital, Drawdown, PDT, PFOF, Sharpe, Profit split, Buying power, Audition path. First mention of PDT and PFOF was inline-expanded for low-awareness clarity.

### 3.4 The "Real X. Not Y." pattern (rewritten this session)

Previous version of the triplet used "More X than Y" which read awkwardly ("More transparency than promises" is grammatically strained). New pattern:

- **Real X.** *(positive bold claim)*
- **Not Y.** *(direct contrast)*

This matches the existing brand catchphrase "Sim is sim. Live is live." and feels more confident.

---

## 4. Design System

### 4.1 Color palette (CSS custom properties on `:root`)

```css
--bg: #060914;                          /* main dark background */
--bg-card: hsla(0, 0%, 100%, 0.03);     /* card background */
--bg-card-hover: hsla(0, 0%, 100%, 0.05);
--border: hsla(0, 0%, 100%, 0.08);
--border-hover: rgba(34, 211, 168, 0.35);
--teal: #22d3a8;                        /* accent */
--teal-glow: rgba(34, 211, 168, 0.18);
--teal-soft: rgba(34, 211, 168, 0.06);
--white-72: hsla(0, 0%, 100%, 0.72);    /* body text */
--white-55: hsla(0, 0%, 100%, 0.55);    /* muted text */
--white-45: hsla(0, 0%, 100%, 0.45);    /* disclaimers */
--red-soft: rgba(255, 87, 87, 0.08);
```

Secondary accent (alternate teal for hovers): `#0a101e` (deeper navy panels).

### 4.2 Typography

- Body: **Inter** (400 / 500 / 600 / 700 / 800), 16px base, line-height 1.55
- Eyebrows + technical labels: **Geist Mono** (400 / 500 / 600), 11-12px, letter-spacing 1.5-1.8px, uppercase
- Headlines: Inter 700, large letter-spacing-negative (-1.2 to -3px for hero)

Both font families self-hosted in `assets/fonts/`. Inter 400/700 preloaded on every page. Stocks page additionally preloads Inter 500/600/Geist-Mono-400 (added during pro-funding perf pass; should be replicated here if not already).

### 4.3 Spacing + Layout

- Section padding: typically 100px vertical, mobile 60-80px
- Container max-width: 1240-1320px depending on section
- Container side padding: 32px desktop, 24px tablet, 18-20px mobile
- Card border-radius: 14-16px (10-12px on small mobile)
- Grid gaps: 22-40px depending on density

### 4.4 Visual treatments

- **Sparkles:** floating teal-tinted dots in hero (38 total). Each sparkle is a `<span>` with `position: absolute`, randomized `top`/`left` percentages, plus CSS custom properties `--size` (2-3px), `--delay` (0-3.6s), and `--dur` (3.6-5.6s). Animation `stxTwinkle` combines opacity twinkle + translateY float in a single keyframe.
- **Glow borders on hover:** cards get `border-color: var(--border-hover)` on hover for that subtle teal lift.
- **Teal gradients on featured cards:** `background: linear-gradient(180deg, rgba(34,211,168,0.08), rgba(34,211,168,0.02));` with `border: 1px solid rgba(34,211,168,0.3);`
- **Chevron rotation on `<details>`:** `[open] .chevron { transform: rotate(180deg); }` with `transition: transform 0.2s ease;` for accordion items.

### 4.5 Mobile responsive breakpoints

- `@media (max-width: 991px)` — tablet, switches grids to single column, trims padding
- `@media (max-width: 768px)` — phone, further trims, reduces font sizes
- `@media (max-width: 480px)` — small phone, tightest padding, smallest fonts
- `@media (hover: none) and (pointer: coarse)` — touch device, disables hero mouse-tilt
- `@media (prefers-reduced-motion: reduce)` — disables sparkle animation

---

## 5. Anchors / Section IDs (for CTAs and internal nav)

| Anchor | Section | Used by |
|---|---|---|
| `#stx-explain` | "What is funded trading?" | Avatar "Just exploring?" link |
| `#how-it-works-3step` | 3-step "How it works" | Hero secondary CTA |
| `#plans` | Plans section | Hero primary CTA, all "Get Funded" CTAs |
| `#how-it-works` | Platforms section | (legacy, kept for backwards compat) |

---

## 6. Known Issues / Outstanding (as of 2026-05-25 EOD)

- **Plan card pricing TBD** — Growth Account and Pro Trader still show "$TBD/first month". Express Funding has real numbers.
- **Trust ticker abstract claims** — need real numbers (e.g., "3,400+ funded traders" instead of "Growing Community")
- **Final CTA "Talk to our team" links to `#`** — needs real Calendly / contact link
- **Trustpilot summary hardcoded** — 4.2/5 + 66+ reviews matched from homepage on 2026-05-24. Mirror future refreshes.
- **No video** — low-awareness audit recommended a 60-90s founder explainer video. Not yet added.
- **PageSpeed perf** — page has not been individually optimized post-content-redesign. Image optimization (PNG→WebP dropdown thumbs) applied via global sweep. Could benefit from font preload audit + lazy-load of below-fold images.

---

## 7. Pattern References

The patterns used on this page are documented in `HANDOFF-2026-05-25.md` "New Patterns Established":

- Pattern 1: Atomic Python writes for OneDrive resilience
- Pattern 5: Critical font preloading
- Pattern 6: "Which means:" plain-English closer
- Pattern 7: Review banner pattern (used during low-awareness drafting; banners stripped before ship)
- Pattern 8: "Real X. Not Y." brand voice

When extending this page, reach for those patterns first.
