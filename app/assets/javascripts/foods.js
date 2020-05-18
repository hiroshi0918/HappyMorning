$(document).on('turbolinks:load',function(){
  var number;
  var $input = $('.count');
	var $plus = $('.plus'); 
	var $minus = $('.minus');
	

  //ダウンボタンクリック時
	$minus.on('click', function() {
		number = Number($(this).next($input).val());
		if (number > 0) {
			$(this).next($input).val(number - 1);
			if ((number - 1) == 0) {
			$(this).prop("disabled", true);
			}
			$(this).next().next($plus).prop("disabled", false);
		} else {
			$(this).prop("disabled", true);
		}
	});
	//アップボタンクリック時
	$plus.on('click', function() {
		number = Number($(this).prev($input).val());
			$(this).prev($input).val(number + 1);
			$(this).prev().prev($minus).prop("disabled", false);
	});
});