package org.link.shorter.dao;

import org.link.shorter.domain.Link;

public interface ILinkDao extends IDao<Link> {

	public Link getLinkByShortLink(String shortLink);
}