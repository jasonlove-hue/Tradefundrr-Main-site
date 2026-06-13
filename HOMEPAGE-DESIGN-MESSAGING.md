# TradeFundrr Homepage — Design + Messaging System

**Purpose:** Reference document for building other pages (stocks.html, options.html, futures.html, why-us.html, pricing.html, etc.) so they match the homepage's visual and copy conventions.
**Source of truth:** `index.html` and `assets/css/mobile-fixes.css` in the main-site repo.
**Live URL:** https://tradefundrr-main-site.vercel.app/
**Last updated:** 2026-05-26

---

## CHANGELOG

### 2026-05-26 — Nadav iteration (post weekly sync)

**Christian section (v3)** — Reworked to stop "forcing away from Bose."

- **Lead under heading** rewritten: was *"The credibility behind the operation doesn't come from his resume. It comes from the institutional partnerships listed below."* → now *"Christian Bose built TradeFundrr. The name on the offer, the operator behind the partnerships, the founder who put the team in place. The infrastructure that backs him is listed below."*
- **Bio** rewritten: was *"...the human voice behind it. The credibility on the offer isn't his alone..."* → now *"Christian set the T3 partnership, hired the operators, and put the offer in place. The structure behind TradeFundrr came from his work, not handed to him, not licensed in. Built."*
- **No customer-support claims** — Christian doesn't take tickets or calls; the bio doesn't claim he does.
- **Partner bullets reordered + retitled:**
  1. **T3 Trading Group** — *Part of the T3 group of companies.* **Regulated SEC broker-dealer · FINRA/SIPC member.**
  2. **T3 Global** — Trading infrastructure and trader routing. Where TradeFundrr's funded accounts run.
  3. **Deeply experienced operators** — The team behind risk, technology, and back-office spans decades of broker-dealer, derivatives, and trading infrastructure work.

**T3 attribution corrected sitewide.** T3 Trading Group is the FINRA/SIPC regulated broker-dealer (regulatory backbone). T3 Global is the operational/routing entity (where live-capital actually runs). Earlier copy had these swapped.

**T3 trust panel paragraph rewritten** to reflect the corrected attribution:
> TradeFundrr is partnered with **T3 Global**, an institutional trading firm within the T3 group of companies. The group's broker-dealer, **T3 Trading Group**, is a regulated SEC broker-dealer and FINRA/SIPC member and **one of the largest** active-trader institutional desks in the U.S. The live-capital path for top-performing TradeFundrr traders runs through **T3 Global's institutional infrastructure**.

**Payout Guarantee → First-Payout Rebate** (Nadav 2026-05-26 gap #4, legal cleanup).

- **Eyebrow badge:** "The Payout Guarantee" → "First-Payout Rebate"
- **Headline retained** (per Jason — marketing punch): "Hit your first payout. **Get your eval fee back.**"
- **Sub** rewritten with short-sentence rhythm: *"Pass the eval. Earn a qualifying payout. The eval fee comes back with it. You deliver the performance, we deliver the rebate."*
- **Points (vertical stack, active voice):** Paid out with your first qualifying payout / No time limit to qualify / Options, Stocks, and Futures Express
- **Footnote restructured** to 4 stacked label-on-own-line rows on a dark inner panel: **Rebate amounts** / **Not rebated** / **One rebate per customer** / **Earning a qualifying payout depends on your trading performance and is not guaranteed**
- **Per-card mini-badges** show plan-specific rebate amounts: $800 (Options/Stocks Express on $899), $179 (Futures Express on $179)
- **Mechanic unchanged** — automatic rebate paid with qualifying first payout, no mail-in form

**CSS additions to `.guarantee__points` and `.guarantee__footnote`** in `mobile-fixes.css`:
- `.guarantee__points` switched from 3-column grid to vertical flex stack (so longest bullet no longer wraps)
- `.guarantee__footnote` switched to flex column with `gap: 20px`, body color receded to 45% white, bold labels at 72% white, dark inner panel (`background: rgba(0,0,0,0.20)`, `border-radius: 10px`, `padding: 18px 22px`)
- Older `.guarantee__footnote strong` override that forced 92%/600 weight was resolved to inherit the new 72%/500 scheme

**Sitewide link hygiene:**
- All Login + Funding Dashboard Login buttons now point to `https://dashboard.tradefundrr.com/Identity/Account/Login?ReturnUrl=%2FClient` with `target="_blank" rel="noopener"`
- All navigation links open in new tab by default. In-page scroll anchors (`href="#..."`), `mailto:`/`tel:`/`javascript:` properly excluded

### 2026-05-25 — Stocks page redesign + performance pass

Captured in `HANDOFF-2026-05-25.md`. Highlights: stocks page redesign shipped with 22 sections, sitewide image optimization, Swiper lazy-load, pro-funding hero GIF → MP4/WebM, homepage navbar made sticky.

---

## 1. Brand System

### 1.1 Color Palette

| Use | Color | Hex |
|---|---|---|
| Primary brand accent (teal) | Teal | `#22d3a8` |
| Brand accent (alternate, in some legacy refs) | Mint | `#05c4a1` |
| Page background (most sections) | Near-black navy | `#060914` |
| Avatar section background (subtle shift) | Slightly lifted navy | `#0a101e` |
| Plans section background | `#060914` with teal radial glow |
| Human-support section background | Teal-dark with grid | `#0a1f28` |
| Card backgrounds | White at 3% opacity | `hsla(0, 0%, 100%, 0.03)` |
| Card borders | White at 8% opacity | `hsla(0, 0%, 100%, 0.08)` |
| Teal-tinted card backgrounds (founder/support quote cards) | Linear gradient | `linear-gradient(180deg, rgba(34,211,168,0.05), rgba(34,211,168,0.01))` |
| Teal card borders (founder/support quote) | Teal at 22% | `rgba(34, 211, 168, 0.22)` |
| Body text | White | `#fff` |
| Secondary text | White at 72% | `hsla(0, 0%, 100%, 0.72)` |
| Tertiary / muted text | White at 55% | `hsla(0, 0%, 100%, 0.55)` |
| Eyebrow / meta text | Teal | `#22d3a8` |
| Disclaimer / compliance text | White at 45% | `hsla(0, 0%, 100%, 0.45)` |

**Rule:** All H2 `.accent` spans must be teal (`#22d3a8`). Legacy yellow (`#fc0` / `#ffcc00`) accents have been overridden sitewide via `mobile-fixes.css`. **Exception:** Blackbook section retains its gold `#ffc107` accent because it matches the book image.

### 1.2 Typography

- **Display / body sans-serif:** Inter (`'Inter', 'Inter Fallback', sans-serif`)
- **Monospace (eyebrows, code, mono labels):** Geist Mono (`'Geist Mono', 'Geist Mono Fallback', 'IBM Plex Mono', ui-monospace, monospace`)

**Hierarchy:**

| Element | Font | Size (desktop) | Weight | Letter-spacing | Notes |
|---|---|---|---|---|---|
| Hero H1 | Inter | 96px | 700 | -3.8px | Two-tone (white + teal accent) |
| Section H2 | Inter | 48px | 700 | -1.4px | One accent span in teal |
| Section sub / lead | Inter | 17px | 400-500 | normal | `hsla(0,0%,100%,0.72)` |
| Eyebrow | Geist Mono | 12-14px | 500-700 | 1.5-2px | Always uppercase, always teal |
| Quote (founder/support cards) | Inter | 19px | 500 | -0.2px | Second half in teal accent |
| Card title | Inter | 22-28px | 700 | -0.4px | white |
| Card body | Inter | 14-15px | 400 | normal | `hsla(0,0%,100%,0.78)` |
| Attribution name | Inter | 15-18px | 700 | -0.2px | white |
| Attribution role | Geist Mono | 11-12px | 400 | 1.5px | uppercase, white at 55% |

### 1.3 Spacing + Layout

- Container max-width: `min(100% - 60px, 1240px)` — except the avatar section (1550px wide for 4-up grid) and the human-support section (varies; left col + right col grid)
- Section padding: `padding-block: 100px` standard. Some sections use 80-120px.
- Card padding: 24-40px depending on density
- Grid gap (multi-column sections): 18-24px between cards, 60-80px between major columns
- Border radius: 14px (cards), 18px (large containers, portraits, quote cards), 999px (pills/badges)

### 1.4 Visual Treatments

**Card hover state (used on most card grids):**
```css
.card:hover {
  border-color: rgba(34, 211, 168, 0.35);
  background: hsla(0, 0%, 100%, 0.05);
  transform: translateY(-2px);
}
```
Transition: `border-color .2s ease, transform .2s ease, background .2s ease`

**Drop shadow (cards / portraits):**
```css
box-shadow: 0 30px 60px -25px rgba(0, 0, 0, 0.55), 0 0 0 1px hsla(0, 0%, 100%, 0.02);
```

**Portrait frame (founder / support):**
- 4:5 rectangle aspect ratio
- 18px rounded corners
- 1px subtle white border at 8% opacity
- Dark gradient backdrop: `linear-gradient(135deg, #0b1320 0%, #1a2740 100%)`
- Drop shadow

**Quote card outer frame (founder / support):**
- Teal-tinted gradient background: `linear-gradient(180deg, rgba(34,211,168,0.05), rgba(34,211,168,0.01))`
- 1px teal border at 22% opacity
- 18px rounded corners
- Drop shadow + 1px inner highlight at 2% white

**Section dividers (between adjacent sections):**
- Teal hairline at top of section via `::before` pseudo-element with `linear-gradient(90deg, transparent 0%, rgba(34, 211, 168, 0.5) 50%, transparent 100%)`
- Or: subtle border-top at white 8% opacity

---

## 2. Voice + Messaging Rules

### 2.1 Brand Voice

- **Institutional but human.** Confident, not corporate. Personal first-person where appropriate (founder, support rep).
- **Concrete over abstract.** Name specific numbers, names, mechanisms. "T3 Global desk" > "professional trading firm."
- **Pain-led, then promise.** Hero exemplifies: "Risk your edge. Not your savings." — names the avatar's fear, then offers the resolution.
- **Anti-marketing-speak.** Avoid superlatives, generic claims, vague promises ("the best," "unmatched," "world-class"). Say what is true and specific.
- **Honest hedge language for any claim that's outcome-dependent.** "Top performers earn..." instead of "You will earn..."

### 2.2 Hard Rules

1. **No em-dashes (`—`).** Sitewide policy. Use commas, periods, or split into two sentences. En-dashes (`–`) for ranges are OK.
2. **No AI-generated images.** Every photo must be real. The site's authenticity strategy depends on real founder, real reviews, real T3 partnership. AI images on a site selling "real human support" destroy the thread.
3. **No invented testimonials.** Every review used on the site is verbatim from Trustpilot, attributed to a real Trustpilot reviewer name + country + date.
4. **Compliance disclaimers on any outcome-dependent claim.** $1M+ T3 Global desk gets an asterisk + "Reserved for top-performing traders. Subject to T3 Global review and audition. Not all traders qualify."
5. **"Simulated" must be present** wherever account capital is mentioned. Funded accounts are simulated; payouts are real; live capital is earned through T3 Global routing. Never blur the distinction.
6. **No PDT (pattern day trader) references.** PDT was repealed; the rule no longer exists. Reframe leverage/account-size benefits without invoking PDT.
7. **T3 Global is the institutional prop firm. T3 Trading Group is the SEC broker-dealer.** They're separate entities under T3 Companies. Don't call T3 Global a "broker-dealer."

### 2.3 Hormozi-Style Frames Used

**Pain-led hero:** `[Bad outcome]. [Good outcome].` Example: "Risk your edge. Not your savings."

**Two-part parallel quote:** `[Concrete setup]. [Active promise].` Examples:
- Christian: "Your edge got you here. Our job is to make sure your account size doesn't stop you."
- Dawson L.: "Real questions deserve real answers. That's the whole job."

**Avatar specificity:** Name the segment (Stocks Day Trader, Options Strategist, Futures Specialist, Crypto Trader), anchor on their actual situation ("$5K of personal capital"), close with parallel "X works. Y doesn't."

**Anti-competitor positioning (used sparingly):** Name a specific failure mode and counter-position. Path 02 contrast row: *"No upgrade path. Sim is the ceiling." (them) → "Earn live capital through T3 Global routing." (us)*

**"Which means..." closer (FAQ pattern):** Each FAQ answer ends with `<strong class="faq__means">Which means: [benefit restatement]</strong>` — reframes a hedge into a benefit.

**Three-stage progression (loss-aversion):** Show the journey explicitly: small ceiling → larger ceiling → climax. Each card escalates in visual weight (subtle teal → strong teal → bordered with badge).

### 2.4 Phrases / Words to Avoid

- "Live capital" used loosely (must be earned through T3 Global, never default)
- "Funded" without "simulated" qualifier
- "Guaranteed" anything (compliance / accuracy)
- "World-class," "best in industry," "unmatched"
- "Eval" — use "evaluation" (longer but reads cleaner and avoids confusion)
- "Co-Founder" / "Founder" — currently Christian is "Co-Founder" (settled this session, all 4 references aligned)

---

## 3. Homepage Section Architecture (in render order)

This is the canonical section sequence on `index.html`. When building other pages, you don't need every section, but use these patterns as references.

### 3.1 Header / Navigation

- TradeFundrr logo (top-left)
- Nav links: Products dropdown · How It Works · About · Blog · Login
- Right side: teal CTA button "Get Funded →"

### 3.2 Hero

- Eyebrow: `POWERED BY INSTITUTIONAL-GRADE TRADING TECHNOLOGY` (teal mono)
- H1 (96px, white + teal split): **"Risk your edge.**\n**Not your savings."**
- Sub (2 lines): *"Trade a $100k simulated funding account with transparent rules. Top performers graduate to live capital through T3 Global."*
- Primary CTA: "Get Funded Now →" (teal pill)
- Secondary CTA: "See how it works →" (text link)
- Trust bullets row: ✓ Transparent Rules · ✓ Weekly payouts · ✓ Phone & Email support
- Right side: vault hero image with chart inside (signature visual asset)
- Background: dark with star/sparkle pattern + animated sparkles

### 3.3 Credibility ticker

- Single-row bar of 5 trust signals: `T3 Global - Partnered with TradeFundrr · Weekly Payout Cycle - Every Week, on Time · Access to Multiple Trading Markets · A Growing Community of Funded Traders · Consistent Trader Payouts Since 2024`
- Sits flush against bottom of hero

### 3.4 Avatar section

- Eyebrow: `BUILT FOR FOUR TRADERS`
- H2: **"The edge isn't the problem. Capital is."**
- Sub: *"TradeFundrr is built for traders who've proven the edge on small accounts and can't scale without risking their own savings. Four documented paths below."*
- 4-up grid: Stocks / Options / Futures / Crypto, each anchored on $5K of personal capital, ending with parallel "X works. Y doesn't." kicker
- Closer paragraph at the bottom (teal-tinted box): the documented-pathway moat phrase

### 3.5 Two-paths section

- Eyebrow: `TWO PATHS · ONE PROMISE` (teal)
- H2: **"Most prop firms run sim only and call it live."** / **"We split it honestly."** (forced 2-line, second line in teal)
- Sub: *"Start in sim. The top performers graduate. It's not the default, it's what you earn."*
- Two cards side-by-side with center arrow
- Path 01: Sim Eval & Funded (bullet list + THEM/US contrast block + CTA button)
- Path 02: Graduate to Real Money (with "Earned" badge in upper-right, bullet list + THEM/US contrast block + T3 footnote)

### 3.6 Markets section (Stocks/Options/Futures/Crypto)

- Eyebrow: `FOUR MARKETS. ONE INSTITUTION.`
- H2: **"Funded Trading Paths Across Stocks, Options, Futures, And Crypto."**
- Sub: *"Whether you trade stocks, options, futures, or crypto, TradeFundrr gives you a funded path with real capital behind it."*
- 4-up grid of cards with images + headers + descriptions + pill tags (Growth Account / Express Funding / Pro Trader) + Explore CTA per card
- **Open item:** the stock photos in these cards still need to be replaced with branded visuals (see open items below)

### 3.7 How It Works (HIW)

- Eyebrow: `HOW IT WORKS`
- H2: **"From Evaluation to Funded Trader."**
- Sub: *"Four steps. Earned by performance. Disciplined traders only."*
- SVG path animation: 4 numbered circles connected by a teal line that draws as the cycle animates through steps
- Step cards (animated callouts): Choose Your Program · Trade Your Evaluation · Prove Consistency. Earn Payouts. · Earn Live Capital.
- Cycle timing: 2.75s per step, infinite loop, pauses on hover
- Bottom CTA: "View Plans and Pricing →"

### 3.8 Numbers section

- TradeFundrr full logo centered above (`assets/images/logo.svg`)
- 4 stacked lines with first-word teal accent:
  - **Real** Traders. Real Payouts. Every Friday.
  - **Paid** Direct to your Rise Account. No Delays.
  - **From** Small Account to T3 Global Trading Desk.
  - **Scale** to $1M+ at a Professional Trading Desk.
- Background: falling animated payout-certificate cards

### 3.9 Featured Trustpilot reviews

- Eyebrow: `REAL TRADERS. REAL PAYOUTS.`
- H2: **"What Funded Trading Looks Like When You Choose TradeFundrr"**
- Sub: *"Real names. Real reviews. No anonymous testimonials."*
- Summary stat block (centered): ★★★★★ "4.2 / 5 across 66+ verified reviews on Trustpilot"
- "VERIFIED PAYOUT STORIES" eyebrow
- 3×3 grid of 9 verbatim 5-star Trustpilot reviews (cards: stars + title + body + attribution name/country/date)
- "Read all 66+ verified reviews on Trustpilot →" link below

### 3.10 T3 Partnership section

- Eyebrow: `BUILT ON PROFESSIONAL TRADING INFRASTRUCTURE`
- H2: **"A Structured Environment Designed For Serious Traders"**
- Lead: *"TradeFundrr is partnered with T3 Global, an institutional trading firm operating within the T3 group of companies. Member firms include a regulated SEC broker-dealer and FINRA/SIPC member. Most funded-trader programs can't say that."*
- Right side: T3 Global logo card with bullet credibility points

### 3.11 Founders section (Christian Bose)

- Eyebrow: `LEADERSHIP`
- H2: **"Run by an operator from the institutional side."**
- Sub: *"Two decades inside trading desks, broker-dealers, and financial technology. Not a marketing chair. Most prop firms are built by marketers. TradeFundrr is built by someone who's actually traded the products."*
- Left: bio paragraph + credentials bullet list
- Right: Christian Bose portrait (4:5 rectangle, dark gradient backdrop, teal offset frame, "CO-FOUNDER · TRADEFUNDRR" badge in bottom-left)

### 3.12 Human Support section

- Background: dark teal `#0a1f28` + teal grid hairlines + 32 floating animated sparkles
- Eyebrow: `REAL HUMAN SUPPORT`
- H2: **"Talk To A Real Person."** / **"Not A Chatbot."** (second line in teal)
- Sub: *"TradeFundrr is built on clear rules and real support, so when you reach out, you get direct answers from someone who understands the platform."*
- Layout: **Dawson L. quote card on LEFT, headline + sub + support cards on RIGHT**
- Quote card (same structure as founder card):
  - Portrait (4:5, 220px)
  - Quote: *"Real questions deserve real answers. That's the whole job."* (second half teal)
  - Attribution: Dawson L. / TRADER SUCCESS SPECIALIST · TRADEFUNDRR
- Right column: Phone Support + Email Support cards (with icon, label, contact info)

### 3.13 Journey / Timeline section

- Eyebrow: `REAL TIMELINES`
- H2: **"From your first evaluation"** / **"to a seat at T3 Global."** (second line teal, "a seat at T3 Global." nowrap)
- Sub: *"A documented path. Not a marketing promise."*
- Horizontal timeline rail with 4 markers: Week 1 · Weekly · Months 1+ · Earned
- 4 cards on the rail, each cycling active state via 1.5s animation (updated 2026-05-25)
- Cards: Pass the Eval. · Weekly Payouts. On Performance. · Earn Live Capital. · Audition for the T3 Global Trading Desk.
- Mobile: timeline rail hides, cards stack 2×2 then 1-up

**Animation behavior (rebuilt 2026-05-25 — simplified):**

The animation script is inline at `index.html` lines ~1863-1908. It went through 6 iterations during the 2026-05-25 session before landing on this final simplified design.

- **Cycle starts on `DOMContentLoaded`** — no IntersectionObserver, no viewport detection. Animation is always alive.
- **Cycle interval:** 1500ms per card (was 2750ms originally, briefly 900ms, settled at 1500ms as the comfortable "read each card" cadence)
- **CSS transitions:** card 250ms, rail marker 220ms (trimmed from 400ms/300ms in `mobile-fixes.css` for snappier visual snap)
- **Hover-pauses:** mouseenter/mouseleave on `.journey` toggles a `paused` flag; `tick()` checks the flag and exits early but the setInterval keeps running so it resumes cleanly
- **Wrapped in try/catch:** any error logs to console
- **Debug flag:** `window.__tfJourneyDebug` is set to `"running:1500ms"` on successful init, `"no-elements"` if elements missing, `"error:<msg>"` on exception, or `undefined` if script never ran (means deploy hasn't reached browser)

**Troubleshooting checklist if animation doesn't appear to run:**

1. Open DevTools console on the live page
2. Run `window.__tfJourneyDebug` — should return `"running:1500ms"`
3. If `undefined` → script didn't run. Most likely: deploy hasn't reached the browser. Hard-refresh (Ctrl+Shift+R). If still `undefined`, check `git log` and Vercel deploy status.
4. If `"no-elements"` → DOM structure changed. The script needs `.journey-card`, `.journey__rail-marker`, and `.journey` selectors to find elements.
5. If `"error:..."` → some other JS broke parsing. Check console for the error message.

**Why no IntersectionObserver:** earlier versions used IO to delay the cycle until viewport entry. This produced edge cases (Jason reported "takes 10s to start" in incognito). The IO complexity created more failure modes than it solved. Since the cycle is light (one class toggle per 1.5s) and the full cycle is only 6 seconds, starting on page load is harmless — by the time the user scrolls to the section, cards are already in motion.

### 3.14 Loss-aversion section (three-stage)

- Eyebrow: `THE MATH OF STAYING SMALL`
- H2: **"Your edge has one ceiling."** / **"We move it. Twice."** (second line teal)
- Three escalating cards with arrows between:
  1. Trading Your Own Money — $5,000 / *your ceiling*
  2. Funded Account — $100,000 / *simulated capital*
  3. T3 Global Desk — $1M+\* / *desk capital* (with "Earned" badge)
- $1M+ asterisk references inline disclaimer: *"\*Reserved for top-performing traders. Subject to T3 Global review and audition. Not all traders qualify."*
- Closer: *"Start at $100K. Earn your way to $1M+."*
- On mobile: cards stack vertically, arrows rotate 90°

### 3.15 Mid-page CTA

- H2 (teal-accented top line): **"Stop Watching."** / **"Start Trading."**
- Sub: *"Your edge isn't the problem. Your small account is. Trade $100K of simulated capital. Keep up to 80% of what you make. Pass once, earn back your eval fee."*
- Primary CTA: **"Stop Risking Your Savings →"** (closes hero loop)
- Secondary CTA: "Talk To Our Team" (glass button)

### 3.16 Pricing / Plans section

- Eyebrow: `PRICING`
- H2 with teal accent on `$100,000 Funded Accounts`: **"$100,000 Funded Accounts For Less Than You Think"**
- Sub + guarantee banner above pricing grid (banner is CONDITIONAL — see Guarantee Removal Instructions in the main handoff)
- Three pricing cards: Options Express ($899 + $99/month) · Stocks Growth · Futures
- Each card: eyebrow + title + subtitle + hero claim block + 7-bullet feature list + centered price block + guarantee mini-badge + CTA button
- Plans grid background: solid `#060914` + teal radial glows

### 3.17 FAQ section

- H2: **"Your Questions, Answered Directly."**
- Tabs: Trust & Transparency (6) · Trading Experience (8) · Funding & Payouts (6) · Getting Started (4)
- Each FAQ has an expandable `<details>`-like accordion
- **All 24 FAQ answers end with `<strong class="faq__means">Which means: [benefit restatement]</strong>` callout** — visual: teal left border, teal-tinted bg, bold body

### 3.18 Final CTA (Get Started)

- Layout: text/buttons on LEFT, Christian Bose quote card on RIGHT
- Left side:
  - Eyebrow: `GET STARTED`
  - H2: **"You've Done The Research."** / **"Here's The Next Step."** (second line teal)
  - Sub: *"Weekly payouts run on time. And when you need help, a real person picks up. That's the TradeFundrr difference."*
  - CTAs: "Stop Risking Your Savings →" + "Talk To The Team First"
  - Trust bullets: ✓ Weekly Payouts · ✓ Upfront Rules · ✓ Phone & Email support
  - Footer: T3 Global partnership badge
- Right side: Christian Bose quote card
  - Quote: *"Your edge got you here. Our job is to make sure your account size doesn't stop you."* (second half teal)
  - Attribution: Christian Bose / CO-FOUNDER · TRADEFUNDRR

### 3.19 Blackbook lead magnet

- Eyebrow: `EXCLUSIVE FREE GUIDE`
- H2: **"The Funded Trader Blackbook."** (gold accent on "Blackbook" — exception to teal-only rule)
- Tagline: *"Secrets from a prop firm insider"*
- Lead paragraph + 3-feature row + email capture form (action="#", to be wired to GoHighLevel)
- Left: book mockup image. Right: content + form.

### 3.20 Footer

- Brand block (logo + address + hours + email)
- 4 column nav (Products, Resources, Company, Legal)
- Separator + bottom row with social + © year
- Legal disclosure block (long compliance copy in small text)

---

## 4. Reusable Component Patterns

When building other pages, these are the core components and where to find their CSS.

### 4.1 Quote Card (founder or support)

**HTML structure:**
```html
<div class="founder-quote-card"> <!-- or .support-quote-card -->
  <div class="founder-quote-card__inner">
    <div class="founder-quote-card__portrait">
      <img src="..." alt="...">
    </div>
    <blockquote class="founder-quote-card__quote">
      <p>&ldquo;[Setup sentence.] <strong>[Active promise sentence.]</strong>&rdquo;</p>
    </blockquote>
    <p class="founder-quote-card__attrib">
      <span class="founder-quote-card__name">Name</span>
      <span class="founder-quote-card__role">Role &middot; TradeFundrr</span>
    </p>
  </div>
</div>
```

**CSS:** `/* === FOUNDER QUOTE CARD START === */` in mobile-fixes.css. The `.support-quote-card` variant in `/* === SUPPORT QUOTE CARD START === */` is structurally identical.

### 4.2 Avatar segment card

**HTML structure:**
```html
<div class="avatar-segment">
  <span class="avatar-segment__label">STOCKS</span>
  <h3 class="avatar-segment__title">The Equity Day Trader</h3>
  <p class="avatar-segment__body">
    You've been trading stocks on <strong>$5K of personal capital</strong>. ...
    <strong>Your edge works. Your account doesn't.</strong>
  </p>
</div>
```

**CSS:** `/* === AVATAR SECTION === */` in mobile-fixes.css.

### 4.3 Path card with THEM/US contrast block

**HTML structure (Path 01 example):**
```html
<article class="path-card path-card--start">
  <p class="path-card__eyebrow">PATH 01 · WHERE EVERYONE STARTS</p>
  <h3 class="path-card__title">Sim Eval & Funded</h3>
  <p class="path-card__desc">[Description]</p>
  <ul class="path-card__list">
    <li>Open enrollment, start any time</li>
    ...
  </ul>
  <div class="path-card__contrast">
    <div class="contrast-row contrast-row--them">
      <span class="contrast-label">Them</span>
      <span class="contrast-text">[Competitor failure]</span>
    </div>
    <div class="contrast-row contrast-row--us">
      <span class="contrast-label">Us</span>
      <span class="contrast-text">[Our counter]</span>
    </div>
  </div>
  <a href="..." class="path-card__cta">Start the Eval →</a>
</article>
```

**CSS:** `/* === PATH CONTRAST ROWS === */` in mobile-fixes.css.

### 4.4 Featured Trustpilot review card

**HTML structure:**
```html
<article class="featured-review">
  <div class="featured-review__stars" aria-label="5 out of 5 stars">★★★★★</div>
  <h3 class="featured-review__title">[Verbatim title]</h3>
  <p class="featured-review__body">&ldquo;[Verbatim quote with <strong> on the pull-line]&rdquo;</p>
  <p class="featured-review__attrib"><strong>Name</strong> · Country · Date</p>
</article>
```

**Grid:** `.featured-reviews__grid` with `grid-template-columns: repeat(3, 1fr); grid-auto-rows: 1fr` for equal card heights.

**CSS:** `/* === FEATURED REVIEWS START === */` in mobile-fixes.css.

### 4.5 FAQ entry with "Which means:" closer

**HTML structure:**
```html
<div class="qa">
  <div class="head">
    <p>[Question]?</p>
    <span class="chev-arrow"><img src="assets/images/faq-arrow.svg" alt=""></span>
  </div>
  <div class="qa__body">
    <p>[Hedged factual answer.] <strong class="faq__means">Which means: [benefit restatement].</strong></p>
  </div>
</div>
```

**CSS:** `/* === FAQ WHICH-MEANS START === */` in mobile-fixes.css.

### 4.6 Three-stage progression cards (loss-aversion pattern)

When you need to show a journey (e.g., starter → mid → top tier), use this pattern. Three cards with arrows between, each card escalating in visual weight (subtle → medium → strong teal accent + badge on the climax).

**CSS:** `/* === LOSS AVERSION (COST OF WAITING) START === */` for the three-stage modifier.

### 4.7 Hero-style top section (for non-homepage pages)

If a sub-page (stocks.html, options.html, etc.) needs a hero, follow this pattern:
- Eyebrow (teal mono): contextual signal like `STOCKS · INSTANT FUNDING`
- H1 (60-72px, smaller than homepage 96px): two-tone (white + teal split)
- Sub: 2 lines explaining the product
- Primary CTA + secondary CTA
- Trust bullets
- Right side: relevant product visual (NOT a stock photo of a trader)

---

## 5. Compliance / Authenticity Rules

| Rule | Why |
|---|---|
| Funded accounts are SIMULATED | Compliance — TradeFundrr funded accounts are simulated with real payout cycles |
| T3 Global is the institutional prop firm, not the broker-dealer | T3 Trading Group is the SEC broker-dealer; they're separate entities under T3 Companies |
| $1M+ T3 Global desk needs asterisk disclaimer | Not every trader reaches that tier — outcome-dependent claim |
| Profit splits: 80% (Options Express baseline) — never claim 90% | Accuracy / consistency |
| All reviews must be verbatim from Trustpilot | Authenticity strategy — no invented testimonials |
| All photos must be real people who consented | No AI-generated photos. Dawson L. is real and approved. |
| Eval fee refund is conditional on first qualifying payout | Per guarantee terms — see refund mechanics in main handoff |
| No PDT rule references | PDT was repealed; rule no longer exists |

---

## 6. Technical Conventions

### 6.1 File structure

- `index.html` — homepage, primary file
- `pages/*.html` — sub-pages (stocks.html, options.html, futures.html, why-us.html, pricing.html, etc.)
- `assets/css/main.css` — original theme stylesheet (mostly don't touch)
- `assets/css/mobile-fixes.css` — all our overrides, additions, and customizations live here
- `assets/js/main.js` — original theme JS (jQuery-based, mostly don't touch)
- `assets/js/sparkles.js` — hero sparkle generation
- `assets/images/` — all images (PNG, WebP, SVG)

### 6.2 CSS override pattern

When main.css has rules that conflict, override in mobile-fixes.css with `!important`. Common gotchas:
- `.real-support__inner` has `max-width: 480px; margin-left: auto` in main.css line 7115 — must override with `!important`
- `.get-started__media img` has `height: auto` in main.css line 2700 — must override with `!important` for the founder quote card portrait
- Several H2 `.accent` selectors are hardcoded to yellow (`#fc0`) in main.css — overridden to teal sitewide

Use Chrome DevTools (or Chrome MCP + `javascript_tool` with `getComputedStyle`) to diagnose specificity battles.

### 6.3 Section markers (HTML comments)

Every major addition is wrapped in `<!-- SECTION_NAME_START -->` / `<!-- SECTION_NAME_END -->` markers in HTML and corresponding `/* === SECTION NAME START === */` / `/* === SECTION NAME END === */` markers in CSS. This makes any section removable cleanly later. Examples:
- `FOUNDERS_SECTION_*`
- `JOURNEY_SECTION_*`
- `AVATAR_SECTION_*`
- `LOSS_AVERSION_*`
- `FEATURED_REVIEWS_*`
- `SUPPORT_DAWSON_*`
- `FOUNDER_QUOTE_CARD_*`
- `PATH_CONTRAST_01_*` / `PATH_CONTRAST_02_*`
- `GUARANTEE_BANNER_*` (CONDITIONAL — may be removed; see main handoff)
- `NUMBERS_BRAND_MARK_*`

**Add markers to every new section you build** so future cleanup is mechanical.

### 6.4 Cache-busters

Every CSS link and JS script tag has `?v=YYYYMMDDHHMM` appended:
```html
<link rel="stylesheet" href="assets/css/mobile-fixes.css?v=202605252700">
```

**Bump the version timestamp every time the file changes** so Vercel + browsers re-fetch instead of serving cached.

### 6.5 No em-dashes policy enforcement

Before committing any new copy, grep for em-dashes:
```bash
grep -n "&mdash;\|—\|&#8212;\|&#x2014;" path/to/file.html
```
Replace with commas or split into two sentences.

### 6.6 OneDrive corruption mitigation

The repo lives in `C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\`. OneDrive can corrupt files during sed sweeps or large writes that race with sync.

**Mitigation:**
- Prefer many small `Edit` calls over one giant `Write` of a full file
- Use the host-filesystem `Read` tool to verify file state (bash sometimes shows stale data)
- After every significant change, verify the file's closing tags are intact (`</body></html>`)
- If truncation happens, restore the tail from `git show HEAD:index.html | tail -N`

**Long-term recommendation:** move the repo out of OneDrive to a local path like `C:\dev\tradefundrr\`. Not done yet, but every bulk operation is a coin flip for corruption as long as it lives in OneDrive.

### 6.7 Git workflow

Jason pushes from his local terminal — never from within the agent sandbox. After each ship, the agent provides:
```
cd "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site"
git add index.html assets/css/mobile-fixes.css
git commit -m "[descriptive message]"
git push origin main
```
Vercel auto-deploys from `main` branch push.

---

## 7. Building Other Pages — Suggested Approach

When building sub-pages (stocks.html, options.html, etc.), follow this opinionated approach:

1. **Copy the header + footer + legal disclosure from `index.html`** so brand consistency is locked.

2. **Build a focused hero** for the page's specific product (Stocks, Options, etc.) following the hero pattern above.

3. **Pick 4-6 sections** from the homepage that are most relevant to that product. Don't put everything on every page. For example:
   - **Stocks page:** Hero → Avatar (Stocks segment only, expanded) → Markets (Stocks card highlighted) → HIW → Pricing (Stocks card highlighted) → FAQ (Trading Experience tab) → Final CTA
   - **Why Us page:** Hero → Two-paths → T3 Partnership → Founders → Featured Reviews → FAQ → Final CTA
   - **Pricing page:** Hero → Plans (all three cards expanded) → Guarantee banner (if kept) → FAQ (Funding & Payouts tab emphasized) → Final CTA

4. **Reuse all CSS from `mobile-fixes.css`** — no need to duplicate. The classes already exist. Just structure the HTML following the patterns in section 4 above.

5. **Each page gets its own meta tags + JSON-LD structured data** for SEO. Don't copy the homepage's verbatim.

6. **Add the same dead-code blockers:** no Trustpilot widget (use featured-reviews if needed), no PDT references, no AI photos, no em-dashes.

7. **Apply the compliance hedges:** "simulated" near every funded-account reference, asterisk + disclaimer on any $1M+ claim, accurate profit splits.

8. **Use existing section markers** for any homepage section reused on a sub-page — makes diff-tracking easier across files.

9. **Bump the cache-buster** when shipping any change to `mobile-fixes.css` (which is loaded by every page).

10. **Build preview HTML mockups** in `main-site/` root before porting to the actual page file. Pattern is `[page-name]-preview.html`.

---

## 8. Open Items at Time of This Doc

These didn't get addressed before the homepage was considered "done" — they're context for the next session:

- **Markets section card images** still use stock photos for Stocks/Options/Futures/Crypto. Need to be replaced with branded SVG visuals (candlestick chart for Stocks, P&L curve for Options, ticker symbols for Futures, stylized BTC/ETH for Crypto). Mockup not yet built.
- **Pro-funding pages** (`futures-pro-funding.html`, `options-pro-funding.html`, `stocks-pro-funding.html`) end mid-paragraph in the CFTC disclosure with no `</html>` closing tag. Pre-existing OneDrive corruption.
- **Urgency/scarcity mechanic** — no cohort cap, no deadline, no founder pricing window anywhere on the site. Requires business decision.
- **Concrete proof numbers** — no aggregate stats like "X traders funded" or "$Y paid out" anywhere. Pending business data.
- **Performance** — mobile Lighthouse 51 (LCP 11.1s, CLS 0.282). Top fixes: preload hero image, remove dead Trustpilot widget JS, defer/drop slick.min.js, inline critical CSS, audit all `<img>` for missing width/height attributes.
- **Numbers section logo z-index** — TF logo can sit behind a falling payout card occasionally. Fix: bump z-index.

---

## 2026-06-03 — Numbers section reworked to "Paid. Every Friday."
> Note: the fuller, current copy of this doc is `../04 Content/HOMEPAGE-DESIGN-MESSAGING.md` (this `main-site/` copy had drifted to 2026-05-24). Today's homepage change:

The homepage Numbers section's four-line stack ("Real Traders. Real Payouts… / Scale to $1M+…") was replaced inside the same frosted `.numbers__panel` with a cadence-led centerpiece: kicker **"This is what Friday looks like"** → headline **"Paid. Every Friday."** (teal accent) → sub *"Real payouts, processed weekly straight to your account. You keep 80%…"* → stat chips **Keep 80% · Direct to your account · No delays · ★ 4.3 / 5 · 67+ on Trustpilot** → disclaimer. Lead with cadence + per-trader proof, never a cumulative total. Panel narrowed to 920px. Same layout applied to the futures payout section in blue. See `HANDOFF-2026-06-03.md` and Design System §15.

---

*Last updated: 2026-06-03 — Numbers section → "Paid. Every Friday." cadence centerpiece (see §15 / 04 Content copy). 2026-05-24 evening session (prior).*
*See also: `HANDOFF-2026-06-03.md` for the latest session log; `../04 Content/HOMEPAGE-DESIGN-MESSAGING.md` for the full current doc.*
