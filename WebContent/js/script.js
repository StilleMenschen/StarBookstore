$(document).ready(function(){
  $("#mnav li a").each(function(){
	  var t = String(window.location.href);
	  var i = t.indexOf("?");
	  if ($($(this))[0].href == (i>0?t.substring(0,i):t)){
          $(this).parent().addClass('active');
	  }
  });
  $(":submit").click(function(){
	var flag = true;
	$(":text,:password").each(function() {
		var $t = $.trim($(this).val());
		if ($t=="") {
			$(this).val("").focus();
			flag = false;
			return false;
		}
	});
	return flag;
  });
});
