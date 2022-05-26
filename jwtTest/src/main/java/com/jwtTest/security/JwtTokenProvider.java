package com.jwtTest.security;

import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor // 필수 멤버변수만 갖는 생성자함수
public class JwtTokenProvider {
	
	private String secretKey = "kingsmile";
	// token 유효(만료)시간 : 30분
	private long tokenValidTime = 1000 * 60 * 30L;
	
//	private
	
	@PostConstruct
	protected void init() { // 객체 초기화, secretKey를 Base64로 인코딩
		secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
	}
	
	// JWT token create
	public String createToken(String userPk, List<String> roles) {
		
		Claims claims = Jwts.claims().setSubject(userPk); // JWT payload에 저장되는 정보 단위
		claims.put("roles", roles); // key,value 형태로 정보 저장
		Date now = new Date(); // 작성된 날짜
		
		return Jwts.builder()
				.setClaims(claims) // 정보저장
				.setIssuedAt(now) // 토큰 발행 시간
				.setExpiration(new Date(now.getTime() + tokenValidTime)) // 만료 시간 세팅
				.signWith(SignatureAlgorithm.HS256, secretKey) // 암호화 알고리즘 + secretKey = signature
				.compact();
	}
}
