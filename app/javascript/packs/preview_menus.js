document.addEventListener("turbolinks:load", function(){
  // fileの中の画像が変更さえたときに、そのinputタグのカスタムデータ属性を取得
  $('.change-file').on('change', function(event) {
    let data_id = event.target.getAttribute('data-menu-file-id');
    console.log(data_id);
    // 中のsrcを入れ替える
  })
})