package org.link.shorter.services;

import java.util.ArrayList;
import java.util.List;

import org.link.shorter.dao.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@SuppressWarnings("deprecation")
@Component("userServiceDetail")
@Transactional
public class UserServiceDetailImpl implements UserDetailsService {
	@Autowired
	private IUserDao userDao;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		org.link.shorter.domain.User user = userDao.getByName(userName);
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		GrantedAuthority grantedAuthority = new GrantedAuthorityImpl("ROLE_USER");
		authorities.add(grantedAuthority);
		UserDetails userDetail = new User(user.getLogin(), user.getPassword(), authorities);
		return userDetail;
	}

}
