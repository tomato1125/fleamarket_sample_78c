
// v2 実装用の記載　対応待ち
//   var payjp = Payjp('pk_test_99db1b441d99a1b4ffd53d89');
//   console.log(payjp)
//   var elements = payjp.elements();
//   console.log(elements);
//   var cardElement = elements.create('card')
//   console.log(cardElement);
// cardElement.mount('#v2-demo')
  // console.log(a)


// Payjp.setPublicKey(gon.payjp_public_key);


$(function() {

  $('#cardCreateForm').on('submit', function(e) {
    e.preventDefault()
    console.log("test");
    Payjp.setPublicKey('pk_test_99db1b441d99a1b4ffd53d89');
    var card = {
      number: document.getElementById("card-number").value,
      exp_month: document.getElementById("credit_exp_month").value,
      exp_year: document.getElementById("credit_exp_year").value,
      cvc: document.getElementById("cvc").value
    };

    if (card.number == "" || card.cvc == "") {
      alert("入力もれがあります");
    } else {
      Payjp.createToken(card, function(status, response) {
        if (status === 200 ) {
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name");
          $("#card_token").append(
          //   $('<input type="hidden" name="payjp-token">').val(response.id)
          // alert("ok");
          );
          document.inputForm.submit();
        } else {
          alert("カード情報が正しくありません");
        }
      });
    }
  });









});
