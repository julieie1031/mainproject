$(function(){
	
	$('#apibtn').click(function(){
		$.ajax({
			url:'reserve/kakaopay.cls',
			dataType:'json',
			success:function(data){
				var box = data.next_redirect_pc_url;
				window.open(box);	
			},
			error:function(error){
				alert(error);
			}
		});
	});
});