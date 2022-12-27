package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map/*")
public class MapController {

	
	@GetMapping("/searchPlace")
	public String restaurant() {
		
		return "/diary/map/searchPlace";
	}
	
	
}
