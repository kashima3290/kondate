// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('jquery')
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("semantic-ui-sass")
require ('packs/slick_slider.js')
// require("packs/preview.js")
// require("packs/preview_menus.js")

jQuery(document).on('turbolinks:load', function(){
  $('.ui.dropdown').dropdown();
  $('.special.cards .image').dimmer({
    on: 'hover'
  });
  $('.ui.dividing.header.menu-history-edit') // メニュー履歴の編集表示
   .popup({
    on: 'hover'
  });
})

//= require_directory .
//= require_tree .