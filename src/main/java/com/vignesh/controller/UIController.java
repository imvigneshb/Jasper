package com.vignesh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vignesh.report.ProductReport;

@Controller
public class UIController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexPage(ModelMap modelMap) {
		ProductReport productReport = new ProductReport();
		modelMap.addAttribute("products", productReport.findAllProducts());
		return "index";
	}
}
