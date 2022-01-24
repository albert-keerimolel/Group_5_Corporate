package com.pack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.pack.dao.LoginUserDao;
import com.pack.model.ChangePassword;
import com.pack.model.LoginUser;

@Controller
@SessionAttributes("login")
public class LoginUserController {
	@Autowired
	public LoginUserDao dao;

	@ModelAttribute("login")
	public LoginUser gotoHomePage() {
		return new LoginUser();
	}

	@RequestMapping("/loginUsers")
	public String add(Model m) {
		m.addAttribute("log", new LoginUser());
		return "loginUser";
	}

	@RequestMapping(value = "/LoginUserDB")
	public String addStudent(@ModelAttribute("login") LoginUser login, LoginUser log, Model m) throws CustomException {

		String password = log.getPassword();
		int res = dao.check(log);

		if (res == 1) {
			m.addAttribute("pass", password);
			m.addAttribute("change", new ChangePassword());
			return "changePassword";
		} else if (res == 2) {
			return "redirect:/homePageController";
		} else {
			throw new CustomException("Oops!! Sorry Invalid Credentials.Try again :(");
		}

	}

	@RequestMapping("/homePageController")
	public String redirect() {

		return "homePageUser";
	}

	@RequestMapping(value = "/changePasswordDB")
	public String addCorps(ChangePassword change) {

		int res = dao.insertPass(change);
		if (res >= 1)
			return "redirect:/loginUsers";
		else
			return "failure";
	}

	@RequestMapping("/AccountSummary")
	public String viewCorp(@RequestParam("corpId") int id, Model m) {

		m.addAttribute("corpId", id);
		return "showSummary";
	}

	@RequestMapping("/AccountDetails")
	public String viewAccount(@RequestParam("accNumber") String id, Model m) {

		m.addAttribute("accNumber", id);
		return "accountDetail";
	}

	@ExceptionHandler(CustomException.class)
	public ModelAndView handleCustomException(CustomException ex) {

		ModelAndView model = new ModelAndView("loginUserError");
		model.addObject("errMsg", ex.getErrMsg());

		return model;

	}

}
