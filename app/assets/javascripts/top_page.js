$(function() {

  // 親カテゴリーを追加するための処理
  $("#headerCategory").on("mouseover", function() {
    let id = this.id;
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
      $(".child_category").remove();
      $(".grand_child_category").remove();

      $.ajax({
        type: 'GET',
        url: 'categories#index',//categories#indexアクションに送る
        data: {parent_id: id},//どの親の要素かを送る
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
          let html = buildChildHTML(child);//HTMLを作成する
          $(".children_list").append(html);//リストに追加する
        });
      });
    });

    // 孫カテゴリを追加する処理
    function buildGrandChildHTML(child){
      let html =`<a class="grand_child_category" id="${child.id}"
                 href="/category/${child.id}">${child.name}</a>`;
      return html;
    }

    $(document).on("mouseover", ".child_category", function () {
      let id = this.id;
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
    $(document).on("mouseover", ".grand_child_category", function () {
      let id = this.id;
    });

  // マウスがカテゴリーから離れた際の処理
  $(".mainTopVisual").on("mouseover", function() {
    $(".category_list").css("display", "none");
  });
});