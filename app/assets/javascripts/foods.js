$(document).on('turbolinks:load',function(){
  var number,total_numner;
  var max = 5; //合計最大数
  var $input = $('.count'); //カウントする箇所
	var $plus = $('.plus'); //アップボタン
  var $minus = $('.minus'); //ダウンボタン
  //合計カウント用関数
  function total() {
		total_numner = 0;
		$input.each(function(val) {
			val = Number($(this).val());
			total_numner += val;
		});
		return total_numner;
  }
	//ロード時
	$(document).on('turbolinks:load', function() {
		$input.each(function() {
			number = Number($(this).val());
			if (number == max) {
				$(this).next($plus).prop("disabled", true);
			} else if (number == 0) {
				$(this).prev($minus).prop("disabled", true);
			}
		});
		total();
		if (total_numner == max) {
			$plus.prop("disabled", true);
		} else {
			$plus.prop("disabled", false);
		}
	});
  //ダウンボタンクリック時
	$minus.on('click', function() {
		total();
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
		total();
		if (total_numner < max) {
			$plus.prop("disabled", false);
		}
	});
	//アップボタンクリック時
	$plus.on('click', function() {
		number = Number($(this).prev($input).val());
		if (number < max) {
			$(this).prev($input).val(number + 1);
			if ((number + 1) == max) {
			$(this).prop("disabled", true);
			}
			$(this).prev().prev($minus).prop("disabled", false);
		} else {
			$(this).prop("disabled", true);
		}
		total();
		if (total_numner == max) {
			$plus.prop("disabled", true);
		} else {
			$plus.prop("disabled", false);
		}
	});
});