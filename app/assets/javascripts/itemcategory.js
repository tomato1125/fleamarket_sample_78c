
  //カテゴリーボックスのオプション
  $(function(){
    function appendOption(itemcategory){
      let html = `<option value="${itemcategory.id}" data-itemcategory="${itemcategory.id}">${itemcategory.name}</option>`;
      return html;
    }

    //子カテゴリーボックス
    function appendChidrenBox(insertHTML){
      let childSelectHtml = '';
      childSelectHtml = `<div class='categorySelecter__contents__choose' id= 'children_wrapper'>
                          <div class='categorySelecter__contents__choose1'>
                            <select class="categorySelecter__input" id="child_itemcategory" name="item[itemcategory_id]">
                              <option value="" data-itemcategory="">選択してください</option>
                                ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.categorySelecter__contents').append(childSelectHtml);
    }

    //孫カテゴリーボックス
    function appendGrandchidrenBox(insertHTML){
      let grandchildSelectHtml = '';
      grandchildSelectHtml = `<div class='categorySelecter__contents__choose' id= 'grandchildren_wrapper'>
                                <div class='categorySelecter__contents__choose2'>
                                  <select class="categorySelecter__input" id="grandchild_itemcategory" name="item[itemcategory_id]">
                                    <option value="" data-itemcategory="">選択してください</option>
                                    ${insertHTML}
                                  </select>
                                </div>
                              </div>`;
      $('.categorySelecter__contents').append(grandchildSelectHtml);
    }

    // 親カテゴリー選択後のイベント
    $('#parent_itemcategory').on('change', function(){
      let parentItemcategory = document.getElementById('parent_itemcategory').value;
      if (parentItemcategory != "選択してください"){
        $.ajax({
          url: '/items/itemcategory/get_itemcategory_children',
          type: 'GET',
          data: { parent_name: parentItemcategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove();
          $('#grandchildren_wrapper').remove();
          let insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('再度カテゴリーを選択してください');
        })
      }else{
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
      }
    });
    // 子カテゴリー選択後のイベント
    $('.categorySelecter__contents').on('change','#child_itemcategory', function(){
      let childId = $('#child_itemcategory option:selected').data('itemcategory');
      if (childId != "選択してください"){
        $.ajax({
          url: '/items/itemcategory/get_itemcategory_grandchildren',
          type: 'GET',
          data: { child_id: childId},
          dataType: 'json'
        })
        .done(function(grandchildren){
          if (grandchildren.length != 0) {
            $('#grandchildren_wrapper').remove();
            var insertHTML = '';
            grandchildren.forEach(function(grandchild){
              insertHTML += appendOption(grandchild);
            });
            appendGrandchidrenBox(insertHTML);
          }
        })
        .fail(function(){
          alert('再度カテゴリーを選択してください');
        })
      }else{
        $('#grandchildren_wrapper').remove();
      }
    });
  })
