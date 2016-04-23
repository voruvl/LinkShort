package org.link.shorter.web;

import java.util.Locale;

import org.link.shorter.domain.User;
import org.link.shorter.services.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RegController {

	@Autowired
	private UserService userService;

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(RegController.class);

	private static final String ERR_USERNAME = "Пользователь с таким логином уже зарегистрирован, придумай себе другой";

	private static final String ERR_PASSWORD = "Проверь пароли, они не одинаковые";

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String loginPage(Locale locale, Model model) {

		return "login";
	}

	@RequestMapping(value = { "/regform" }, method = RequestMethod.GET)
	public String regPage(Locale locale, Model model) {
		return "regform";
	}

	@RequestMapping(value = { "/adduser" }, method = RequestMethod.POST)
	public String regUser(Locale locale, Model model, @RequestParam(value = "login", required = false) String login,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "confirmpassword", required = false) String confirmPassword) {

		User user = new User();
		user.setLogin(login);
		if (userService.getUserByname(login) != null) {
			model.addAttribute("usernamefail", ERR_USERNAME);
			return "/regform";
		} else if (!password.equals(confirmPassword)) {
			model.addAttribute("passwordfail", ERR_PASSWORD);
			return "/regform";
		} else if (password.equals(confirmPassword)) {
			user.setPassword(password);
			userService.insertUser(user);
		}
		return "redirect:/";
	}
}
