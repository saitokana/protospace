$(document).on('ready page:load', function() {
  addMainImage();
  addSubImage();
  addNewFrom();
  editMainImage();
});

function addNewFrom(){
  $('#add_new_form').on('click', function(){
    $('#hide_form').show();
    $(this).hide();
  })
}


function addMainImage(){
  $('#prototype_captured_images_attributes_0_main').change(function(){
    if(!this.files.length){
      return; //ファイルがない場合undefined値を返す 選択した画像の数だけfilesという配列にはいっている
    }
    else{
    var file = $(this).prop('files')[0]; //対象ファイルの取得
    var fileReader = new FileReader();//何回か利用するので適当な変数に代入 ・FileReaderクラスを起動
    fileReader.onload = function(){ //読み込み後の処理onload(読み込み完了時のタイミングで発火するイベント)
    var main = $('#main_image_preview')
    main.attr('src', fileReader.result);
    main.css('display', 'block');
    }
    fileReader.readAsDataURL(file);
    }
  });
}

function addSubImage(){
  for(var i = 1; i <= 4; i++){
    $('#prototype_captured_images_attributes_0_sub' + i).change(function(){
      if(!this.files.length){
        return;
      }
      var file = $(this).prop('files')[0];
      var fileReader = new FileReader();
      fileReader.onload = function(){
        $('#sub_' + i).attr('src', fileReader.result);
        $('#sub_' + i).css('display', 'block');
      }
      fileReader.readAsDataURL(file);
    });
}
}

function editMainImage(){
  $('#prototype_captured_images_attributes_0_name').change(function(){
    if(!this.files.length){
      return; //ファイルがない場合undefined値を返す 選択した画像の数だけfilesという配列にはいっている
    }
    else{
    var file = $(this).prop('files')[0]; //対象ファイルの取得
    var fileReader = new FileReader();//何回か利用するので適当な変数に代入 ・FileReaderクラスを起動
    fileReader.onload = function(){ //読み込み後の処理onload(読み込み完了時のタイミングで発火するイベント)
    var main = $('#main_image_preview')
    main.attr('src', fileReader.result);
    main.css('display', 'block');
    }
    fileReader.readAsDataURL(file);
    }
  });
}
