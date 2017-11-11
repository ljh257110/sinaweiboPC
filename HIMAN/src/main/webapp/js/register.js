$(function(){
	$("#personage-register").click(function(){
		$("#personage-register").css("border-bottom","3px solid #ffa00a");
		$("#official-register").css("border-bottom","none");
		$(".w_cont_cont").css("display","block");
		$(".w_contents").css("display","none");
	})
	$("#official-register").click(function(){
		$("#personage-register").css("border-bottom","none");
		$("#official-register").css("border-bottom","3px solid #ffa00a");
		$(".w_cont_cont").css("display","none");
		$(".w_contents").css("display","block");
	})
	function show(obj1,obj2,obj3,obj4){
		obj1.click(function(){
			obj3.css("display","block");
			obj4.css("display","none");				
		})
		obj2.click(function(){
			obj3.css("display","none");
			obj4.css("display","block");											
		})
	}
	show($("#mobile-number-email"),$("#mobile-email-number"),$(".w_contents_email"),$(".mobile-number"));
	function select(obj1,obj2,obj3){		
		var isShow = false;
		var codeArr = ["0086","00852","00853","00886","001","001","0055","0060","0061","0081","0082","0065","0044","0033","007","0091","0066","0049","0062","00855","0095","00673","0063","0084","00856"];
		obj1.click(function(){
			if(!isShow){
				obj2.css("display","block");
				obj2.find("ul li").click(function(){
					obj2.find("ul li").attr("class","");
					$(this).attr("class","select");
					var index = $(this).index();
					
					var xy =  "4px  " +  (8 - index * 26) + "px";
					obj1.css("background-position",xy);
					obj3.html(codeArr[index]);
					obj2.css("display","none");
					isShow = false;
				})
			}else{
				obj2.css("display","none");
			}
			isShow = !isShow;
			
		})
	}
	select($(".country"),$(".msg_set_select"),$(".tel_forenum"));

	var trueArr = [];
	for(var i = 0; i < 2;i++){
		trueArr[i] = false;
	}
	function phone(obj1,obj2){
	 	var isOne = true;

	 	obj1.focus(function(){
	 		var val = obj1.val();
	 		if(isOne || !val){
	 			obj2.css("display","block");
	 			obj2.find("b").html("请输入您的手机号码");
	 			obj2.find(".error").css("color","#808080");
	 			obj2.find(".icon_rederrorS").css("background-position","0 -200px");
	 			isOne = false;
	 		}
	 	})
	 	obj1.blur(function(){
	 		if(!($(this).val())){
	 			obj2.find("b").html("请输入手机号码");
		 		obj2.find(".error").css("color","#e64141");
		 		obj2.find(".icon_rederrorS").css("background-position","0 -250px");
	 		}else if(/^1[3|4|5|7|8][0-9]\d{8}$/.test($(this).val())){
	 			obj2.find("b").html("");
	 			obj2.find(".icon_rederrorS").css("background-position","0 0");
	 			trueArr[0] = true;
	 		}else{
	 			obj2.find("b").html("手机号长度11位，以13/14/15/17/18开头");
	 			obj2.find(".error").css("color","#e64141");
		 		obj2.find(".icon_rederrorS").css("background-position","0 -250px");
	 		}
	 		
	 		
	 	})
	 }
	 phone($(".mobile-number-right input"),$(".mobile-error").eq(0));

	 function email(obj1,obj2){
	 	obj1.focus(function(){
	 		if(!($(this).val())){
	 			obj2.find("i").html("您填写的邮箱将作为微博登录名");
	 			obj2.css("display","block");
		 		obj2.find(".error").css("color","#808080");
		 		obj2.find(".icon_rederrorS").css("background","url(../images/ico_warn.png) 0 -200px");
	 		}
	 	})
	 	obj1.blur(function(){
	 		if(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test($(this).val())){
	 			obj2.find("i").html("");
	 			obj2.find(".icon_rederrorS").css("background-position","0 0");
	 		}else{
	 			obj2.find("i").html("请输入正确的邮箱地址");
	 			obj2.find(".icon_rederrorS").css("background","url(../images/ico_warn.png) 0 -250px");
	 		}
	 	})
	 }
	 email($(".useremail"),$(".mobile-error").eq(1));
	 function password(obj1,obj2){
	 	var isOne = true; 	
	 	obj1.focus(function(){
	 		if(!($(this).val())){
		 		obj2.find("i").html("请输入6-16位数字、字母或常用符号，字母区分大小写");
		 		obj2.css("display","block");
		 		obj2.find(".error").css("color","#808080");
		 		obj2.find(".icon_rederrorS").css("background","url(../images/ico_warn.png) 0 -200px");
	 		}
	 		
	 		var val = obj1.val();
	 		if(isOne){
	 			obj2.css("display","block"); 			
	 			isOne = false;
	 			obj1.on("input propertychange",function(){
	 				obj2.find(".icon_rederrorS").css("background-position","0 -250px");
	 				obj2.find(".error").css("color","#e64141");
	 				if(/^[a-zA-Z0-9~!@#$%^&*(),.?\[\]{}]{6,16}$/.test($(this).val())){
	 					if(/^[A-Za-z0-9]{6,16}$/.test($(this).val())){
	 						var valArr = $(this).val().split("");
		 					var isYes = false;
		 					for(var i = 0; i < valArr.length; i++){
		 						if(valArr[0] != valArr[i]){
		 							isYes = true;
		 							break;
		 						}
		 					}
		 					if(!isYes){
		 						obj2.find("i").html("弱：您输入的密码强度过弱，请重新输入，试试字母、数字、常用符号的组合");
		 						obj2.find(".icon_rederrorS").css("background","none");
		 					}else if(valArr.length > 10){
		 						obj2.find("i").html("强：您的密码很安全");
		 						obj2.find(".icon_rederrorS").css("background","none");
		 					}else{
		 						obj2.find("i").html("中：您的密码还可以更复杂些");
		 						obj2.find(".icon_rederrorS").css("background","none")
		 					}
	 					}else if(/^(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&*(),.?\[\]{}])[\da-zA-Z~!@#$%^&*(),.?\[\]{}]{6,16}$/.test($(this).val())){
	 						obj2.find("i").html("强：您的密码很安全");
	 						obj2.find(".icon_rederrorS").css("background","none")
	 					}else{
	 						obj2.find("i").html("中：您的密码还可以更复杂些");
	 						obj2.find(".icon_rederrorS").css("background","none")
	 					}
	 					trueArr[1] = true;
	 				}else{
	 					obj2.find("i").html("请输入6-16位数字、字母或常用符号，字母区分大小写");
	 				}
	 			})
	 		}else{
	 			obj2.css("color","#e64141");
	 		}
	 	})
	 	obj1.blur(function(){
	 		
	 		if(!($(this).val())){
	 			obj2.find("i").html("请输入密码");
		 		obj2.find(".error").css("color","#e64141");
		 		obj2.find(".icon_rederrorS").css("background","url(../images/ico_warn.png) 0 -250px");
		 		}	 		
	 	})
	 }
	password($(".mobile-password input"),$(".mobile-error").eq(2));
	$(".mobile-submit input").click(function(){
		alert(1)
		// register();
	})
	function register(){
		for(var i = 0; i < 2;i++){
			alert(trueArr)
			if(trueArr[i] == false){
				break;
			}else{
				$(this).removeAttribute("disabled");
				break;
			}
		}
	}
	
})