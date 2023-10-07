  $(function(){
  	$(document).on("click",".profil",function(){
  		$(".profil_box").show();
  	});
  });
  $(document).mouseup(function (e) {
    var container = $(".profil_box");
    if (!container.is(e.target) && container.has(e.target).length === 0){
      container.hide();
    }	
  });