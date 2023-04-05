package com.ezen.springrest;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@GetMapping("/gongong")
	public String gongong() {
		return "gongong";
	}
	
	@RequestMapping(value = "/error/wrong", method = RequestMethod.GET)
	public String errorCode400() {
		log.info("에러 발생 시 하고싶은 일 적는 곳");
		return "errorpage/400";
	}
}