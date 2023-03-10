package com.example.demo.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {
	
	
	@PreAuthorize("hasRole('USER')")
	@GetMapping("main")
	public String getMain(Principal principal, Model model) {
		model.addAttribute("username", principal.getName());
		return "main";
	}
	
}