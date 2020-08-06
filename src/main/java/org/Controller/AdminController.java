package org.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/*")
public class AdminController { 
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	
	@RequestMapping("/access_denied_page")
	public String access_denied_page() {
		return "/error/access_denied_page";
	}
}
