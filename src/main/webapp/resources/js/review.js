/**
 * 
 */

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) 
{ 
   xhr.setRequestHeader(header, token); 
});

console.log("Review Module...")
var reviewService = (function(){
	
	//등록
	function add(review,callback){
		console.log("add review");
		
		$.ajax({
			type:'post',
			url:'reviews/new',
			data:JSON.stringify(review),
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr){
				if(callback){
					callback(result);
				}
			},
			error:function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		})
	}
	
	return{add:add};
})();


