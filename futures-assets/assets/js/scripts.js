(function () {
  var titles = document.querySelectorAll(".faq__box-title");
  titles.forEach(function (title) {
    title.addEventListener("click", function () {
      var box = title.closest(".faq__box");
      if (box) box.classList.toggle("faq__box--active");
    });

    title.addEventListener("keydown", function (e) {
      if (e.key === "Enter" || e.key === " ") {
        e.preventDefault();
        var box = title.closest(".faq__box");
        if (box) box.classList.toggle("faq__box--active");
      }
    });

    if (!title.hasAttribute("tabindex")) title.setAttribute("tabindex", "0");
    title.style.cursor = "pointer";
  });
})();

// Mobile header button: toggle nav visibility and animate burger -> cross
(function () {
  var btn = document.querySelector('.header__button');
  var navi = document.getElementById('navi');

  if (!btn || !navi) return;

  // accessibility
  btn.setAttribute('aria-controls', 'navi');
  btn.setAttribute('aria-expanded', 'false');
  btn.setAttribute('aria-label', 'Toggle navigation');

  btn.addEventListener('click', function (e) {
    var isActive = btn.classList.toggle('is-active');
    navi.classList.toggle('header__navi--open', isActive);
    btn.setAttribute('aria-expanded', isActive ? 'true' : 'false');
  });

  // close when clicking outside (mobile)
  document.addEventListener('click', function (e) {
    if (!isSmallScreen()) return;
    if (!btn.contains(e.target) && !navi.contains(e.target) && navi.classList.contains('header__navi--open')) {
      btn.classList.remove('is-active');
      navi.classList.remove('header__navi--open');
      btn.setAttribute('aria-expanded', 'false');
    }
  });

  // When resizing to large screens, ensure classes removed
  window.addEventListener('resize', function () {
    if (!isSmallScreen()) {
      btn.classList.remove('is-active');
      navi.classList.remove('header__navi--open');
      btn.setAttribute('aria-expanded', 'false');
    }
  });

  function isSmallScreen() {
    return window.matchMedia('(max-width: 1024px)').matches;
  }
})();

// Toggle 'Also available' programs details
(function () {
  var toggle = document.querySelector('.programs__also-btn');
  if (!toggle) return;

  var container = toggle.closest('.programs__also');
  toggle.setAttribute('role', 'button');
  toggle.setAttribute('tabindex', '0');

  function setActive(state) {
    if (!container) return;
    container.classList.toggle('programs__also--active', state);
  }

  toggle.addEventListener('click', function (e) {
    e.preventDefault();
    setActive(!container.classList.contains('programs__also--active'));
  });

  toggle.addEventListener('keydown', function (e) {
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault();
      setActive(!container.classList.contains('programs__also--active'));
    }
  });

  // close when clicking outside
  document.addEventListener('click', function (e) {
    if (!container) return;
    if (!container.contains(e.target) && container.classList.contains('programs__also--active')) {
      setActive(false);
    }
  });
})();

// Tabs 
document.addEventListener('DOMContentLoaded', () => {
  const tabs = document.querySelector('.tabs');
  if (!tabs) return;
  const buttons = tabs.querySelectorAll('.tabs__item');
  const panels = tabs.querySelectorAll('.tabs__panel');

  buttons.forEach(btn => {
    btn.addEventListener('click', () => {
      const target = btn.dataset.tab;
      buttons.forEach(b => b.classList.toggle('tabs__item--active', b === btn));
      panels.forEach(p => p.hidden = p.dataset.panel !== target);
    });
  });
});
