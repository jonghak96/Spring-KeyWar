package com.spring.keywar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ControllerMatch {

	@RequestMapping()
	public String name2() {
		
		return "name";
	}
	
	
}//----
