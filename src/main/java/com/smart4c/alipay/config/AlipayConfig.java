package com.smart4c.alipay.config;

public class AlipayConfig {
	// 合作身份者ID，以2088开头由16位纯数字组成的字符串
	public static String partner = "2088021715419572";
	
	// 收款支付宝账号
	public static String seller_email = "www80ycw_01@163.com";
	
	// 商户的私钥
	public static String key = "odfizgki3njhquygvx3gyuhed7b764hb";
	
	// 调试用，创建TXT日志文件夹路径
	public static String log_path = "var/lib/tomcat6/webapps/80ycw_log/";
	
	// 字符编码格式 目前支持 gbk 或 utf-8
	public static String input_charset = "utf-8";
	
	// 签名方式 不需修改
	public static String sign_type = "MD5";
}
