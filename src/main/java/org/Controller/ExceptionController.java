package org.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


@ControllerAdvice
public class ExceptionController {
	
	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
	
	@ExceptionHandler(Exception.class)
	private ModelAndView common(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error/common_error");
		mav.addObject("exception", e);
		return mav;
	}
}
