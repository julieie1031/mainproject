/**
 * 
 */

var adRestService = (function(){
	
		
	//조회
	function adRestList(param,callback,error){
		
		var page = param.page || 1;
		
		$.getJSON("/rest/pages/"+page+".json",
		function(data){
			if(callback){
				callback(data);
			}	
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	
	return{
		adRestList:adRestList
	};
	
})();