$(function(){
  avatar_preview();
});


function avatar_preview(){
  $('#user_avatar').change(function(){
    if(!this.files.length){
      return;
    }
    else{
      const file = $(this).prop('files')[0];
      const fileReader = new FileReader();
      fileReader.onload = function(){
        console.log(fileReader.result)
      $(".user-image").css('background-image', "url(" + fileReader.result + ")");
    }
    fileReader.readAsDataURL(file);
  }
  });
}

