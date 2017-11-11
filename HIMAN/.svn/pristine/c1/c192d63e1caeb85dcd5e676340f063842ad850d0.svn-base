$(function(){
	$(".f_smallImg").on("click", "li", function(){
		$(".f_bigImg").css("display", "block");
		$(".f_smallImg").css("display", "none");
		var src = $(this).find("img").attr("src");
		html = '<img src="'+src+'">';
		$(".f_bigImg").html(html);
	});
	$(".f_bigImg").on("click", function(){
		$(this).css("display", "none");
		$(".f_smallImg").css("display", "block");
	})
	$(".f_SmallImg").on("click", "li", function(){
		$(".f_SmallImg").css("display", "none");
		$(".f_BigImg").css("display", "block");
		var src = $(this).find("img").attr("src");
		html = '<img src="'+src+'">';
		$(".f_BigImg_center").html(html);
		var distance = $("#f_botton_list li" );
		
		for (var i = 0; i < distance.get().length; i++) {
			
			if(src == $(distance[i]).find("img").attr("src")){
				$("#f_botton_list li" ).attr("class", "")
				$("#f_botton_list li" ).find("img").css("opacity", "0.6");
				$(distance[i]).attr("class", "f_active");
				$(distance[i]).find("img").css("opacity", "1")
			}
			
		}
	})
	$(".f_BigImg .f_BigImg_center").on("click", function(){
		$(".f_BigImg").css("display", "none");
		$(".f_SmallImg").css("display", "block");
	})
	$("#f_botton_list").on("mouseenter", "li", function(){
		$(this).attr("class", "f_active").find("img").css("opacity", "1");
		$("#f_botton_list").on("mouseleave", "li", function(){
			$(this).attr("class", "").find("img").css("opacity", "0.6");
		})
		$("#f_botton_list").on("click", "li", function(){
			$("#f_botton_list li" ).find("img").css("opacity", "0.6");
			$("#f_botton_list li" ).attr("class", "")
			$(this).attr("class", "f_active").find("img").css("opacity", "1");
			var src = $(this).find("img").attr("src");
			
	//		alert(src)
			html = '<img src="'+src+'">';
			$(".f_BigImg_center").html(html);
	//		$("#f_botton_list").on("mouseleave", "li", function(){
	//			$(this).attr("class", "").find("img").css("opacity", "1");
	//		})
			$("#f_botton_list").on("mouseleave", "li", function(){
				$(this).attr("class", "f_active").find("img").css("opacity", "1");
			})
		})
	})
	$("#slidUp").on("click", function(){
		$(".f_SmallImg").css("display", "block");
		$(".f_BigImg").css("display", "none");
	})
	
	var index = 0;
	$("#turnLeft").on("click", function(){
	
		index--;
//		alert(90*index+"deg")
		$(".f_BigImg_center img").css("transform", 'rotate('+90*index+'deg)')
	})
	
	
	$("#turnRight").on("click", function(){
	
		index++;
//		alert(90*index+"deg")
		$(".f_BigImg_center img").css("transform", 'rotate('+90*index+'deg)')
	})
	$(document).scroll(function(){
		var t = document.documentElement.scrollTop || document.body.scrollTop; 
		document.title = t;
//		alert($(".f_content_left").height())
		if(t > 602){
			$(".f_content_right").css("position", "fixed").css("right", "172px");
		}else if(t < 55){
			$(".f_content_right").css("position", "");
		}/*else if(t = $(".f_content_left").height()){
			$(".f_content_right").css("position", "fixed").css("bottom", "347px");
		}*/
	
	})

})
