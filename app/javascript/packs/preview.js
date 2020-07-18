$(document).on('turbolinks:load', function() {
  $(function () {
    function buildHTML(image){
      var html = `
      <img src="${image}", alt="preview" class="change-image">
      `
      return html;
    }
    $(document).on('change', '.change-file', function() {
      console.log('hello');
    })
  })
})