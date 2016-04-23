package org.link.shorter.services;

import java.util.List;
import java.util.Set;

import org.link.shorter.dao.ITagDao;
import org.link.shorter.domain.Link;
import org.link.shorter.domain.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("tagService")
@Transactional
public class TagService {
	@Autowired
	private ITagDao tagDao;

	public List<Tag> getTags() {

		return tagDao.findAll();
	}

	public Tag getTagById(Long id) {

		return tagDao.findById(id);
	}

	public void insertTag(Tag tag) {

		tagDao.save(tag);
	}

	public Set<Tag> getListTag(Link link) {
		Set<Tag> tags = link.getTags();
		return tags;
	}
}