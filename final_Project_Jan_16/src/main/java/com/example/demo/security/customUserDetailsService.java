package com.example.demo.security;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class customUserDetailsService implements UserDetailsService {
	
	private PasswordEncoder passwordEncoder;
	
	public customUserDetailsService() {
		this.passwordEncoder = new BCryptPasswordEncoder();
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UserDetails userDetails = User.builder()
		.username("admin")
		.password(passwordEncoder.encode("admin"))
		.authorities("ROLE_USER") // admin에게 유저 권한을 줌. 로그인 주체가 admin뿐이라 커스텀 DB 사용 안함.
		.build();
		
		return userDetails;
	}

}
