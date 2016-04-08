package com.smart4c.security;

import java.io.File;

import com.smart4c.common.SmartProperties;
import com.smart4c.util.MiscUtils;

public class FilePathCheck {
	public static final String imgPath = SmartProperties.getInstance().getImgPath();
	public static boolean canBeAccess(File file) {
		if (file == null) {
			return true;
		} 
		try {
			if (file.getCanonicalPath().startsWith(imgPath)) {
				return true;
			}
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return false;
	}
}
