var regCodeInterval = setInterval(function(){regCodeTimeinterval();}, 1000);
function regCodeTimeinterval(){
	var currTime = $('#changetime').html();
	var newTime = parseInt(currTime) - 1;
	if(newTime){
		$('#changetime').html(newTime);
	}else{
		clearInterval(regCodeInterval);
		$('#gotouser')[0].click();
		//window.location.href='http://www.80ycw.com/user_center.jsp';
	}
}