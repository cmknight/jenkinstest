package com.canon.newweb;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * Utility class that reads the Rest configuration from a properties file, depending on the environment that the
 * application is running on. 
 *
 */
public class PropertyUtil {

	private static Properties properties = new Properties();	
	private static final Logger LOGGER = LogManager.getLogger(PropertyUtil.class);

	static {
			
		File propertyFile = new File("/webapps/NewWeb/configuration.properties");
		try {
			if (propertyFile.exists()) {
				properties.load(new FileInputStream(propertyFile));	
			} else {			
				LOGGER.fatal("Properties file configuration.properties not found, unable to load any configuration properties");
				throw new RuntimeException("Properties file configuration.properties not found, unable to load any configuration properties");
			}
		} catch (FileNotFoundException e) {
			LOGGER.error("Theme config file not found", e);
		} catch (IOException e) {
			LOGGER.error("Error while reading theme config file", e);
		}
	}

	/**
	 * Returns the property value as a String
	 * @param key  The property key to lookup
	 * @return  The property value as a String
	 */
	public static String getStringValue(String key) {		
		return properties.getProperty(key);		
	}
	
	/**
	 * Returns the property value as an Integer
	 * @param key  The property key to lookup
	 * @return  The property value as a Integer
	 */
	public static Integer getIntegerValue(String key) {		
		Integer value = null;
		try {
			value = Integer.parseInt(properties.getProperty(key));
		} catch (NumberFormatException e) {
			LOGGER.error("Failed to parse integer property with key '" + key + "', value found was '" + properties.getProperty(key) + "'", e);
		}
		return value;
	}
}
