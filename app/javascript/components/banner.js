import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Las mejores prendas del peru"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
