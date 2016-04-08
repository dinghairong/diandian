package com.smart4c.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

public class MiscUtils {
	private static SimpleDateFormat formatter = new SimpleDateFormat(
			"yyyyMMddHHmmss");

	public static Logger getLogger() {
		StackTraceElement[] ste = Thread.currentThread().getStackTrace();
		String caller = ste[2].getClassName();
		return (Logger.getLogger(caller));
	}

	public static String getCurrentTime(String formatter) {
		SimpleDateFormat dateFformatter = new SimpleDateFormat(formatter);
		return dateFformatter.format(new Date());
	}

	public static String getCurrentTime() {
		return formatter.format(new Date());
	}

	public static InputStream getResource(String res) {
		InputStream in = null;
		if (StringUtils.isNotEmpty(res)) {
			in = MiscUtils.class.getResourceAsStream(res);
			if (in == null) {
				in = Thread.currentThread().getContextClassLoader()
						.getResourceAsStream(res);
			}
		}
		return in;
	}
	
	public static String getFileSuffix(String fileName) {
		int end = fileName.lastIndexOf(".");
		if (end == -1 || (end == fileName.length() - 1)) {
			return "";
		}
		return fileName.substring(end + 1);
	}
	
	public static boolean storeFile(String folder, String fileName, File file) {
		if (file == null) {
			return false;
		}
		try {
			File out = new File(folder);
			if (out == null) {
				return false;
			}
			if (!out.exists()) {
				out.mkdirs();
			}
			FileOutputStream os = new FileOutputStream(new File(out, fileName));
			FileInputStream in = new FileInputStream(file);
			byte[] line = new byte[1024];
			int count = 0;
			while ((count = in.read(line)) != -1) {
				os.write(line, 0, count);
			}
			
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
			return false;
		}
		return true;
	}
	
	public static String addPathSuffix(String path) {
		if (!path.endsWith(File.separator)) {
			path += File.separator;
		}
		return path;
	}
	
	public static boolean isLeapYear(int year) {
		if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * @return true if inputed password equals password in the DB, false otherwise.
	 */
	public boolean checkPassword(String inputedPassword, String pass) {
		if (inputedPassword == null) return (false);

		byte[] sha1Bytes = EncryptionUtils.getSha1(inputedPassword);
		StringBuilder sb = new StringBuilder();
		for (byte b : sha1Bytes) {
			sb.append(b);
		}

		if (pass.equals(sb.toString())) {
			return (true);
		} else {
			try {
				// sleep to throttle anyone trying to brute force hack passwords
				Thread.sleep(250);
			} catch (InterruptedException e) {
				MiscUtils.getLogger().error("Error", e);
			}
			return (false);
		}
	}
	
	/**
	 * 
	 * @param utfString
	 * @return
	 */
	static public String sinaAPIBodyConvert(String utfString){
	    StringBuilder sb = new StringBuilder();
	    int i = -1;
	    int pos = 0;
	     
	    while((i=utfString.indexOf("\\u", pos)) != -1){
	        sb.append(utfString.substring(pos, i));
	        if(i+5 < utfString.length()){
	            pos = i+6;
	            sb.append((char)Integer.parseInt(utfString.substring(i+2, i+6), 16));
	        }
	    }
	     
	    return sb.toString();
	}
	
	/**
	 * baidu map api respose body coverter
	 * @throws UnsupportedEncodingException 
	 */
	static public String baiduMapApiRspConvert(String rspBody, String charset) {
		if (rspBody == null) {
			return "";
		}
		try {
			return new String(rspBody.getBytes(charset));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
}

