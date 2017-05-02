package com.tz.ID.sysmanage.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.baidu.aip.ocr.AipOcr;

public class Query extends HttpServlet {
	
	public static final String APP_ID = "9389343";
	public static final String API_KEY = "9FfcAkwQ9pBWgYO4vmfdOf31";
	public static final String SECRET_KEY = "XQMyp7ZYp1D99XCrzPxB7bTjPEOSGYwr";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String path = req.getParameter("path");
		String realPath = req.getRealPath(path);
		String result = getResult(realPath);
		resp.getWriter().print(result);
	}
	
	
	public static String getResult(String path){
		
		//创建一个客户端对象
		AipOcr client = new AipOcr(APP_ID,API_KEY,SECRET_KEY);
		//判断身份证是正面
		boolean isFront = true;
		HashMap<String,String> options = new HashMap<String,String>();
		JSONObject result = client.idcard(path, isFront, options);
		
		return result.toString();
	}
	
}
