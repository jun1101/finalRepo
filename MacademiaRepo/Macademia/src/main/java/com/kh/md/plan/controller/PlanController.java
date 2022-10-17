package com.kh.md.plan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("plan")
public class PlanController {

	@GetMapping("list")
	public String planList() {
		
		return "/plan/planList";
	}
	@GetMapping("write")
	public String planWrite(){
		
		return "/plan/planWrite";
	}
}
