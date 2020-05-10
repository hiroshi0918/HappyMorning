$(document).on('turbolinks:load', function(){
  $('.send-cart').on('submit', function(e){
    e.preventDefault();
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
    .done(function(data){
      $('.count').val('');
      $('.submit-btn').prop('disabled', false);
      alert('商品をカートに送りました')
    })
    .fail(function(data){
      alert('エラーが発生したため商品をカートに入れられませんでした');
    })
  })
});
