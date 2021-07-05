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
			url:'/reviews/new',
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
	
	//조회
	function getList(param,callback,error){
		
		var restId = param.restId;
		var page = param.page || 1;
		
		$.getJSON("/reviews/pages/"+restId+"/"+page+".json",
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
	
	//삭제
	function remove(reno,callback,error){
		$.ajax({
			
			type:'delete',
			url: '/reviews/'+reno,
			success: function(deleteResult,status,xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error:function(xhr,status,er){
				if(error){
					error(er);
				}
			}
		});
	}
	
	
	//수정
	function update(review,callback,error){
		console.log("RNO:"+review.reno);
		
		$.ajax({
			type:'put',
			url:'/reviews/'+review.reno,
			data:JSON.stringify(review),
			contentType:"application/json;charset=utf-8",
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
		});
	}
	
	
	//특정 번호 리뷰 조회
	function get(reno,callback,error){
		$.get("/reviews/"+reno+".json",function(result){
			if(callback){
				callback(result);
			}
		}).fail(function(xhr,status,err){
			if(error){
				error();
			}
		});
	}
	
	//시간
	function displayTime(timeValue){
		var today=new Date();
		var gap=today.getTime()-timeValue;
		var dateObj = new Date(timeValue);
		var str="";
		
		if(gap < (1000*60*60*24)){
			var hh = dateObj.getHours(); //시
			var mi = dateObj.getMinutes(); //분 
			var ss = dateObj.getSeconds(); //초
			return[ (hh>9?"":"0")+hh,':',(mi>9?"":"0")+mi,':',(ss>9?"":"0")+ss].join(''); 
			
		}else{ 
			var yy = dateObj.getFullYear(); //년
			var mm = dateObj.getMonth()+1; //월
			var dd = dateObj.getDate(); //일
			return[ yy,'/',(mm>9?"":"0")+mm,'/',(dd>9?"":"0")+dd].join(''); 
		}
	}
	
	
	return{
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
	};
})();


