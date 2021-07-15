$(function(){
	
	$('#apibtn').click(function(){
	
	var restName = $('#restName').val();
	var roomPrice = $('#roomPrice').val();
	var roomName = $('#roomName').val();
	var roomPeople = $('#roomPeople').val();
	var restPhone = $('#restPhone').val();
	var dogType = $('#dogType').val();
	var dogNumber = $('#dogNumber').val();
	var startDate = $('#startDate').val();
	var endDate = $('#endDate').val();
	var restId = $('#restId').val();
	var userId = $('#userId').val();
	
	var allData = { 
		"restName": restName, 
		"roomPrice": roomPrice,
		"roomName": roomName,
		"roomPeople": roomPeople,
		"restPhone": restPhone,
		"dogType": dogType,
		"dogNumber": dogNumber,
		"startDate": startDate,
		"endDate": endDate,
		"restId": restId,
		"userId":userId
	};

		$.ajax({
			url:'http://localhost:8080/reserve/kakaoPaySuccess',
        	data: allData,
         	dataType:'json',
			success:function(data){
				alert("성공");
			},
			error:function(error){
				alert("실패");
			}
		});
	});
});