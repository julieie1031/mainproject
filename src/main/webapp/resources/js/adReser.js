/**
 * 
 */

var adReserService = (function(){
	
	
	
			
	//조회
	function adReserList(param,callback,error){
		
		var page = param.page || 1;
		
		$.getJSON("/reser/pages/"+page+".json",
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
		adReserList:adReserList
	};
	
})();