$(function(){
  //共通の定数を定義==================================================================
  const prevContent = $('.label-content').prev();

  //プレビューのhtmlを定義============================================================
  function buildHTML(id,image) {
    var html = `<div class="preview-box">
                  <div class="upper-box">
                    <img src=${image} alt="preview">
                  </div>
                  <div class="lower-box">
                    <div class="delete-box">
                      <div class="delete-btn" data-delete-id= ${id}>削除</div>
                    </div>
                  </div>
                </div>`
    return html;
  }

  //==================================================
  //ラベルのwidth・id・forの値を変更
  //==================================================
  function setLabel(count) {
    //プレビューが5個あったらラベルを隠す
    if (count == 5) { 
      $('.label-content').hide();
    } else {
      //プレビューが4個以下の場合はラベルを表示
      $('.label-content').show();
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      labelWidth = (620 - parseInt($(prevContent).css('width')));
      $('.label-content').css('width', labelWidth);
      //id・forの値を変更
      $('.label-box').attr({for: `item_images_attributes_${count}_image`});
    }
  }

  //====================================================
  //編集ページ(items/:i/edit)へリンクした際のアクション
  //====================================================
  if (window.location.href.match(/\/items\/\d+\/edit/)){
    //プレビューの数を取得
    var count = $('.preview-box').length;
    //countに応じてラベルのwidth・id・forの値を変更
    setLabel(count) 
  }

  //=======================================================
  //プレビューの追加
  //=======================================================
  $(document).on('change', '.hidden-field', function() {
    //hidden-fieldのidの数値のみ取得
    var id = $(this).attr('id').replace(/[^0-5]/g, '');
    //選択したfileのオブジェクトを取得
    var file = this.files[0];
    var reader = new FileReader();
    //readAsDataURLで指定したFileオブジェクトを読み込む
    reader.readAsDataURL(file);
    //読み込み時に発火するイベント
    reader.onload = function() {
      var image = this.result;
      //htmlを作成
      var html = buildHTML(id,image);
      //ラベルの直前のプレビュー群にプレビューを追加
      $(prevContent).append(html);
      //プレビューの数を取得
      var count = $('.preview-box').length;
      //countに応じてラベルのwidth・id・forの値を変更
      setLabel(count);
    }
  });

  //=====================================================================
  // 画像の削除
  //=====================================================================
  $(document).on('click', '.delete-btn', function() {
    var id = $(this).attr('data-delete-id')
    //削除用チェックボックスがある場合はチェックボックスにチェックを入れる
    if ($(`#item_images_attributes_${id}__destroy`).length) {
      $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
    }
    //画像を消去
    $(this).parent().parent().parent().remove();
    //フォームの中身を削除
    $(`#item_images_attributes_${id}_image`).val("");
    //プレビューの数を取得
    var count = $('.preview-box').length;
    //countに応じてラベルのwidth・id・forの値を変更
    setLabel(count);
  });


  //=====================================================================
  // 手数料の計算
  //=====================================================================
  $('#inputPrice').on('input', function() {  //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#inputPrice').val();  // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡Math.roundは、引数で与えた数値を四捨五入して、最も近似の整数を返す。
    var fee = (data - profit)  // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.sellingFee__price').html(fee)  //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡（appendとは異なる）
    $('.sellingFee__price').prepend('¥')  // 手数料の前に¥マークを付けたいので
    $('.selesProfit__rightBar2').html(profit)
    $('.selesProfit__rightBar2').prepend('¥')
    $('#price').val(profit)  // 計算結果を格納用フォームに追加｡もし､入力値を追加したいのなら､今回はdataを引数に持たせる｡
    if(profit == '-') {  // もし､計算結果が''なら表示も消す｡
    $('.selesProfit__rightBar2').html('');
    $('.sellingFee__price').html('');
    }
  })
});

