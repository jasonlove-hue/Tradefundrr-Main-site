# Build Sheet Instructions — How to Stand Up the Crypto Sheet (and Future Asset Classes)

**For:** the next Claude (or Jason) building `crypto-programs-build-sheet.html`, or any future asset class build sheet
**Anchored on:** `main-site/futures-programs-build-sheet.html` (the futures version that this is modeled on)
**Companion docs:** `HANDOFF-2026-05-27.md` (covers the broader site port; this doc is narrower — just the internal build sheet)
**Audience of the resulting sheet:** the team configuring program rules in the backend (devs / ops). Not customer-facing.

---

## What the build sheet is

A single-page, landscape, print-friendly reference document. The team building the program in the backend reads it once and has every parameter they need: pricing, risk rules, position sizing, payouts, account limits, platform mapping, and live-capital backing.

The futures sheet has 5 program columns × 31 parameter rows in a master matrix, plus 3 supporting blocks (scaling plan, account limits, live capital), 8 numbered footnotes with clickable anchor links, and a 14-item build checklist. It prints to one physical 11"×8.5" landscape page.

Crypto needs the same structure with crypto-specific numbers, programs, platforms, and footnotes.

---

## Step-by-step build process

### Step 1: Confirm the crypto program structure with Jason (before any HTML)

Don't open the file until these are answered. Most of them shape the matrix's column structure.

1. **What are the crypto program tiers?** Futures has Growth / Promo / Express. Does crypto map 1:1, or is the structure different?
2. **What account sizes?** Futures has 50K and 100K. Crypto might use different denominations (BTC notional? USD-equivalent?).
3. **Is there a Promo tier?** Futures has a $19 50K Promo. Crypto equivalent (yes/no, price, eligibility).
4. **What's the simulated platform?** Futures uses NinjaTrader + Tradovate. Crypto might be Coinbase Advanced, Kraken, dYdX, or a custom sim — confirm before building.
5. **What's the live platform?** Futures graduates to T3 Global. Crypto might also be T3 Global, or a different desk (Galaxy, Wintermute, a market-maker partner).
6. **Live capital backing per account?** Futures: $2K per 50K account, $3K per 100K. Crypto: get the equivalent mapping.
7. **Payout processor?** Futures uses Rise. Crypto might use Rise too, or a different payout rail (USDC, wire, etc).
8. **Profit split?** Futures placeholder is 80/20 matching stocks/options. Confirm for crypto — it might match or differ.
9. **Per-cycle limits by account size?** Futures: 50K = $1K/$1.5K, 100K = $1.5K/$2K (cycles 1-3 vs 4+). Get the crypto equivalent.
10. **Lifetime cap per account?** Futures: $15K Growth-Funded, $25K Express. Get the crypto numbers.
11. **Position limits?** Futures uses minis/micros count. Crypto might use notional USD exposure, BTC quantity, or coin-specific limits.
12. **Scaling plan?** Futures has 5 tiers (< $1.5K, $1.5K-$2K, $2K-$3K, $3K-$4.5K, $4.5K+). Confirm crypto tiers and whether scaling applies the same way.
13. **Account limits?** Futures: 5 standard + 1 promo per person. Confirm crypto.
14. **Crypto-specific rules?** Any coin restrictions (e.g., only BTC/ETH/SOL)? Stablecoin trading allowed? Leverage rules? Funding rate handling? These may need to become new rows in the matrix.

### Step 2: Copy and rename

```powershell
Copy-Item futures-programs-build-sheet.html crypto-programs-build-sheet.html
```

Or via a script. Either way, work on a copy — don't edit the futures sheet itself.

### Step 3: Find-and-replace the obvious terms

These are mechanical replacements that the find/replace can do without thought:

- `Futures` → `Crypto`
- `futures` → `crypto`
- `NinjaTrader` → (whatever the crypto simulated platform is)
- `Tradovate` → (drop or replace if there's only one sim platform)
- `T3 Global` — leave for now; verify in Step 5 whether crypto also routes through T3
- `Rise` — leave for now; verify in Step 5
- Examples like `ES, NQ, RTY, YM, CL, NG, GC, SI` → crypto tickers (`BTC, ETH, SOL, AVAX, etc.`)
- `28 futures markets across equity indices, currencies, energy, metals, and agriculture` → crypto equivalent (e.g., `20 spot markets and perpetuals across major coins`)
- `CME, CBOT, NYMEX, COMEX` → crypto venue equivalents (`Binance, Coinbase, OKX, Bybit` or "via T3 Global aggregated liquidity")

### Step 4: Update the master matrix values

For each program column (Crypto Growth 50K, Crypto Growth 100K, Crypto Promo, Crypto Express 50K, Crypto Express 100K), fill in:

**Identity & Setup**
- Program type (Evaluation / Eval-Promo / Instant Funded)
- Account size (simulated)
- Platform — simulated row (merged across all 5 programs)
- Platform — live row (merged across all 5 programs)
- Account limit per person (5 standard / 1 Promo)

**Pricing**
- Initial fee · per program
- Activation fee · per program (N/A for Express)
- Reset fee · per program
- Monthly fee · per program (N/A in futures, may differ for crypto)
- Total cost to funded (no resets) · per program — this is initial + activation summed

**Risk Parameters**
- Max Drawdown · per program
- Daily Loss Limit · per program
- Breach rule · merged row (1 Soft → Hard, or different for crypto?)
- Profit Target (eval) · per Growth program (N/A for Express)
- Profit Cap (funded) · per program
- News trading allowed · merged row

**Trading Rules**
- Minimum hold time · merged row (futures: 15s — crypto might differ given lower latency / 24-7 markets)
- Consistency (eval) · per program
- Consistency (funded) · per program
- Min trading days (eval) · per Growth program
- Min trading days (funded) · per program
- Algo trading allowed · merged row (crypto-specific: API trading is far more common in crypto — confirm whether prohibited or allowed)

**Position Sizing (funded base)**
- Max minis (base) — futures-specific concept; crypto needs its own row labels (e.g., "Max BTC exposure" or "Max notional USD")
- Max micros (base) — same
- Scaling plan applied · merged row (yes if applicable)

**Payouts**
- Payout cycle · merged row (weekly?)
- Payout processor · merged row
- Per-cycle limit cycles 1-3 · per program
- Per-cycle limit cycles 4+ · per program
- Lifetime cap per account · per program
- Profit split · merged row — flag red if placeholder

### Step 5: Update the supporting blocks

Three blocks below the master matrix in the futures sheet, all of which crypto needs:

**Scaling Plan block** — the 5-tier table by profit level and account size. If crypto uses a different scaling structure (e.g., 3 tiers, or by notional rather than absolute profit), redesign this table to match.

**Account Limits block** — the 5 + 1 promo rule. Likely same for crypto, but confirm.

**Live Capital — T3 Global Backing block** (green-tinted) — the simulated → live capital mapping. If crypto goes to a different live desk, rename the block header and update the math.

### Step 6: Update footnotes and the build checklist

The futures sheet has 8 footnotes. Each is referenced by a small blue superscript in the Notes column or in cell values. When adding/removing/changing rules, also update the footnote text — and make sure the `<sup><a href="#fn-N">N</a></sup>` references still point to the right footnote IDs (`id="fn-N"`).

Crypto-specific footnotes you may need to add:
- Funding rate handling on perpetuals
- Stablecoin pair rules (if BTC/USDC allowed but BTC/USDT excluded, etc.)
- 24-7 market trading (changes the meaning of "trading day" and "daily" limits)
- API/algo trading policy (crypto traders use bots at much higher rates than futures)

The build checklist (14 items in the futures version) should be updated to reflect crypto-specific config tasks. Drop irrelevant items, add new ones for the platform integration and any crypto-only rules.

### Step 7: Verify and ship

Run the same checks as the futures sheet:

```bash
cd "main-site"
echo "Size:" && wc -c crypto-programs-build-sheet.html
echo "Tail:" && tail -3 crypto-programs-build-sheet.html
# Last line should be </html>

echo "No 'see fn' leftover:" && grep -c "see fn" crypto-programs-build-sheet.html
# Should be 0

echo "Clickable footnote anchors:" && grep -c 'class="fn-link"' crypto-programs-build-sheet.html
# Should match number of <sup> references in the document
```

Open it in a browser, click each footnote anchor (smooth-scrolls, target highlights yellow), test the zoom widget, then File → Print → confirm it fits one landscape letter page.

---

## Style conventions to preserve

These are visual decisions locked into the futures sheet that you should not change unless intentionally. Keeping them consistent across asset-class sheets makes the team's brain not have to context-switch.

### Color coding

| Element | CSS variable | Color | When to use |
|---|---|---|---|
| Growth columns | `--growth` | Pale blue `#e3f2fd` | Evaluation-path program columns |
| Promo column | `--promo` | Pale yellow `#fffbe6` | Promo discounted entry program |
| Express columns | `--express` | Pale purple `#f3e5f5` | Direct-funded program columns |
| Scaling Plan block | `--scale-bg` (only used for the .scale-table-wrap) | Lavender `#ead1dc` header | Position-scaling tier table |
| Live Capital block | `--live` | Pale green `#e8f5e9` | Graduation-to-live-capital section |
| Flag (needs confirm) | `--flag` | Pale red `#ffe0e0` | Cells with unresolved decisions blocking build |
| Group dividers | `--ink` (text in white) | Black `#111` | Section headers inside the matrix |
| Cell text | `--ink` | Dark gray `#111` | Regular cell content |
| Notes column text | `--ink-mute` | Mid gray `#888` | Notes column secondary text |

### Footnote pattern

- Each footnote in the bottom-left `.footnotes` block gets `id="fn-1"` through `id="fn-N"`
- Each in-cell reference becomes `<sup><a href="#fn-N" class="fn-link">N</a></sup>`
- `.fn-link` styled blue `#1a73e8` with bold weight and dotted underline; on hover, inverts to white-on-blue pill
- Clicking jumps to the footnote and highlights it (pale yellow background + orange left bar via `.footnotes li:target`)
- Smooth scroll via `html { scroll-behavior: smooth; }`
- `scroll-margin-top: 60px` on `.footnotes li` keeps the target from being hidden behind the floating zoom widget

### Flag cells (needs confirmation)

Two cells in the futures sheet have the red `.flag` class: profit split and payout cycle close day. Use the same class for any crypto cell that's a placeholder blocking implementation. These visually pop in red against the otherwise neutral matrix so a builder immediately sees "I can't ship this until Jason confirms."

### Zoom widget

The futures sheet has a floating zoom control (top-right). It's already in the CSS and JS. Keep it. It hides on print via `@media print`.

### Print rules

`@media print { @page { size: letter landscape; margin: 0.4in; } }`

Keep the same. If the crypto sheet grows past one page, prefer to:
1. Remove redundant rows (collapse merged ones)
2. Tighten font sizes by 0.5pt
3. Reorder columns to fit narrower content

Adding a second page is a last resort. The whole point is "one sheet."

---

## Common pitfalls (the time-sinks that hit me building futures)

### OneDrive write truncation

Writes to OneDrive-synced folders intermittently truncate around the 22-28KB boundary. The `Write` tool reports success but the file ends mid-content. Symptoms: tail shows `</scr` or content ends mid-line.

**Mitigation:**
- Always verify the tail after a `Write`: `tail -3 crypto-programs-build-sheet.html` should end with `</html>`
- If truncated, recover via Python atomic-write that appends the missing tail and uses `tempfile.mkstemp` + `os.replace` (see HANDOFF-2026-05-27 for the pattern)
- Targeted `Edit` calls are more reliable for surgical changes (small diff) than full `Write` calls for large files
- After many sequential `Edit`s, the file may also lose its closing tags — verify after each substantive batch

### Footnote drift

When you change a row's footnote reference (e.g., add `<sup>9</sup>`) but forget to add the matching `<li id="fn-9">` to the footnotes block, the anchor link 404s silently. Always verify count parity:

```bash
grep -oE 'href="#fn-[0-9]+"' build-sheet.html | sort -u | wc -l
grep -oE 'id="fn-[0-9]+"' build-sheet.html | sort -u | wc -l
# Both numbers should match
```

### Label / destination mismatches

In the futures site, the nav had a "Stocks & Options" link that pointed to a futures-newsletter page — a pre-existing source bug we caught only after the live walk-through. Crypto may have similar mismatches. Read every label out loud and confirm where the underlying link points.

### Ambiguous numeric values

Avoid bare numbers in cells. Always include units. The futures sheet originally had "1" and "10" for trading days, which led to "10 what?" confusion. Now it shows "1 day*" and "10 days*" with footnote pointers. Same rule for any crypto cell:
- "5" → "5 BTC" or "5 contracts" or "5 days"
- "100" → "100%" or "$100" or "100 SOL"
- "30" → "30%" or "30 days" or "30 trades"

### Placeholders that aren't visible

Anything you don't know yet must be visually flagged (red `.flag` class) so the build team can't accidentally ship with a guess. Don't leave plain text "TBD" — it disappears against neutral cells. Use the red flag styling.

### Em dashes in body text

Per the broader site convention (CLAUDE.md): no em dashes (`—`) in customer-facing body text. Dev/internal documents like this build sheet are fine, but if any of the sheet's content gets copied verbatim into customer-facing pages, strip the em dashes there.

---

## Reference: futures sheet field inventory

Quick checklist of every parameter the futures sheet captures. Use as a template to make sure the crypto sheet doesn't accidentally drop a row:

**Matrix rows (31 in futures):**

1. Program type
2. Account size (simulated)
3. Platform (simulated) — merged
4. Platform (live) — merged
5. Account limit per person
6. Initial fee
7. Activation fee
8. Reset fee
9. Monthly fee
10. Total cost to funded
11. Max Drawdown
12. Daily Loss Limit
13. Breach rule — merged
14. Profit Target (eval)
15. Profit Cap (funded)
16. News trading allowed — merged
17. Minimum hold time — merged
18. Consistency rule (eval)
19. Consistency rule (post-fund)
20. Min trading days (eval)
21. Min trading days (funded)
22. Algo trading allowed — merged
23. Max position units (base, pre-scale) [futures: minis]
24. Max position units (base, pre-scale) [futures: micros]
25. Scaling plan applied — merged
26. Payout cycle — merged
27. Payout processor — merged
28. Per-cycle limit (cycles 1-3)
29. Per-cycle limit (cycles 4+)
30. Lifetime cap (per account)
31. Profit split (trader / firm) — merged

**Supporting blocks (3):** Scaling Plan, Account Limits, Live Capital Mapping

**Footnotes (8):** Max Drawdown EOD behavior; 1 Soft → Hard breach state machine; Profit Cap per-session behavior; Consistency-rule recalculation; Profit split placeholder; Min trading days calendar-vs-trading; Algo trading enforcement; Payout cycle close day & cutoff

**Build checklist (14 items):** SKU creation, prices, thresholds, breach state machine, scaling tier engine, payout cycle to Rise, per-cycle limits, lifetime caps, KYC gate, promo separation, live handoff, profit split confirm, calendar-day confirm, payout cycle close day confirm

---

## When this doc becomes a 3rd, 4th, 5th asset class

If after crypto you also need this pattern for spot FX, indices, or any other product, copy this same doc, retitle, and follow the same process. The futures and crypto sheets become the templates. Watch for cross-asset-class differences — e.g., FX has overlapping session times that affect "daily" rules; indices may have specific contract roll mechanics.

The pattern is portable. The matrix design, footnote system, color conventions, and zoom widget all carry over.

---

**End of build sheet instructions — 2026-05-27.**
