package com.example.demo.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class loginController {

	@RequestMapping("/login")
	public String getLogin() {
		return "login";
	}

	@GetMapping("/login")
	public void loginGET(String error, String logout) {
		if(logout != null) {
			
		}
	 }
	 
	@PreAuthorize("hasRole('USER')")
	@RequestMapping("/")
	public String goMain(Principal principal, Model model) throws Exception {
		
		model.addAttribute("username", principal.getName());
		return "main";
	}

}
