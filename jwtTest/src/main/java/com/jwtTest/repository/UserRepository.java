package com.jwtTest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jwtTest.model.UserTbl;

public interface UserRepository extends JpaRepository<UserTbl, Long> {

}
