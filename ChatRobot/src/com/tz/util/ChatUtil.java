package com.tz.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * 
 * 人工智能客服工具类
 * @author Dell
 *
 */
public class ChatUtil {
	
	/**
	 * 对话人工智能机器人获取答案
	 * 
	 * 
	 * @param message 用户输入的信息
	 * @return  回复的内容
	 */
	public static String getResult(String message){
		
		StringBuffer buffer = new StringBuffer();
		URL urlObj = null;
		InputStreamReader reader = null;
		BufferedReader br = null;
		
		
		try {
			String question = URLEncoder.encode(message,"UTF-8");
			//String question = URLEncoder.encode(message,"UTF-8");
			//请求图灵机器人
			//String requestUrl = "www.tuling123.com/openapi/api?key=62c45bd2fc4dbc93b45e74cbf2034f0e&info="+message;
			String requestUrl = "http://www.tuling123.com/openapi/api?key=f47f9387d9d54505bac7310b8fdb2264&info="+question;

			//建立网络连接
			urlObj = new URL(requestUrl);
			//打开连接
			URLConnection uc = urlObj.openConnection();
			//直接连接
			uc.connect();
			//获取请求结果
			reader = new InputStreamReader(uc.getInputStream(),"UTF-8");
			//建立文件缓冲流
			br = new BufferedReader(reader);
			
			String temp = null;
			while((temp = br.readLine()) != null){
				buffer.append(temp);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(br != null){
				try {
					br.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if(reader != null){
				try {
					reader.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		
		
		return buffer.toString();
	}
	
	
	
	
	
	
	
	public static void main(String[] args) {
		//System.out.println("大家好！");
		String message = "今天天气怎么样？";
		String str = getResult(message);
		System.out.println(str);
		
	}
	

}
