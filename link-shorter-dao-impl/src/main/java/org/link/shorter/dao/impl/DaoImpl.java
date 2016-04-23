package org.link.shorter.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.link.shorter.dao.IDao;
import org.springframework.beans.factory.annotation.Autowired;


public class DaoImpl<T> implements IDao<T> {

	protected Class<T> clazz;

	@Autowired
	protected SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public T findById(Long id) {
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(clazz)
				.add(Restrictions.eq("id", id));
		return (T) criteria.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> findAll() {
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(clazz);
		return criteria.list();
	}

	@Override
	public void save(T entity) {
		getSessionFactory().getCurrentSession().saveOrUpdate(entity);

	}

	@Override
	public void delete(T entity) {
		getSessionFactory().getCurrentSession().delete(entity);

	}

	@Override
	public void deleteById(Long entityId) {
		T find = findById(entityId);
		delete(find);

	}

}