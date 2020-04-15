$(function(){

  var dataBox = new DataTransfer();
  var file_box = document.querySelector('input[type = file]')

  // 以下画像ファイルを選択した時のイベント
  $('#img-file').change(function(){
    var file = $('input[type = file]').prop('files')[0];
    $.each(this.files, function(i, file){
      var file_img = new FileReader();
  
      dataBox.items.add(file)
      file_box.files = dataBox.files
  
      var num = $('.item-img').length + 1 + i
      file_img.readAsDataURL(file);
  
      // 投稿した画像が10枚になったらフォームを消す
      if(num == 10){
        $('#box').css('display', 'none')
      }
      // 画像をテキストボックスに入れた際に追加するビュー
      file_img.onload = function(){
        var src = file_img.result
        var html = `<div class = 'item-img' data-image = '${(file.name)}'>
                      <div class = 'item-img_content'>
                        <div class = 'item-img_content_icon'>
                          <img src="${src}" width="100" height="100">
                        </div>
                      </div>
                      <div class = 'item-img_operetion'>
                        <div class = 'item-img_operetion_delete'>削除</div>
                        <div class = 'item-img_operetion_edit'>編集</div>
                      </div>
                    </div>`
                        
        $('#box').before(html);
      };
      $('#box').attr('class', `sell-image_box-${num}`)
    });
  });

  // 画像を削除するアクション
  $(document).on('click', '.item-img_operetion_delete', function(){
    var delete_img = $(this).parents('.item-img')
    var delete_name = $(delete_img).data('image')
    if(file_box.files.length == 1){
      $('input[type=file]').val(null)
      dataBox.clearData();
    }else{
      $.each(file_box.files, function(i, input){
        if(input.name == delete_name){
          dataBox.items.remove(i)
        }
      })
      file_box.files = dataBox.files
    }
    delete_img.remove()
    
    var num = $('.item-img').length
    $('#box').show()
    $('#box').attr('class', `sell-image_box-${num}`)
  })

  $('.item-img_operetion_delete').on('click', function(){
    var index = $(this).data('index')
    var btn = document.getElementById(`product_images_attributes_${index}__destroy`);
    btn.checked = true;
  });

  $('.item-img_operetion_edit').on('click', function(){
    var index = $(this).data('index')
    $(`#product_images_attributes_${index}_src`).click();
  });

  $('.sub__image').click(function () {
    var $src = $(this).attr('src');
    $('.main__image').attr('src', $src);
  });
});