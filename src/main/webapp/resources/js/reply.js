/**
 * 
 */

//JS의 모듈 패턴
//여러 기능들을 모아서 하나의 모듈화
//여러 함수들이 메소드화 되모르 객체지향 구조에 적합
console.log("Reply Module...."); 



var replyService=(function(){
	 
	//댓글 등록
	function add(reply,callback,error){
	 console.log("reply...");
	 
	 $.ajax({
	 	type:'post',
	 	url:'/replies/new',
	 	data: JSON.stringify(reply), 
	 	contentType:'application/json;charset=utf-8',
	 	success:function(result, status, xhr){
	 		if(callback){
		callback(result);
		}},
		
	 	error:function(xhr, status, er){
	 		if(error){
		error(er);
		}}
	 })
	}//add
	
	//댓글 조회
	function getList(param,callback,error){
		var bno = param.bno;
		var page = param.page||1;
		$.getJSON("/replies/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					callback(data.replyCnt, data.list);//댓글 숫자와 목록을 가져오는 경우
					} //게시글의 댓글 수와 페이지를 사용
			}).fail(function(xhr,status,err)
			{
				if(error){
					error();
					}
			});
		
	}//getList
	
		//댓글 삭제 
		function remove(rno, userId ,callback, error){
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			
			data : JSON.stringify({rno : rno, userId : userId}),
			contentType : "application/json; charset=utf-8",
			
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		});
	}// remove
	
	//댓글 수정
	function update(reply_content,callback,error){
		$.ajax({
			type:'put',
			url:"/replies/" + reply_content.rno,
			data: JSON.stringify(reply_content),
			contentType:"application/json; charset=utf-8",
			success:function(result,status,xhr){
				if(callback){callback(result);}
			},
			error:function(xhr,status,er){
				if(error){error(er);}
			
		}
			
		});
	} //update
	
		//특정 댓글 조회
	function get(rno,callback,error){
		
		$.get("/replies/"+rno+".json",function(result){
			if(callback){callback(result);}
		}).fail(function(xhr,status,err){
			if(error){error();}
		});
		
	}//get
	
	//XML이나 JSON 형태로 데이터를 수신한 경우 시간은 숫자로 표현됨
	//시간 처리
	//시간
   function displayTime(value) {
        const today = new Date();
        const timeValue = new Date(value);

        const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
        if (betweenTime < 1) return '방금 전';
        if (betweenTime < 60) {
            return `${betweenTime}분 전`;
        }

        const betweenTimeHour = Math.floor(betweenTime / 60);
        if (betweenTimeHour < 24) {
            return `${betweenTimeHour}시간 전`;
        }

        const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
        if (betweenTimeDay < 365) {
            return `${betweenTimeDay}일 전`;
        }

        return `${Math.floor(betweenTimeDay / 365)}년 전`;
 }
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
	
})();
