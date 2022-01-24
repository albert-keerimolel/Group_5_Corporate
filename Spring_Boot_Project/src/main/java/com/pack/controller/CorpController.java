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

import com.pack.dao.CorpDao;
import com.pack.model.Corp;

@Controller
public class CorpController {

	@Autowired
	public CorpDao dao;

	@RequestMapping("/")
	public String showIndex() {
		return "homePageAdmin";
	}

	@RequestMapping("/corpEntryController")
	public String showCorpEntry() {
		return "corpEntry";
	}

	@RequestMapping("/addCorpController")
	public String addCorp(Model m) {
		m.addAttribute("corp", new Corp());
		return "addCorp";
	}

	@RequestMapping(value = "/addCorpForm", method = RequestMethod.POST)
	public String addCorps(@Valid @ModelAttribute("corp") Corp corp, BindingResult br) {
		if (br.hasErrors()) {
			return "addCorp";
		}
		int res = dao.insertCorp(corp);
		if (res >= 1)
			return "addCorpSuccess";
		else
			return "failure";
	}

	@RequestMapping("/viewCorpController")
	public String viewCorp(Model m) {
		List<Corp> list = dao.viewAll();
		m.addAttribute("list", list);
		return "viewCorp";
	}

	@RequestMapping("/modifyCorpController")
	public String edit(@RequestParam("corpId") int id, Model m) {
		Corp corp = dao.getCorpById(id);
		m.addAttribute("modifycorp", corp);

		System.out.println("id " + id);
		return "modifyCorp";
	}

	@RequestMapping("/modifyCorpDB")
	public String modify(Corp corp) {
		int res = dao.modifyCorp(corp);
		if (res >= 1)
			return "redirect:/viewCorpController";
		else
			return "failure";

	}

	@RequestMapping(value = "/deleteCorpController/{corpId}", method = RequestMethod.GET)
	public String delete(@PathVariable int corpId) {

		int res = dao.delete(corpId);

		System.out.println("id " + corpId);

		if (res >= 1)

			return "redirect:/viewCorpController";
		else
			return "failure";
	}
}
