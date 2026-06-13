# Stocks Page Audit — Old (production) vs New (preview v2)

**Date:** 2026-05-29
**Old / production:** `pages/stocks.html` (192 KB, 3,162 lines) — live at `https://tradefundrr-main-site.vercel.app/pages/stocks`
**New / preview:** `stocks-preview-v2.html` (105 KB, 2,021 lines) — work-in-progress, not promoted
**Method:** Full section-by-section inventory of both files, compared in document order.

---

## 1. Section inventory, side by side

| # | Production (old) | Preview (new) | Status |
|---|---|---|---|
| 1 | Hero — "Use your edge. Not your $25K." + "Compare us to Topstep, Apex, FTMO →" link | Hero — "Stop trading your money. Start trading ours." (no competitor link) | New hero is stronger; competitor link dropped |
| 2 | "What funded trading actually means" — 3-step sim/payout/desk explainer | — | **Missing (low)** |
| 3 | "If you're here, you've already done the hard part" | "The truth most traders figure out too late" (capital-gap intro) | New framing replaces it |
| 4 | "Why TradeFundrr exists" (mission) | — | **Missing (low)** |
| 5 | "Did you know?" (1 trader = 7-fig P&L; $1M+ desk capital) | — | **Missing (low)** |
| 6 | "The business model · transparent on purpose" (eval fee + graduation bet) | One-line FAQ answer only | **Missing as a section (mid)** |
| 7 | "Built for the equity day trader" + "You've proven you can trade. You haven't proven you can scale." (20% scale math) | — | **Missing (mid)** |
| — | — | **Capital-gap visual v3** (diamonds, isometric piles, "skill gap → capital gap") | New — strong |
| — | — | **Time-tax visual** (hockey-stick, "capital gap → time gap") | New — strong |
| — | — | "What keeps you stuck" (loss aversion) | New |
| — | — | "Until now, equity traders had no other option" (category pivot) | New |
| 8 | "How it works · 3 steps" | "How it works · 3 steps" | Present both |
| 9 | "Two paths · one promise" (Path 01/02, Them/Us) | "Two paths · one mission" (Path 01/02) | Present both |
| 10 | "Three programs" — Growth/Express/Pro + rebate callout | Pricing — Growth/Express/Pro + rebate callout | Present both (new is cleaner) |
| 11 | "Side by side · Compare Growth and Express" (per-rule table) | — | **Missing (high)** |
| 12 | "Risk math, plain · Your downside, capped" ($25K vs $899) | — | **Missing (mid)** |
| 13 | "Full rules breakdown · per plan" (Growth/Express/Pro accordion, "Which means" + examples) | — | **Missing (high)** |
| 14 | "Platforms · professional execution" (DXTrade + Deep Charts) | "Platforms · professional execution" | Present both |
| 15 | "The math of staying small · We move the ceiling. Twice." | Partially covered by capital-gap/time-tax | Superseded |
| 16 | "The institutional partner · T3 Global" (+ FINRA/SIPC) | Hero eyebrow mention only | **Missing as a block (high)** |
| 17 | "How we compare · TradeFundrr vs the prop firm landscape" (competitor table) | — | **Missing (high)** |
| 18 | "Real traders · real reviews" + Trustpilot summary | "Real traders · real results" + Trustpilot card | Present both |
| 19 | "The trader's dictionary" (glossary) | — | **Missing (low)** |
| 20 | "Decision-driving FAQ" — 8 substantive Qs (hard/soft breach, consistency w/ example) | 11 placeholder Qs (generic) | **Regression (high)** |
| 21 | "What separates TradeFundrr" (Real rules / Real fills / Real desk capital) | — | **Missing (mid)** |
| 22 | Closing CTA — "Your edge isn't the problem. Your small account is." | Closing CTA — "Stop risking your savings. Start trading with ours." | Present both |
| 23 | Legal disclosures (General / Risk / CFTC Hypothetical Performance / Testimonial) + footer | **None** | **Missing — compliance gate (must-have before launch)** |

---

## 2. What works on the new page (keep — it's better than the old page)

- **New emotional spine.** Capital-gap v3 → time-tax → loss-aversion is a far stronger, better-sequenced argument than the old page's text-heavy "Built for the equity day trader" / "The math of staying small." This is the single biggest improvement and the reason to migrate everything onto v2 rather than patch the old page.
- **Hero reframe.** "Stop trading your money. Start trading ours." is punchier and on-message vs "Use your edge. Not your $25K."
- **Pricing cards + rebate callout.** Same locked content as production, cleaner execution, with the legally-required non-guarantee language intact.
- **Security-deposit Refund Stamp** (just installed). Institutional, brand-safe, kills the "they just want my fee" objection — the old page had no equivalent visual.
- **Visual craft overall.** Scroll-triggered animation, count-ups, consistent token system. The old page is more of a long text scroll.

## 3. What doesn't work on the new page (gaps + regressions)

- **FAQ is a placeholder regression.** 11 generic questions vs the old page's 8 decision-driving ones (hard vs soft breach, consistency rule *with worked example*, sim vs real capital, graduation path). The old FAQ does real sales work; the new one doesn't.
- **No T3 Global trust block.** Only a hero eyebrow mention. For a firm leaning on a regulated broker-dealer partner, the dedicated T3 / FINRA / SIPC panel is the core credibility anchor and it's absent.
- **No proof-by-comparison.** Both the Growth-vs-Express per-rule table *and* the competitor table (vs Topstep/Apex/FTMO/Maverick) are gone — and the hero no longer links to the competitor comparison it used to promise.
- **No substance layer.** The "Full rules breakdown" accordion (every rule + "Which means" + examples) is where the old page actually answers buying questions. Nothing on the new page does this; pricing cards alone don't carry it.
- **No disclosures / footer.** Expected for a section mockup, but it is a hard pre-launch requirement (CFTC hypothetical-performance language especially).

## 4. What doesn't work on the old page (why we're replacing it, not patching it)

- **Front-loaded and text-heavy.** Five short narrative sections ("done the hard part," "why we exist," "did you know," "business model," "built for the equity day trader") stack up before the offer. The new page compresses that into the capital-gap/time-tax visuals.
- **Weak emotional hook.** The old "math of staying small" makes the argument in prose; the new visuals make you *feel* it.
- **Redundancy.** The 20% scale math, "math of staying small," and "did you know" all make overlapping points that the capital-gap section now makes once, better.

---

## 5. Migration checklist (old → new), prioritized

### HIGH — substance, trust, compliance (do before promotion)
1. **T3 Global institutional partner block** (+ FINRA/SIPC framing). Restore the hero "Compare us to Topstep, Apex, FTMO →" link while here.
2. **Full per-plan rules accordion** (Growth / Express / Pro) with "Which means" expansions + the consistency-rule worked example. This is the decision content.
3. **Growth vs Express side-by-side comparison table** (per-rule). Pairs with the pricing cards.
4. **Competitor comparison table** (TradeFundrr vs Topstep / Apex / Earn2Trade / FTMO / Maverick).
5. **Replace the 11 placeholder FAQs** with the old page's 8 decision-driving questions.
6. **Legal disclosures + footer** (General / Risk / CFTC Hypothetical Performance / Testimonial). Compliance gate.

### MID — persuasion reinforcement
7. **"You've proven you can trade. You haven't proven you can scale."** 20% scale math — slot near capital-gap.
8. **"What separates TradeFundrr"** closing trio (Real rules / Real fills / Real desk capital) — before the final CTA.
9. **"Risk math, plain · your downside, capped"** ($25K own vs $899 eval).
10. **Business-model transparency block** (eval fee + graduation bet) — expand the one-line FAQ answer into the section.
11. **Christian Bose pull quote** — "Your edge got you here. Our job is to make sure your account size doesn't stop you."

### LOW — onboarding ramp / nice-to-have
12. Trader's dictionary glossary.
13. "What funded trading actually means" 3-step explainer.
14. "Why TradeFundrr exists" / "Did you know" mission framing (condense — don't re-bloat the top of the page).

---

## 6. Recommended sequence

The new page is the right foundation. The work is migration, not redesign. Suggested order: (1) lock compliance — disclosures/footer + T3 block, (2) bring over the substance — rules accordion, Growth-vs-Express table, competitor table, real FAQ, (3) layer the mid-priority persuasion pieces, (4) decide which low-priority explainers earn their place without re-bloating the top of the funnel, (5) promote v2 → `pages/stocks.html`.

**Sources:** `pages/stocks.html`, `stocks-preview-v2.html`, `HANDOFF-2026-05-28.md`, `STOCKS-PREVIEW-V2-DESIGN.md`.
