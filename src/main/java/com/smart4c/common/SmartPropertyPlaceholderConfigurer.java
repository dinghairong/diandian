package com.smart4c.common;

import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import com.smart4c.util.MiscUtils;

public class SmartPropertyPlaceholderConfigurer extends
		PropertyPlaceholderConfigurer {
	private static Logger log = MiscUtils.getLogger();

	protected String resolvePlaceholder(String placeholder,
			Properties properties, int systemPropertiesMode) {
		log.debug("resolvePlaceholder Start " + placeholder);
		Properties props = SmartProperties.getInstance();
		if (props.containsKey(placeholder)) {
			log.debug("setting property " + placeholder + " with "
					+ props.getProperty(placeholder));
			properties.setProperty(placeholder, props.getProperty(placeholder));
		}
		return super.resolvePlaceholder(placeholder, properties,
				systemPropertiesMode);
	}

	protected String resolvePlaceholder(String placeholder,
			Properties properties) {
		log.debug("resolvePlaceholder 2" + placeholder);
		return super.resolvePlaceholder(placeholder, properties);
	}
}
