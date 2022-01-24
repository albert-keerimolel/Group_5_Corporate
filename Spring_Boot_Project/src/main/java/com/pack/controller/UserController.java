package com.pack.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pack.dao.UserDao;
import com.pack.model.User;

@Controller
public class UserController {

	@Autowired
	UserDao dao;

	@RequestMapping("/userEntryController")
	public String showUserEntry() {
		return "userEntry";
	}

	@RequestMapping("/addUserController")
	public String addUser(Model m) {
		m.addAttribute("user", new User());
		return "addUser";
	}

	@RequestMapping(value = "/addUserForm", method = RequestMethod.POST)
	public String addStudent(@Valid @ModelAttribute("user") User user, BindingResult br) {
		if (br.hasErrors()) {
			return "addUser";
		}
		int res = dao.insertUser(user);
		if (res >= 1)
			return "addUserSuccess";
		else
			return "failure";

	}

	@RequestMapping("/viewUserController")
	public String viewCorp(Model m) {
		List<User> list = dao.viewAll();
		m.addAttribute("list", list);
		return "viewUser";
	}

	@RequestMapping("/modifyUserController")
	public String edit(@RequestParam("loginId") String id, Model m) {
		User user = dao.getUserById(id);
		m.addAttribute("modifyuser", user);

		System.out.println("id " + id);
		return "modifyUser";
	}

	@RequestMapping("/modifyUserDB")
	public String modify(User user) {
		int res = dao.modifyUser(user);
		if (res >= 1)
			return "redirect:/viewUserController";
		else
			return "failure";

	}

	@RequestMapping(value = "/deleteUserController/{loginId}", method = RequestMethod.GET)
	public String delete(@PathVariable String loginId) {

		int res = dao.delete(loginId);

		System.out.println("id " + loginId);

		if (res >= 1)

			return "redirect:/viewUserController";
		else
			return "failure";
	}

}
