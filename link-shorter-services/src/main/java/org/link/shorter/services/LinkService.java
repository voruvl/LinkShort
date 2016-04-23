package org.link.shorter.services;

import java.util.List;
import java.util.Set;

import org.link.shorter.dao.ILinkDao;
import org.link.shorter.dao.ITagDao;
import org.link.shorter.domain.Link;
import org.link.shorter.domain.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("linkService")
@Transactional
public class LinkService {
	@Autowired
	private ILinkDao linkDao;

	@Autowired
	private ITagDao tagDao;

	public void insertLink(Link link) {
		linkDao.save(link);
	}

	public List<Link> getLinks() {
		return linkDao.findAll();
	}

	public Link getLinkById(Long id) {
		return linkDao.findById(id);
	}

	public Link getLinkByShortLink(String shortLink) {
		return linkDao.getLinkByShortLink(shortLink);
	}

	public void updateLink(Link link) {
		linkDao.save(link);
	}

	public void linkAddTag(Long linkId, Long tagId) {
		Link link = linkDao.findById(linkId);
		Tag tag = tagDao.findById(tagId);
		link.addTag(tag);
		linkDao.save(link);
	}

	public void linkRemoveTag(Long linkId, Long tagId) {
		Link link = linkDao.findById(linkId);
		Tag tag = tagDao.findById(tagId);
		link.removeTag(tag);
		linkDao.save(link);
	}

	public Set<Link> getListLink(Long tagId) {
		Tag tag = tagDao.findById(tagId);
		return tag.getLinks();
	}

	public ILinkDao getLinkDao() {
		return linkDao;
	}

	public void setLinkDao(ILinkDao linkDao) {
		this.linkDao = linkDao;
	}

}