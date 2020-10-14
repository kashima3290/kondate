document.addEventListener("turbolinks:load", function(){
  // function imgPreView(event, targetId) {
  //   let file = event.target.files[0];
  //   let reader = new FileReader();
  //   let preview = document.getElementById(targetId);
  //   let previewImage = document.getElementById("previewImage-"+targetId);
  //   if(previewImage != null) {
  //     preview.removeChild(previewImage);
  //   }
  //   reader.onload = function(event) {
  //      let img = document.createElement("img");
  //      img.setAttribute("src", reader.result);
  //      img.setAttribute("id", "previewImage-"+targetId);
  //      preview.appendChild(img);
  //   };
  //   reader.readAsDataURL(file);
  // };
  document.getElementById("preview1").onclick = function() {
    console.log('file');
  };
})
