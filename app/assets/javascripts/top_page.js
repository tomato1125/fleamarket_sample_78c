$(function() {

  // 親カテゴリーを追加するための処理
  $("#headerCategory").on("mouseover", function() {
    let id = this.id;
    console.log(this.id);

    $(".category_list").css("display", "flex");
    $(".child_category").remove();
    $(".grand_child_category").remove();
  });


  // 子カテゴリーを追加するための処理
    function buildChildHTML(child){
      let html =`<a class="child_category" id="${child.id}" 
                  href="/category/${child.id}">${child.name}</a>`;
      return html;
    }
  
    $(".parent_category").on("mouseover", function() {
      let id = this.id;//どのリンクにマウスが乗ってるのか取得
      console.log(this.id);

      $(".child_category").remove();//一旦出ている子カテゴリ削除
      $(".grand_child_category").remove();//孫カテゴリ削除

      $.ajax({
        type: 'GET',
        url: 'categories#index',//categories#indexアクションに飛ばす
        data: {parent_id: id},//どの親の要素かを送る
        dataType: 'json'
      }).done(function(children) {
        
        children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
          
          let html = buildChildHTML(child);//HTMLを作成する
          $(".children_list").append(html);//リストに追加する
        });
      });
    });
  

    // 孫カテゴリを追加する処理 基本的に子要素と同じ
    function buildGrandChildHTML(child){
      let html =`<a class="grand_child_category" id="${child.id}"
                 href="/category/${child.id}">${child.name}</a>`;
      return html;
    }

    $(document).on("mouseover", ".child_category", function () {
      // 子カテゴリーのリストは動的に追加されたHTMLのため
      let id = this.id;
      console.log(this.id);

      $(".grand_child_category").remove();

      $.ajax({
        type: 'GET',
        url: 'categories#index',
        data: {parent_id: id},
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {
          let html = buildGrandChildHTML(child);
          $(".grand_children_list").append(html);
        })
      });
    });

    // 孫カテゴリーにマウスオーバーした際の処理
    // $(document).on("mouseover", ".grand_category", function () {
      // 子カテゴリーのリストは動的に追加されたHTMLのため
    //   let id = this.id;
    //   console.log(this.id);
    // });


  // マウスがカテゴリーから離れた際の処理
  $(".mainTopVisual").on("mouseover", function() {
    $(".category_list").css("display", "none");
  });
});