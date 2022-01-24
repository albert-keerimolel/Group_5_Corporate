package com.pack.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pack.model.LoginAdmin;

@Controller
public class LoginAdminController {

	@RequestMapping("/login")
	public String add(Model m) {
		m.addAttribute("log", new LoginAdmin());
		return "loginAdmin";
	}

	@RequestMapping(value = "/LoginAdminDB", method = RequestMethod.POST)
	public String addStudent(@Valid @ModelAttribute("log") LoginAdmin log, BindingResult br) throws CustomException {
		if (br.hasErrors()) {
			return "loginAdmin";
		}
		String uname = log.getUsername();
		String password = log.getPassword();

		if (uname.equals("Alan") && password.equals("1234")) {
			return "homePageAdmin";
		} else {
			throw new CustomException("Oops!! Sorry Invalid Credentials. Try again :(");
		}

	}

	@ExceptionHandler(CustomException.class)
	public ModelAndView handleCustomException(CustomException ex) {

		ModelAndView model = new ModelAndView("loginError");
		model.addObject("errMsg", ex.getErrMsg());

		return model;

	}

}
