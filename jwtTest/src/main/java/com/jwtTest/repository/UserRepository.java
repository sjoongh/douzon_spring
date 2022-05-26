package com.jwtTest.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jwtTest.model.UserTbl;

public interface UserRepository extends JpaRepository<UserTbl, Long> {
	
	Optional<UserTbl> findByEmail(String email);
}
