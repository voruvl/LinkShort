package org.link.shorter.services;

import java.util.List;

import org.link.shorter.dao.IUserDao;
import org.link.shorter.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserService {

	@Autowired
	private IUserDao userDao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public void insertUser(User user) {
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		userDao.save(user);
	}

	public List<User> getUsers() {

		return userDao.findAll();
	}

	public User getUserByname(String name) {
		return userDao.getByName(name);
	}
}