$(document).on('turbolinks:load', function(){
  $('.send-cart').on('submit', function(e){
    e.preventDefault();
    var btn_id = $(this).data('btn');
    var cart = new FormData(this);
    var url = $(this).attr('action');
    
    $.ajax({  
      url: url,
      type: 'POST',
      data: cart,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(){
      var input = $("[data-index=" + btn_id + "]");
      var amount = input.val();
      var cart = $('.move-to-cart__amount__number').text();
      var total = parseInt(amount) + parseInt(cart);
      $('.move-to-cart__amount__number').empty();
      $('.move-to-cart__amount__number').append(total);
      $('.move-to-cart__amount__number').animate({fontSize: 40,width: '70px',height:'70px',lineHeight:"70px"}, 300, 'swing',function(){
        $('.move-to-cart__amount__number').animate({fontSize: 25,width:'60px',height:'60px',lineHeight:'60px'},300,'swing');
      });
      $('.count').val('');
    })
    .fail(function(data){
      alert('エラーが発生したため商品をカートに入れられませんでした');
    })
    .always(() => {
      $('.submit-btn').prop('disabled', false);
      })
  });
});
