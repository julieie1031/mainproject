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
	function timeForToday(value) {
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금전';
        if (betweenTime < 60) {
            return `${betweenTime}분전`;
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return `${betweenTimeHour}시간전`;
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return `${betweenTimeDay}일전`;
        }

        return `${Math.floor(betweenTimeDay / 365)}년전`;
 }
	
	return{
		add:add,
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		timeForToday:timeForToday
	};
})();


