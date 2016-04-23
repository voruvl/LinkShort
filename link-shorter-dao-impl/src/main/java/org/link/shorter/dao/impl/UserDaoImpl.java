package org.link.shorter.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.link.shorter.dao.IUserDao;
import org.link.shorter.domain.User;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl extends DaoImpl<User> implements IUserDao {
	public UserDaoImpl() {
		super();
		clazz = User.class;
	}

	@Override
	public User getByName(String name) {
		Criteria criteria = getSessionFactory().getCurrentSession().createCriteria(clazz)
				.add(Restrictions.eq("login", name));
		return (User) criteria.uniqueResult();
	}
}