<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>智能机器人聊天</title>
<meta name="keywords" content="关键词,关键词">
<meta name="description" content="">

<style type="text/css">
	*{margin:0;padding:0;}
	
	body{background:url("./images/001.jpg");background-size:cover;font-size:12px;font-family:"微软雅黑 ";color:#666;}
	/*以点开头的为类样式    id用#，class用.*/
	.chat{width:800px;height:530px;background:#ff3399;margin: 50px auto;}
	.chat .c-top{height:60px;background:#ff9900;line-height:60px;font-size:18px;color:#ffffff;padding-left:10px;}
	.chat .c-con{height:380px;background:#ebff82;font-size:14px;overflow:auto;}
	.chat .c-message{height:90px;background:#d5d5d5;}
	.chat .c-con .c-left{padding:10px;}
	.chat .c-con .c-left img{border-radius:25px;vertical-align:middle;}
	.chat .c-con .c-right{text-align:right;padding:10px;}
	.chat .c-con .c-right img{border-radius:25px;vertical-align:middle;}
	.chat .c-message .c-box{width:680px;height:70px;background:#E8E8E8;padding:10px;outline:none;float:left;font-size:14px;}
	.chat .c-message .c-send{width:100px;height:90px;float:right;border:none;cursor:pointer;border-radius:25px;outline:none;}
	.chat .c-message .c-send:hover{background:#cacaca;outline:none;}
	
	/*细化滚动条 */
	::-webkit-scrollbar{width:5px;height:6px;background:#ccc;}
	::-webkit-scrollbar-button{background:#e5e5e5;}
	::-webkit-scrollbar-track{background:#999;}
	::-webkit-scrollbar-track-piece{background:#ccc;}
	::-webkit-scrollbar-thumb{background:#666;}
	::-webkit-scrollbar-corner{background:#82AFFF;}
	::-webkit-scrollbar-resizer{background:#FF0BEE;}
	scrollbar{-moz-appearance:none !important;background:rgb(0,255,0) !important;}
	scrollbarbutton{-moz-appearance:none !important;background-color:rgb(0,0,255) !important;}
	scrollbarbutton:hover{-moz-appearance:none !important;background-color:rgb(255,0,0) !important;}
	

</style>
</head>
<body>


	<div class="chat">
		<div class="c-top">人工智能客户IM系统--刘海军</div>
		<div class="c-con">
			<!-- <div class="c-left">
				<img alt="利安人寿机器人" src="./images/002.jpg" width="50px" height="50px" />
				<span>刘大帅您好！</span>
			</div>
			<div class="c-right">美女你好！
				<img alt="对话美女" src="./images/003.jpg" width="50px" height="50px" />
			</div> -->
			</div>
		<div class="c-message">
		<div class=c-box contenteditable="true"></div>
		<div class="c-btn">
			<input type="button" value="发   送" class="c-send"/>
		</div>
	</div>
	</div>
	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
 <script type="text/javascript">
	$(function(){
 		$(".c-send").click(function(){
 			var value = $(".c-box").text();
 			var text= $(".c-send");
 			$(".c-con").append("<div class='c-right'>"+" "+value+ " " +
				"<img alt='对话美女' src='./images/003.jpg' width='50px' height='50px' />"
			+"</div>");
 			$(".c-con").scrollTop(10000000);
 			$.ajax({
 				type:"post",
 				url:"data.jsp",
 				data:{info:value},
 				success:function(data){
 					var json = JSON.parse(data);
 					$(".c-con").append("<div class='c-left'>"+
 					"<img alt='利安人寿机器人' src='./images/002.jpg' width='50px' height='50px' />"+
 					"<span>  "+json.text+"</span>"
 				+"</div>");
 					
 					$(".c-con").scrollTop(10000000);
 					var url = "http://fanyi.baidu.com/gettts?lan=zh&text="+json.text+"&spd=5&source=web";
 					var obj = "<audio src="+url+" autoplay ></audio>";
 					$("body").append(obj);
 					
 				}
 			});
 		});
 	}); 	
 		/* 	$(function(){
 				text.focus();
 			});
 	
 			var text = $(".c-box");
 			
 			function action() {
 				if(text.val() == null || text.val() =="") {
 					text.focus();
 					return;
 				}
 				
 				$(".c-con").append("<div class='c-right'>"+" "+text.val()+ " " +
 						"<img alt='对话美女' src='./images/003.jpg' width='50px' height='50px' />"
 					+"</div>");
 		 			$(".c-con").scrollTop(10000000);
 				
 		 			
 		 			$.ajax({
 		 				type:"post",
 		 				url:"data.jsp",
 		 				data:{info:value},
 		 				success:function(data){
 		 					var json = JSON.parse(data);
 		 					$(".c-con").append("<div class='c-left'>"+
 		 					"<img alt='利安人寿机器人' src='./images/002.jpg' width='50px' height='50px' />"+
 		 					"<span>  "+json.text+"</span>"
 		 				+"</div>");
 		 					
 		 					$(".c-con").scrollTop(10000000);
 		 					var url = "http://fanyi.baidu.com/gettts?lan=zh&text="+json.text+"&spd=5&source=web";
 		 					var obj = "<audio src="+url+" autoplay ></audio>";
 		 					$("body").append(obj);
 		 					
 		 				}
 		 			});
 		 			text.val("");
 		 			text.focus();
 			}
 			
 			$(".c-send").click(function(){
 				action();
 			});
 			
 			 $(document).keydown(function(event){
 				if(event.keyCode==13) {
 					action();
 				}
 			});  */
 
 
 </script>
</body>
</html>