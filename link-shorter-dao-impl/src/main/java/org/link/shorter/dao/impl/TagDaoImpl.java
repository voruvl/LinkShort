package org.link.shorter.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.link.shorter.dao.ITagDao;
import org.link.shorter.domain.Tag;
import org.springframework.stereotype.Repository;

@Repository("tagDao")
public class TagDaoImpl extends DaoImpl<Tag> implements ITagDao {
	public TagDaoImpl() {
		super();
		clazz = Tag.class;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tag> findAll() {
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(clazz);
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
	}
}