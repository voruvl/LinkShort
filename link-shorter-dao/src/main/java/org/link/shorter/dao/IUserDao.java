package org.link.shorter.dao;

import org.link.shorter.domain.User;

public interface IUserDao extends IDao<User> {
	
	public User getByName(String name);
}