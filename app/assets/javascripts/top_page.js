$(function() {
  function buildHTML() {
    let html = `
                <div class="Itemcategory">
                  <ul class="itemcategory__parent">
                    <li class="parent__list">
                      <a href="#" class="itemcategory__parent--name">
                        = @parents
                      </a>
                    </li>
                  </ul>
                </div>
                `
    return html;
  }
  $("#headerCategory").on('click', function() {
    console.log("Hello world");
    let html = buildHTML();
    $("#headerCategory").append(html);
    // $.each(@parents, function(name, parent){
    //   console.log("parent.name");
    //   let html2 = parent.name;
    // });
    // $(".itemcategory__parent--name").append(html2);
  });

  $(function() {
            
    // 配列を変数に格納
    let arr = ['高崎','前橋','太田', '伊勢崎'];
  
    // each()に引数を指定してループ処理
    $.each(arr, function(i, val) {
  
      // コンソールに1つずつ出力
      console.log(i+':'+val);
  
      // 値が前橋の次から中断
      return (val != '前橋');
  
    });
  });

});


      

