package com.techne.oauth2.client.service;

import java.io.*;
import java.util.*;

import com.techne.oauth2.client.dto.*;

public class ConfigurationService {
	
	private static ConfigurationService instance;
	
	private ConfigurationService(){
		
	}
	
	public static ConfigurationService getInstance(){
		if(instance==null){
			instance=new ConfigurationService();
		}
		return instance;
	}
	
	public Configuration loadConfiguration(String authorizationServerFile) throws IOException{
		return new Configuration(getPropertiesFromClasspath(authorizationServerFile));
	}
	
	private Properties getPropertiesFromClasspath(String propFileName)
			throws IOException {
		String filePath="";
		if(propFileName!=null){
			filePath=propFileName+".properties";
		}
		
		Properties props = new Properties();
		InputStream inputStream = this.getClass().getClassLoader()
				.getResourceAsStream(filePath);

		if (inputStream == null) {
			throw new FileNotFoundException("property file '" + filePath
					+ "' not found in the classpath");
		}

		props.load(inputStream);
		return props;
	}	
}
