package org.link.shorter.web;

import java.util.Locale;

import org.link.shorter.domain.Link;
import org.link.shorter.domain.Tag;
import org.link.shorter.services.LinkService;
import org.link.shorter.services.TagService;
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
public class TagController {
	@Autowired
	private TagService tagService;
	@Autowired
	private LinkService linkService;
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(TagController.class);

	@RequestMapping(value = "/tags", method = RequestMethod.GET)
	public String firstPageTags(Locale locale, Model model) {
		model.addAttribute("tags", tagService.getTags());
		return "tags";
	}

	@RequestMapping(value = "/insertTag", method = RequestMethod.GET)
	public ModelAndView addTagToLink(Model model, @RequestParam("idLink") Long idLink) {
		Link link = linkService.getLinkById(idLink);
		model.addAttribute("link", link);
		ModelAndView mView = new ModelAndView("redirect:/tagslist");
		return mView;
	}

	@RequestMapping(value = "/editTag", method = RequestMethod.GET)
	public String pageTags(@RequestParam("idLink") Long idLink, Locale locale, Model model) {
		model.addAttribute("tags", tagService.getTags());
		model.addAttribute("link", linkService.getLinkById(idLink));
		return "tagslist";
	}

	@RequestMapping(value = "/addTag", method = RequestMethod.GET)
	public ModelAndView addTag(@RequestParam("nameTag") String nameTag) {
		Tag tag = new Tag();
		tag.setName(nameTag);
		tagService.insertTag(tag);
		ModelAndView mView = new ModelAndView("redirect:/tags");
		return mView;
	}

}
