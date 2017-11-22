package com.cjj.core.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import com.cjj.web.personnelmanage.EmployeeController;

public class FileLoadUtil {
	
	private final static Logger log = Logger.getLogger(EmployeeController.class);
	
	/**
	 * 文件上传
	 * @return
	 */
	public static String file_load(MultipartFile myfile, HttpServletRequest request) throws IOException{
		System.out.println("文件上传开始");
		String file_path = "";
		if(myfile.isEmpty()){
			log.info("文件未上传");
		}else{
			log.info("文件长度：" + myfile.getSize());
			log.info("文件类型：" + myfile.getContentType());
			log.info("文件名称：" + myfile.getName());
			log.info("文件原名：" + myfile.getOriginalFilename());
			log.info("======================================");
			//文件存放相对路径，便于查询
			//String temp_dir = request.getSession().getServletContext().getRealPath("/image");//文件上传路径
			//String temp_dir_data = request.getContextPath() + "/image/";//文件保存路径
			String link = new SimpleDateFormat("yyyyMMdd").format(new Date()) + "/";
			String temp_dir = "d:/resourcesfile/images/hospitalmanage/" + link;
			log.info("文件存放目录：" + temp_dir);
			String filename = myfile.getOriginalFilename();//上传时得到的文件名
			long lTime = System.nanoTime();
			String ext = filename.substring(filename.lastIndexOf("."));
			filename = lTime + ext;
			FileUtils.writeByteArrayToFile(new File(temp_dir, filename), myfile.getBytes());
			//设置图片所在路径
			file_path = "http://127.0.0.1:8089/hospitalmanage/" + link + filename;
			log.info("数据库存放目录：" + file_path);
		}
		//直接保存转成bytes的图片
//		if(!myfile.isEmpty()){
//			badge = new BASE64Encoder().encode(myfile.getBytes());
//		}
		return file_path;
	}
}
