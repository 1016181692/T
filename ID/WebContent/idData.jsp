<%@ page language="java" import= "java.util.*,com.tz.ID.sysmanage.servlet.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String path = request.getParameter("path");
	String pathName = request.getRealPath(path);
	String msg = QueryId.getResult(pathName);
	out.println(msg);


%>