package com.laptrinhjavaweb.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class MessageUtil {
	public Map<String, String> getMessage(String message){
		Map<String, String> result = new HashMap<>();
		
    	  if(message.equals("update_success")) {
    		  result.put("message", "Update Success");
    		  result.put("alert", "success");
    	  }
    	  else if(message.equals("insert_success")) {
    		  result.put("message", "Insert Success");
    		  result.put("alert", "success");
    	  }
    	  else if(message.equals("error_system")) {
    		  result.put("message", "Error System");
    		  result.put("alert", "danger");
    	  }
		return result;
	}
}
