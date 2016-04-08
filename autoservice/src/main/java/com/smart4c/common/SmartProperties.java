package com.smart4c.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.smart4c.util.MiscUtils;


public class SmartProperties extends Properties {
	private static final long serialVersionUID = 6826276411016192863L;
	private static SmartProperties props = new SmartProperties();

	public static SmartProperties getInstance() {
		return props;
	}

	private SmartProperties() {
		MiscUtils.getLogger().debug("SMART4C PROPS CONSTRUCTOR");
		try {
			readFromFile("/smart4c.properties");
		} catch (IOException e) {
			MiscUtils.getLogger().error("Error", e);
		}
	}

	public void readFromFile(String url) throws IOException {
		InputStream is = getClass().getResourceAsStream(url);
		if (is == null)
			is = new FileInputStream(url);

		try {
			load(is);
		} finally {
			is.close();
		}
	}

	@Override
	public String getProperty(String key) {
		String tmp = super.getProperty(key);
		if (null == tmp) {
			return "";
		}
		return tmp.trim();
	}

	public int getIntProperty(String key) {
		try {
			String value = props.getProperty(key);
			return Integer.parseInt(value);
		} catch (Exception e) {
			return 0;
		}
	}

	public boolean getBooleanProperty(String key) {
		try {
			String value = props.getProperty(key);
			return Boolean.parseBoolean(value);
		} catch (Exception e) {
			return false;
		}
	}
	
	public String getImgPath() {
		String imgPath = props.getProperty("img_path");
		if (imgPath == null) {
			imgPath = "";
		}
		if (!imgPath.endsWith(File.separator)) {
			imgPath += File.separator;
		}
		return imgPath;
	}
}
