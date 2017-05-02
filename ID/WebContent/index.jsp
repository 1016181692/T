<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"  pageEncoding="UTF-8"%>
    
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServletPath();
    %>
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
	#content .center .args{width:485px;height:305px;background:url(./img/mb.jpg);float:right;position:relative;}
	#content .center .args a{width:120px;height:40px;display:block;background:#ff5722;text-align:center;line-height:40px;text-decoration:none;color:#fff;border-radius:50px;position:absolute;bottom:-75px;left:20px;}
	#footer{width:100%;height:332px;background:url(./img/banner.png) no-repeat;background-size:cover;}
	#footer h1,span{padding:100px 0 10px 100px;}
	#form{display:none;}
</style>
</head>
<body>
	<div id="head">Java开发身份证识别系统</div>
	
		
			 <form enctype="multipart/form-data" method="post" id="form" action="upload">
				<input type="file" name="uploadfile" id="uploadfile" onchange="upload()" />
				<input id="submit" type="submit" />	
			</form> 
		<div id="content">
				<div class="center">
			<div class="img">
<%-- 				<img id="c-img" alt="" src="${empty fileName?'./img/1.png':fileName}" />
 --%>				<img id="c-img" alt="" src="${empty fileName?'./img/1.png':fileName}" />
		<%-- <div id="content">
			<div class="img">
				<img id="c-img" alt="" src="${empty fileName?'./img/1.png':fileName}" /> --%>
				<div class="sm"></div>
			</div>
			<div class="args">
				<a href="#" id="upload">上传图片</a>
				<span id="name"></span>
				<span id="sex"></span>
				<span id="nation"></span>
				<span id="year"></span>
				<span id="month"></span>
				<span id="day"></span>
				<span id="addr"></span>
				<span id="num"></span>
			</div>
			</div>
		</div>
	<div id="footer">
		<h1>身份证识别</h1>
		<span>基于业界领先的深度学习技术</span><br />
		<span>为用户提供二代身份证识别服务</span>
	</div>
	<script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
	<script  type="text/javascript">
	
		$(function(){
			query();
		});
		
		//绑定事件
		$("#upload").click(function(){
			$("#uploadfile").click();
		});
		
		//上传图片
		function upload(){
			$("#form").submit();
		}
		/* function upload(){
			var pic=$("#uploadfile").val();
			var fileSize = (document.getElementById("uploadfile").files[0,2000]);
			var strs = pic.split('.');
			var filetype = srts [strs .length -1];
			//判断上传文件的类型
			if(filetype !='jpg' && filetype != 'gif' && filetype !='png') {
				alert("你选择的不是图片，请选择图片");
				$("$uploadfile").val("");
			}else if(fileSize>2) {
				alert("你选择的图片过大！请选择小于2M的图片");
				$("#uploadfile").val("");
			} else{
				$("#submit").click();//提交表单
				query();
			}	
		} */
		
		//图片扫描
		function sm() {
			var box = $(".img");
			$(".sm").css({"bottom":box.height()}).animate({bottom:0},2000,function(){$(this).css({"bottom":box.height()})});
		}
		sm();
		//query();
		
		
		//请求数据
		function query(){
			var path = $("#c-img").attr("src");
			$.ajax({
				type:"post",
				url:"query",
				data:{"path":path},
				success:function(data){
					var result = $.parseJSON(data);
					var birthday = result.words_result.出生.words;
					var year = birthday.substring(0,4);
					var month = birthday.substring(4,6);
					var day = birthday.substring(6,8);
					$("#name").text(result.words_result.姓名.words);
					$("#sex").text(result.words_result.性别.words);
					$("#nation").text(result.words_result.民族.words);
					$("#year").text(year);
					$("#month").text(month);
					$("#day").text(day);
					$("#addr").text(result.words_result.住址.words);
					$("#num").text(result.words_result.公民身份号码.words);
				}
			});
		}
		
	</script>

</body>
</html>