package com.tz.ID.sysmanage.servlet;

import java.util.HashMap;

import org.json.JSONObject;

import com.baidu.aip.ocr.AipOcr;

public class QueryId {

	
public static String getResult(String path){
	
	
	 String APP_ID = "9389343";
	 String API_KEY = "9FfcAkwQ9pBWgYO4vmfdOf31";
	 String SECRET_KEY = "XQMyp7ZYp1D99XCrzPxB7bTjPEOSGYwr";
		
		//创建一个客户端对象
		AipOcr client = new AipOcr(APP_ID,API_KEY,SECRET_KEY);
		//判断身份证是正面
		boolean isFront = true;
		HashMap<String,String> options = new HashMap<String,String>();
		JSONObject result = client.idcard(path, isFront, options);
		
		return result.toString();
	}
}
