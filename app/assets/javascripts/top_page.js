$(function() {
  // 子カテゴリーを追加するための処理です。
    function buildChildHTML(child){
      var html =`<a class="child_category" id="${child.id}" 
                  href="/category/${child.id}">${child.name}</a>`;
      return html;
    }
  
    $(".parent_category").on("mouseover", function() {
      var id = this.id//どのリンクにマウスが乗ってるのか取得します
      $(".now-selected-red").removeClass("now-selected-red")//赤色のcssのためです
      $('#' + id).addClass("now-selected-red");//赤色のcssのためです
      $(".child_category").remove();//一旦出ている子カテゴリ消します！
      $(".grand_child_category").remove();//孫、てめえもだ！
      $.ajax({
        type: 'GET',
        url: '/category/search',//とりあえずここでは、newアクションに飛ばしてます
        data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
          var html = buildChildHTML(child);//HTMLにして
          $(".children_list").append(html);//リストに追加します
        })
      });
    });
  
    // 孫カテゴリを追加する処理です　基本的に子要素と同じです！
    function buildGrandChildHTML(child){
      var html =`<a class="grand_child_category" id="${child.id}"
                 href="/category/${child.id}">${child.name}</a>`;
      return html;
    }
  
    $(document).on("mouseover", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
      var id = this.id
      $(".now-selected-gray").removeClass("now-selected-gray");//灰色のcssのため
      $('#' + id).addClass("now-selected-gray");//灰色のcssのため
      $.ajax({
        type: 'GET',
        url: '/category/search',
        data: {parent_id: id},
        dataType: 'json'
      }).done(function(children) {
        children.forEach(function (child) {
          var html = buildGrandChildHTML(child);
          $(".grand_children_list").append(html);
        })
        $(document).on("mouseover", ".child_category", function () {
          $(".grand_child_category").remove();
        });
      });
    });  
  });


// $(function() {
//   function buildHTML(parent) {
//     let html = `
//                 <div class="Itemcategory">
//                   <ul class="itemcategory__parent">
//                     <li class="parent__list">
//                       <a href="#" class="itemcategory__parent--name">
//                         ${parent.name}
//                       </a>
//                     </li>
//                   </ul>
//                 </div>
//                 `
//     return html;
//   };
//   $("#headerCategory").on('click', function() {
    
//     let insertHTML = '';

//     parents = $('.parents').val();
//     console.log(parents);
//     $(function(parents) {
//       parent = parents.find(1);
      
      
//     });




    // $("#headerCategory").on("click",function(){
      // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
      // let parentValue = document.getElementById("parent-form").value;
      // let parentValue = $("#headerCategory").value;
  　　//　("parent-form")は親ボックスのid属性
      // $.ajax({
      //   url: '/items/search',
      //   type: "GET",
      //   data: {
      //     parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
      //   },
      //   dataType: 'json'
  　　　　//json形式を指定
      // })









    // $.each(parents, function(i, parent) {
    //   insertHTML += buildHTML(parent);
    // });
    // $("#headerCategory").append(insertHTML);
    // $.each(@parents, function(name, parent){
    //   console.log("parent.name");
    //   let html2 = parent.name;
    // });
    // $(".itemcategory__parent--name").append(html2);
//   });

//   $(function() {
            
//     // 配列を変数に格納
//     let arr = ['高崎','前橋','太田', '伊勢崎'];
  
//     // each()に引数を指定してループ処理
//     $.each(arr, function(i, val) {
  
//       // コンソールに1つずつ出力
//       console.log(i+':'+val);
  
//       // 値が前橋の次から中断
//       return (val != '前橋');
  
//     });
//   });

// });

