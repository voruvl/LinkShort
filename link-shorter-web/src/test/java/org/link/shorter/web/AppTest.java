package org.link.shorter.web;

import org.link.shorter.domain.Link;
import org.link.shorter.domain.Tag;
import org.link.shorter.domain.User;
import org.link.shorter.services.LinkService;
import org.link.shorter.services.TagService;
import org.link.shorter.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Service;

import junit.framework.TestCase;

@Service
public class AppTest extends TestCase {
	@Autowired
	private UserService userService;

	@Autowired
	private LinkService linkService;

	@Autowired
	private TagService tagService;

	public void testApp() {
		GenericXmlApplicationContext apx = new GenericXmlApplicationContext();
		apx.load("spring/root-context.xml");
		apx.refresh();
		AppTest test = apx.getBean(AppTest.class);
		test.execTest();
		apx.close();

	}

	private void execTest() {
		User user = new User();
		user.setLogin("Ruslan");
		user.setPassword("123");
		userService.insertUser(user);
		Tag tag1 = new Tag();
		Tag tag2 = new Tag();
		tag1.setName("работа");
		tag2.setName("java");
		tagService.insertTag(tag1);
		tagService.insertTag(tag2);
		Link link = new Link();
		link.setFullLink("https://www.java.com/ru/download/");
		link.setDescription("Загрузить Java");
		link.setUser(user);
		link.addTag(tag1);
		link.addTag(tag2);
		linkService.insertLink(link);
	}
}
