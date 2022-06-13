$(document).ready(function () {
	$("#tj").click(function(){
			var name = $("#name").val();
			var email = $("#email").val();
			var phone = $("#phone").val();
			var address = $("#address").val();
			var message = $("#message").val();
			if(name == null || name == "" || name == undefined || name == "undefined"){
				alert("请输入姓名");
				return;
			}
			if(email == null || email == "" || email == undefined || email == "undefined"){
				alert("请输入邮箱");
				return;
			}
			if(phone == null || phone == "" || phone == undefined || phone == "undefined"){
				alert("请输入手机号码");
				return;
			}
			if(address == null || address == "" || address == undefined || address == "undefined"){
				alert("请输入住址");
				return;
			}
			if(message == null || message == "" || message == undefined || message == "undefined"){
				alert("请输入留言");
				return;
			}
			var param = {"name":name, "email":email, "phone":phone, "address":address, "message":message};
			$.ajax({
		    type: "post",
		    url: "/message.do",
		    data: param,
		    dataType: "text",
		    error: function(xMLHttpRequest, textStatus, errorThrown){
		    	alert("系统错误！请重试！");
			},
		    success: function (data){
				  if(data == "SUCCESS"){
					  alert("提交成功！");
					  window.location.href = "/"
				  }else{
					  alert(data);
				  }
		    }
			});
	});
});