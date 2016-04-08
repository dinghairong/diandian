package com.smart4c.action.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.common.SmartProperties;
import com.smart4c.security.FilePathCheck;
import com.smart4c.util.MiscUtils;

@Scope("prototype")
@Component
public class ImageMgmtAction extends ActionSupport implements ServletResponseAware{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6310856585716407155L;
	
	private HttpServletResponse response;
	private SmartProperties smartProp = SmartProperties.getInstance();
	
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	private String picType;
	
	private String imagePath;
	private String imageName;
	
	public String getPicType() {
		return picType;
	}
	public void setPicType(String picType) {
		this.picType = picType;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	
	public String uploadPics() throws Exception {
		JSONObject ret = new JSONObject();
		String imgPath = smartProp.getImgPath();
		String suffix = MiscUtils.getFileSuffix(fileFileName);
		String fileName = new Date().getTime() + "." + suffix;
		boolean uploaded = false;
		String detail = "";
		do {
			if ("shop_thumbnail_picture".equals(picType)) {
				imgPath += "shop" + File.separator + smartProp.getProperty("shop_thumbnail_picture");
			}else if("serviceshop_image".equals(picType)){
				imgPath += "shop" + File.separator + smartProp.getProperty("shop_icon_folder");

			}else if("user_avatar".equals(picType)){
				imgPath += "user" + File.separator + smartProp.getProperty("user_avatar_folder");
			} else if ("ads_picture".equals(picType)) {
				imgPath += "ads" + File.separator;
			}else if("product_detail_picture".equals(picType)){
				imgPath += "product" + File.separator + smartProp.getProperty("product_detail_picture_folder");
			}else {
				detail = picType + " is an invalid picture type!";
				break;
			}
			if (!imgPath.endsWith(File.separator)) {
				imgPath += File.separator;
			}
			// check path validation for security issue
			if (!FilePathCheck.canBeAccess(new File(imgPath, fileName))) {
				MiscUtils.getLogger().error("Permission denied! Access File: " + imgPath + fileName);
				response.sendError(403);
				return null;
			}
			
			uploaded = MiscUtils.storeFile(imgPath, fileName, file);
			if (!uploaded) {
				detail = "Failed to store the file: " + fileFileName;
				ret.put("imgPath", imgPath);
				ret.put("imgName", fileName);
			} else {
				ret.put("imgPath", imgPath);
				ret.put("imgName", fileName);
			}
		} while (false);
		
		
		ret.put("success", uploaded);
		ret.put("message", detail);
		
		
		try {
			PrintWriter out = response.getWriter();
			out.write(ret.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}
	
	public String displayPic() throws Exception {
		File imgFile = new File(imagePath, imageName);
		if (!FilePathCheck.canBeAccess(imgFile)) {
			MiscUtils.getLogger().error("Permission denied! Access File: " + imagePath + imageName);
			response.sendError(403);
			return null;
		}
		if (!imgFile.exists()) {
			return null;
		}
		
		response.setContentType("image/*");
		
		try {
			FileInputStream in = new FileInputStream(imgFile);
			OutputStream os = response.getOutputStream();
			byte[] buff = new byte[1024];
			int count = 0;
			while ((count = in.read(buff)) != -1) {
				os.write(buff, 0, count);
			}
			in.close();
			os.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
}
