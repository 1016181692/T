<%@ page language="java" import="java.util.*,com.tz.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

	request.setCharacterEncoding("UTF-8");
	String info = request.getParameter("info");
	String answer = ChatUtil.getResult(info);
	out.println(answer);
%>