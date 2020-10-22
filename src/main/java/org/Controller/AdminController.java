package org.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/*")
public class AdminController { 
	
	@RequestMapping(value="/apply", method=RequestMethod.GET)
	public void adminLogin() {
		//return "/admin/apply";
	}
	
	@RequestMapping("/access_denied_page")
	public String access_denied_page() {
		return "/error/access_denied_page";
	}
}
