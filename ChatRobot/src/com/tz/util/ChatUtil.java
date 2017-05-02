package com.tz.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 * 
 * �˹����ܿͷ�������
 * @author Dell
 *
 */
public class ChatUtil {
	
	/**
	 * �Ի��˹����ܻ����˻�ȡ��
	 * 
	 * 
	 * @param message �û��������Ϣ
	 * @return  �ظ�������
	 */
	public static String getResult(String message){
		
		StringBuffer buffer = new StringBuffer();
		URL urlObj = null;
		InputStreamReader reader = null;
		BufferedReader br = null;
		
		
		try {
			String question = URLEncoder.encode(message,"UTF-8");
			//String question = URLEncoder.encode(message,"UTF-8");
			//����ͼ�������
			//String requestUrl = "www.tuling123.com/openapi/api?key=62c45bd2fc4dbc93b45e74cbf2034f0e&info="+message;
			String requestUrl = "http://www.tuling123.com/openapi/api?key=f47f9387d9d54505bac7310b8fdb2264&info="+question;

			//������������
			urlObj = new URL(requestUrl);
			//������
			URLConnection uc = urlObj.openConnection();
			//ֱ������
			uc.connect();
			//��ȡ������
			reader = new InputStreamReader(uc.getInputStream(),"UTF-8");
			//�����ļ�������
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
		//System.out.println("��Һã�");
		String message = "����������ô����";
		String str = getResult(message);
		System.out.println(str);
		
	}
	

}
