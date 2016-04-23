package org.link.shorter.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.link.shorter.dao.ILinkDao;
import org.link.shorter.domain.Link;
import org.springframework.stereotype.Repository;

@Repository("linkDao")

public class LinkDaoImpl extends DaoImpl<Link> implements ILinkDao {
	public LinkDaoImpl() {
		super();
		clazz = Link.class;
	}

	@Override
	public Link getLinkByShortLink(String shortLink) {
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(clazz)
				.add(Restrictions.eq("shortLink", shortLink));
		return (Link) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Link> findAll() {
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(clazz);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
}