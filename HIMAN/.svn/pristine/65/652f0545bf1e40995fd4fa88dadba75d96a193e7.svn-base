$(function(){
//	$(".h_feed").html("dyhfguhyuytuyty");
	$.ajax({
        url:"http://localhost/HIMAN/message/hotAnalysis",
        dataType:"json",
        type:"post",
        success:function(data){
        	alert($(".h_feed").html())
            var html1 = "";
        	var html2 = "";
            for(var i = 0; i <data.content.length;i++ ){
            	if(data.content[i].user){
            		html1 += '<div class = "hwb_cardwrap"><div class = "h_feed_detail"><div class = "h_detail"><div class = "h_info"><a class = "h_name">' + data.content[i].user.userName+'</a><a href=""><i class = "icon_approve_gold"></i></a><a href=""><em class = "icon_member"></em></a></div><div class = "h_form"><a href="">'+ data.content[i].messageDate+'</a>来自<a href="">iPhone 6(土豪金)</a></div><div class = "h_weibo_text"><p>'+ data.content[i].messageContent +'</p></div><div class = "h_weibo_img"><div class = "media_box"><ul></ul></div></div></div></div></div>';
            		
            	}
            	
            	
            }
            
        	console.log(data)
//        	alert(data.content[1].messageContent)
        	$(".h_feed").html(html1);
        	 for(var k = 0; k <data.content.length;k++ ){
	        	for(var j = 0;j < data.content[k].mImages.length;j++ ){
	        		html2 += '<li><img src =' + "/HIMAN/" + data.content[k].mImages[j].url + ' /></li>';
	        		
	        	}
	        	$(".hwb_cardwrap").eq(k).find(".media_box ul").html(html2);
	        	html2 = "";
        	 }
        }

    })


	function local_img(){
		var isOne = false;
		$(".local").click(function(){
			if(!isOne){
				$(".local_content").css("display","block");
			}else{
				$(".local_content").css("display","none");
			}
			isOne = !isOne;
			return false;
		})
	}
	local_img();
	function textarea(){
		$("#h_input").focus(function(){
			$(".input").css("border","1px solid #eb7350");
			$(".input").css("box-shadow","none");
			
		})
		$("#h_input").blur(function(){
			$(".input").css("border","1px solid #ccc");
			$(".input").css("box-shadow","0px 0px 3px 0px");
			
		})
	}
	textarea();
	function trend_show(obj){
		obj.eq(0).find(".h_pic_box").css("display","block");
		obj.eq(0).find("p").css("display","block");
		obj.mouseover(function(){
			obj.find(".h_pic_box").css("display","none");
			obj.find("p").css("display","none");
			$(this).find(".h_pic_box").css("display","block");
			$(this).find("p").css("display","block");
		})
	}
	trend_show($(".rm_rank .WB_trend ul li"));
	$(window).scroll(function(){
		$(".w_host_top").css("position","fixed");
		$(".h_main_l").css("position","fixed").css("top","48px").css("margin-right","150px");
		$(".h_plc_main").css("margin-left","150px");
		if($(this).scrollTop() == 0){
			$(".w_host_top").css("position","static");
		}
		if($(this).scrollTop() >= 1400){
			$(".rm_hottopic").css("position","fixed").css("top","48px").css("width","230px");
		}else{
			$(".rm_hottopic").css("position","static");
		}
		
	})
	function levmore(){
		var isOne = true;		
			$(".levmore a").click(function(){
				if(!isOne){
					$(".h_UI_scrollContent").css("height","350px");
					$(this).html("展开");
					
				}else{
					$(".h_UI_scrollContent").css("height","500px");
					$(this).html("收起");
					
				}
				isOne = !isOne;
			})		
	}
	levmore();
	function friend(){
		var isOne = [];
		for(var i = 0; i < $(".hwb_cardwrap").length;i++){
			isOne[i] = false;
		}
		$(".hwb_cardwrap .screen_box .iconfont").click(function(){
			var index = $(this).parent().parent().parent().parent().parent().index();
			if(!isOne[index]){
				$(".hwb_cardwrap").eq(index).find(".menu_list").css("display","block");
				
			}else{
				$(".hwb_cardwrap").eq(index).find(".menu_list").css("display","none");
				
			}
			isOne[index] = !isOne[index];
			return false;
		})
	}
	friend();
	function collect(){
		var isOne = [];
		for(var i = 0; i < $(".hwb_cardwrap").length;i++){
			isOne[i] = false;
		}
		$(".h_WB_handle .collect_li").click(function(){
			var index = $(this).parent().parent().index();
			// alert($(this).parent().parent().html())
			if(!isOne[index]){
				$(".hwb_cardwrap").eq(index).find(".icon-shoucang").css("color","#fa7d3c");
				$(".hwb_cardwrap").eq(index).find(".collect").html("已收藏")
				
			}else{
				$(".hwb_cardwrap").eq(index).find(".icon-shoucang").css("color","#696e78");
				$(".hwb_cardwrap").eq(index).find(".collect").html("收藏")
				
			}
			isOne[index] = !isOne[index];
			return false;
		})
	}
	collect();
	function like(){
		var isOne = [];
		for(var i = 0; i < $(".hwb_cardwrap").length;i++){
			isOne[i] = false;
		}
		$(".h_WB_handle .like_li").click(function(){
			var index = $(this).parent().parent().index();
			// alert($(this).parent().parent().html())
			if(!isOne[index]){
				$(".hwb_cardwrap").eq(index).find(".like_li .iconfont").attr("class","iconfont icon-dianzan").css("color","#fa7d3c");
				var value = Number($(".hwb_cardwrap").eq(index).find(".like").html()) + 1;
				$(".hwb_cardwrap").eq(index).find(".like").html(value);
				
			}else{
				$(".hwb_cardwrap").eq(index).find(".like_li .iconfont").attr("class","iconfont icon-dianzan-copy").css("color","#696e78");
				var value = Number($(".hwb_cardwrap").eq(index).find(".like").html()) - 1;
				$(".hwb_cardwrap").eq(index).find(".like").html(value);
				
			}
			isOne[index] = !isOne[index];
			return false;
		})
	} 
	like();
	function comment(){
		var isOne = [];
		for(var i = 0; i < $(".hwb_cardwrap").length;i++){
			isOne[i] = false;
		}
		$(".h_WB_handle .comment_li").click(function(){
			var index = $(this).parent().parent().index();
			// alert($(this).parent().parent().html())
			if(!isOne[index]){
				$(".hwb_cardwrap").eq(index).find(".comment").css("display","block");				
			}else{
				$(".hwb_cardwrap").eq(index).find(".comment").css("display","none");
				
			}
			isOne[index] = !isOne[index];
			return false;
		})
	}
	comment();
})
