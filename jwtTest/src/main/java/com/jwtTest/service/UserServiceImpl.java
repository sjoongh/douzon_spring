package com.jwtTest.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.jwtTest.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserDetailsService {
	
	private final UserRepository userRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		return (UserDetails) userRepository.findByEmail(username)
				.orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다."));
		
//		return (UserDetails) userRepository.findById(Long.parseLong(username))
//				.orElseThrow(() -> new UsernameNotFoundException("사용자를 찾을 수 없습니다."));
	}
}