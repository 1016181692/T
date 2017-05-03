<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="UTF-8"%>
    
    <%-- <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServletPath();
    %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>身份证识别</title>
<style type="text/css">
	*{margin:0;padding:0;}
	#head{width:100%;height:60px;background:rgba(0,0,0,0.5);color:#FFF;text-align:center;line-height:60px;font-size:24px;}
	#content{width:100%;height:580px;background:url(./img/2.png) no-repeat;background-size:100% 100%;}
	#content .center{width: 1250px;height:500px;padding-top:80px;margin:0 auto;}
	#content .center .img{max-width:800px;max-height:400px;min-width:642px;min-height:400px;float:left;position:relative;overflow:hidden;}
	#content .center .img .sm{width:75%;height:60%;background:url(./img/intro.png)no-repeat;background-size:cover;position:absolute;}
	#content .center .img .scale{animation: renlian 1.5s  infinite ease; -webkit-animation:renlian 1.5s infinite ease;}
	#content .center .img .bs{position:absolute;background:green;width:455px;height:300px;top:0px ;left:0px;font-size:36px;text-align:center;line-height:400px;color:#fff;opacity:0.3;}
			@-webkit-keyframes renlian {
						from {height:5px;}
						10% {height: 50px;}
						40% {height:100px;}
						50% {height:150px;}
						60% {height:250px;}
						80% {height:460px;}
						60% {height: 250px;}
						50% {height: 150px;}
						40% {height: 100px;}
						10% {height: 50px;}
						to {height: 0px;}
				}
	#content .center .args{width:485px;height:305px;background:url(./img/mp.png);float:right;position:relative;}
	#content .center .args a{width:120px;height:40px;display:block;background:#ff5722;text-align:center;line-height:40px;text-decoration:none;color:#fff;border-radius:50px;position:absolute;bottom:-75px;left:20px;}
	#content .center .args .info{margin:auto 0;padding:88px 1px;}
	#footer{width:100%;height:332px;background:url(./img/banner.png) no-repeat;background-size:cover;}
	#footer h1,span{padding:100px 0 10px 100px;}
	#form{display:none;}
</style>
</head>
<body>
	<div id="head">Java开发身份证识别系统</div>
	
		
			 <form enctype="multipart/form-data" method="post" id="form" action="upload.jsp">
				<input type="file" name="uploadfile" id="uploadfile" onchange="saveFile();" />
				<input id="filename" type="text" />	
			</form> 
		<div id="content">
				<div class="center">
			<div class="img">
<%-- 				<img id="c-img" alt="" src="${empty fileName?'./img/1.png':fileName}" />
 --%>				<img id="c-img" alt="" src="${empty fileName ? './img/1.png':fileName}" />
 				<div class="bs  scale"></div>
<!-- 				<div class="sm"></div>
 -->			</div>
			<div class="args">
				<a href="#" id="upload">上传图片</a>
				<p class="p_info"  id="p_message">
				<div class="info">
					<span id="name"><font color="red">姓名         </font></span><br />
					<span id="sex"><font color="red">性别         </font></span>
					<span id="nation"><font color="red">民族        </font></span><br />
					<span id="year"><font color="red">出生              </font></span>
					<span id="month"><font color="red">  年</font></span>
					<span id="day"><font color="red">月  </span>日</font><br />
					<span id="addr"><font color="red">住址    </font></span><br />
					<span id="num"><font color="red">公民身份号码   </font></span>
				</div>
			</div>
			</div>
		</div>
	<div id="footer">
		<h1>身份证识别</h1>
		<span>基于业界领先的深度学习技术</span><br />
		<span>为用户提供二代身份证识别服务</span>
	</div>
	<script type="text/javascript" src="./js/jquery.min.js"></script>
	<script  type="text/javascript">
	$(function(){
		//点击上传按钮 
		$("#upload").click(function(){
			var ie = navigator.appName == "Microsoft Internet Explorer" ? true:false;
			if(ie){
				document.getElementById("uploadfile").click();
				document.getElementById("filename").value = document.getElementById("uploadfile").value;
			} else {
				var a= document.createEvent("MouseEvents");
				a.initEvent("click",true,true);
				document.getElementById("uploadfile").dispatchEvent(a);
				
			}
		});
		//执行身份证识别
		query();
	});
	
	
	//上传图像
	function saveFile(){
		document.getElementById("form").submit();
	}
	
	//身份证识别
	function query(){
		var msg = $("#c-img").attr("src");
		$.ajax({
			type:"post",	
			url:"idData.jsp",
			data:{"path":msg},
			success:function(data){
				//$("#p_message").prepend(data);
				$(".bs").removeClass().empty();
				var result = $.parseJSON(data);
				var birthday = result.words_result.出生.words;
				var year = birthday.substring(0,4);
				var month = birthday.substring(4,6);
				var day = birthday.substring(6,8);
				$("#name").append(result.words_result.姓名.words); 
				$("#sex").append(result.words_result.性别.words);
				$("#nation").append(result.words_result.民族.words);
				$("#year").append(year);
				$("#month").append(month);
				$("#day").append(day);
				$("#addr").append(result.words_result.住址.words);
				$("#num").append(result.words_result.公民身份号码.words);
				
			}
		});
	}
		
	</script>

</body>
</html>