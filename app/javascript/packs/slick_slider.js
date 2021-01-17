document.addEventListener("turbolinks:load", function(){
  $('.slider').slick({
      arrows: true,
      prevArrow:'<i class="angle left big icon"></i>',
      nextArrow:'<i class="angle right big icon"></i>',
      dots: true,
      autoplay: true,
      autoplaySpeed: 4000,
      speed: 800
  });
  $('.slick-dots li').on('mouseover', function() {
    $('.slider').slick('goTo', $(this).index());
  });
});