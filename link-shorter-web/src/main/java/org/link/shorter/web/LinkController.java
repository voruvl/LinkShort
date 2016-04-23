package org.link.shorter.web;

import java.util.Locale;

import org.link.shorter.domain.Link;
import org.link.shorter.domain.User;
import org.link.shorter.services.LinkService;
import org.link.shorter.services.TagService;
import org.link.shorter.services.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LinkController {
	@Autowired
	private LinkService linkService;

	@Autowired
	private TagService tagService;

	@Autowired
	private UserService userService;

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(LinkController.class);

	@RequestMapping(value = { "/", "/links" }, method = RequestMethod.GET)
	public String homePage(Locale locale, Model model) {
		model.addAttribute("links", linkService.getLinks());
		return "links";
	}

	@RequestMapping(value = "/addLink", method = RequestMethod.GET)
	public ModelAndView addLink(@RequestParam("fullLink") String fullLink,
			@RequestParam("description") String description, @RequestParam("login") String login) {
		Link link = new Link();
		link.setFullLink(fullLink);
		link.setDescription(description);
		User user = userService.getUserByname(login);
		link.setUser(user);
		linkService.insertLink(link);
		ModelAndView mView = new ModelAndView("redirect:/");
		return mView;
	}

	@RequestMapping(value = "/listLink", method = RequestMethod.GET)
	public ModelAndView linksInTag(@RequestParam("idTag") Long tagId) {
		ModelAndView mView = new ModelAndView("listLink");
		mView.addObject("listLink", linkService.getListLink(tagId));
		mView.addObject("selectTag", tagService.getTagById(tagId));
		System.out.println(linkService.getListLink(tagId));
		return mView;
	}

	@RequestMapping(value = "/editTagToLink", method = RequestMethod.GET)
	public ModelAndView addTagToLink(@RequestParam("idLink") Long linkId, @RequestParam("idTag") Long tagId) {
		linkService.linkAddTag(linkId, tagId);
		ModelAndView mView = new ModelAndView("redirect:/");
		return mView;
	}

	@RequestMapping(value = "/deleteTagFromLink", method = RequestMethod.GET)
	public ModelAndView deleteTagFromLink(@RequestParam("idLink") Long linkId, @RequestParam("idTag") Long tagId) {
		linkService.linkRemoveTag(linkId, tagId);
		ModelAndView mView = new ModelAndView("redirect:/");
		return mView;
	}

	@RequestMapping(value = "/rd", method = RequestMethod.GET)
	public ModelAndView redirectLink(@RequestParam("sl") String shortLink) {
		Link link = linkService.getLinkByShortLink(shortLink);
		link.incCount();
		linkService.updateLink(link);
		System.out.println(link.getFullLink());
		ModelAndView mView = new ModelAndView("redirect:" + link.getFullLink());
		return mView;

	}
}