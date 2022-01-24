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

import com.pack.dao.AccountDao;
import com.pack.model.Account;

@Controller
public class AccountController {

	@Autowired
	AccountDao dao;

	@RequestMapping("/accountEntryController")
	public String showAccountEntry() {
		return "accountEntry";
	}

	@RequestMapping("/addAccountController")
	public String addAccount(Model m) {
		m.addAttribute("account", new Account());
		return "addAccount";
	}

	@RequestMapping(value = "/addAccountForm", method = RequestMethod.POST)
	public String addStudent(@Valid @ModelAttribute("account") Account account, BindingResult br) {
		if (br.hasErrors()) {
			return "addAccount";
		}
		int res = dao.insertAccount(account);
		if (res >= 1)
			return "addAccountSuccess";
		else
			return "failure";

	}

	@RequestMapping("/viewAccountController")
	public String viewCorp(Model m) {
		List<Account> list = dao.viewAll();
		m.addAttribute("list", list);
		return "viewAccount";
	}

	@RequestMapping(value = "/deleteAccountController/{accNumber}", method = RequestMethod.GET)
	public String delete(@PathVariable String accNumber) {

		int res = dao.delete(accNumber);

		System.out.println("id " + accNumber);

		if (res >= 1)

			return "redirect:/viewAccountController";
		else
			return "failure";
	}

}
