/**
 * 
 */

var adMemService = (function(){
	
	//등록
	function adMemInsert(member,callback){
		console.log("add mem");
		
		$.ajax({
			type:'post',
			url:'/members/new',
			data:JSON.stringify(member),
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
	
	//조회
	function adMemList(param,callback,error){
		
		var page = param.page || 1;
		
		$.getJSON("/members/pages/"+page+".json",
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
	
	
	function getToday(value){
    var date = new Date(value);
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);

    return year + "-" + month + "-" + day;
}
	return{
		adMemList:adMemList,
		getToday:getToday
	};
	
})();