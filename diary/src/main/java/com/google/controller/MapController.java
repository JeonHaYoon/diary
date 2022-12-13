package com.google.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/map/*")
public class MapController {

	
	@GetMapping("/restaurant")
	public String restaurant() {
		
		return "/diary/map/restaurant";
	}
	
	
}
