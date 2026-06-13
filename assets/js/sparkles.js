/* TradeFundrr hero sparkles — deferred generation
 * Was previously ~700 inline <span> elements in index.html (~120 KB of HTML).
 * Now generated client-side after page load so the critical render path is leaner.
 * Runs after DOMContentLoaded via requestIdleCallback (falls back to setTimeout).
 */
(function () {
  'use strict';

  // Deterministic pseudo-random (mulberry32) seeded per layer so the same visual
  // pattern repeats on every load (matches prior inline-generated look).
  function mulberry32(seed) {
    return function () {
      seed |= 0; seed = (seed + 0x6D2B79F5) | 0;
      var t = Math.imul(seed ^ (seed >>> 15), 1 | seed);
      t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
      return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
    };
  }

  function pick(rng, choices, weights) {
    var total = 0, i;
    for (i = 0; i < weights.length; i++) total += weights[i];
    var r = rng() * total;
    for (i = 0; i < choices.length; i++) {
      r -= weights[i];
      if (r <= 0) return choices[i];
    }
    return choices[choices.length - 1];
  }

  // Vault interior emission ellipse (shared by particles + leak sparkles)
  var VAULT_CX = 74, VAULT_CY = 50, INT_RX = 12, INT_RY = 19;

  // ============================================================
  // Layer 1 — Comet streak particles (150)
  // Origin: vault interior; trajectory: wide fan toward left side
  // Duration: 22-40s (slow), endpoints spread 5-30% X / 5-95% Y
  // ============================================================
  function buildParticles(rng) {
    var container = document.querySelector('.hero__particles');
    if (!container) return;
    var frag = document.createDocumentFragment();
    for (var i = 0; i < 150; i++) {
      var angle = rng() * 2 * Math.PI;
      var r = Math.sqrt(rng());
      var x = VAULT_CX + INT_RX * r * Math.cos(angle);
      var y = VAULT_CY + INT_RY * r * Math.sin(angle);
      var end_x = 5 + rng() * 25;          // 5-30%
      var end_y = 5 + rng() * 90;          // 5-95%
      var travel = end_x - x;              // negative vw → leftward
      var cy = end_y - y - 6;
      var dur = (22 + rng() * 18).toFixed(1);
      var delay = (rng() * 30).toFixed(1);
      var drift_y = Math.round(-20 + rng() * 50);
      var opacity = (0.55 + rng() * 0.43).toFixed(2);
      var size = pick(rng, [1, 2, 3], [40, 45, 15]);
      var span = document.createElement('span');
      span.style.cssText =
        '--x:' + x.toFixed(1) + '%;' +
        '--y:' + y.toFixed(1) + '%;' +
        '--travel:' + travel.toFixed(1) + 'vw;' +
        '--cy:' + cy.toFixed(1) + 'vh;' +
        '--delay:' + delay + 's;' +
        '--dur:' + dur + 's;' +
        '--drift-y:' + drift_y + 'px;' +
        '--opacity:' + opacity + ';' +
        '--size:' + size + 'px';
      frag.appendChild(span);
    }
    container.appendChild(frag);
  }

  // ============================================================
  // Layer 2 — Leak sparkles (500)
  // Origin: vault interior; direction: radial outward with ±25° jitter
  // Duration: 150-240s (very slow); travel 800-1700px (reaches edges)
  // ============================================================
  function buildLeak(rng) {
    var container = document.querySelector('.hero__leak');
    if (!container) return;
    var frag = document.createDocumentFragment();
    for (var i = 0; i < 500; i++) {
      var angle = rng() * 2 * Math.PI;
      var r = Math.sqrt(rng());
      var x = VAULT_CX + INT_RX * r * Math.cos(angle);
      var y = VAULT_CY + INT_RY * r * Math.sin(angle);
      var out_angle = Math.atan2(y - VAULT_CY, x - VAULT_CX) + (rng() - 0.5) * 0.8;
      var dist = 800 + rng() * 900;        // 800-1700px
      var dx = Math.round(Math.cos(out_angle) * dist);
      var dy = Math.round(Math.sin(out_angle) * dist);
      var dur = (150 + rng() * 90).toFixed(1);
      var delay = (rng() * 200).toFixed(1);
      var size = pick(rng, [1, 2, 3], [35, 50, 15]);
      var span = document.createElement('span');
      span.style.cssText =
        '--x:' + x.toFixed(1) + '%;' +
        '--y:' + y.toFixed(1) + '%;' +
        '--dx:' + dx + 'px;' +
        '--dy:' + dy + 'px;' +
        '--dur:' + dur + 's;' +
        '--delay:' + delay + 's;' +
        '--size:' + size + 'px';
      frag.appendChild(span);
    }
    container.appendChild(frag);
  }

  // ============================================================
  // Layer 3 — Cosmic backdrop dots (45) — static positions, twinkle in place
  // ============================================================
  function buildBackdrop(rng) {
    var container = document.querySelector('.hero__sparkles');
    if (!container) return;
    var frag = document.createDocumentFragment();
    for (var i = 0; i < 45; i++) {
      var top = (rng() * 95).toFixed(0);
      var left = (rng() * 95).toFixed(0);
      var size = pick(rng, [1, 2, 3], [50, 35, 15]);
      var opacity = (0.4 + rng() * 0.5).toFixed(2);
      var span = document.createElement('span');
      // Half of these get the "tw" twinkle class
      if (rng() < 0.6) span.className = 'tw';
      span.style.cssText =
        '--top:' + top + '%;' +
        '--left:' + left + '%;' +
        '--size:' + size + 'px;' +
        '--o:' + opacity;
      frag.appendChild(span);
    }
    container.appendChild(frag);
  }

  function run() {
    // Skip on reduced-motion preference and on phones (CSS already hides .hero__leak below 900px)
    if (window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
      return;
    }
    buildParticles(mulberry32(601));
    buildLeak(mulberry32(524));
    buildBackdrop(mulberry32(900));
  }

  function schedule() {
    if ('requestIdleCallback' in window) {
      requestIdleCallback(run, { timeout: 800 });
    } else {
      setTimeout(run, 200);
    }
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', schedule);
  } else {
    schedule();
  }
})();
