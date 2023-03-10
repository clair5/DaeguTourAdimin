package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class webSecurityConfig {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

		http.formLogin().loginPage("/login");
		http.csrf().disable();

		// csrf 토큰을 비활성화 함. 기존에 작성된 post 방식의 코드를 모두 수정해야해서 이 프로젝트에선 사용하지 않기로 함. 
		// 좀 더 공부해보기.
		// 비활성화하게 되면 username과 password만으로 로그인이 가능해짐.

		return http.build();
	}

	@Bean
	public WebSecurityCustomizer webSecurityCustomizer() {

		return (web) -> web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
		// css 등 정적 자원을 스프링 시큐리티 적용에서 제외시킴
	}

}
