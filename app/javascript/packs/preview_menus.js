document.addEventListener("turbolinks:load", function(){
  // fileの中の画像が変更さえたときに、そのinputタグのカスタムデータ属性を取得
  $('.change-file').on('change', function(event) {
    let data_id = event.target.getAttribute('data-menu-file-id');
    console.log(event.target);
    // idが同じimageのsrcを入れ替える
    // let image = document.querySelector('.change-image')
    // console.log(image.dataset.menuImageId)
    // ボタンを変更・削除ができるように編集
  })
})