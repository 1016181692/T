package com.tz.ID.sysmanage.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class Upload extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String fileName = null;
		File uploadFile = null;
		
		try {
		//判断文件上传类型
		boolean bol = ServletFileUpload.isMultipartContent(req);
		
		if(bol) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			
			Iterator<FileItem> items = upload.parseRequest(req).iterator();
			while(items.hasNext()){
				FileItem item = items.next();
				fileName = item.getName();
				System.out.println(fileName);
				//定义文件上传目录
				String filePath = req.getRealPath("upload"); 
				File file = new File(filePath);
				//判断文件是否存在
				if(!file.exists()){
					file.mkdirs();
				}
				//上传文件
			uploadFile = new File(filePath + "\\"+fileName);
			item.write(uploadFile);
				}
			}
		}catch (Exception e) {
				e.printStackTrace();
			}
		if(null != fileName) {
			req.getSession().setAttribute("fileName", "upload/"+fileName);
			resp.sendRedirect("index.jsp");
		}
		
	
	
	}
}
