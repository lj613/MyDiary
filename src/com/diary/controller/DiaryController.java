package com.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/diary")
@Controller
public class DiaryController {
   
	@RequestMapping(value = "/w_diary", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView model) {
		model.setViewName("diary/w_diary");
		return model;
	}

}
