package com.jwtTest.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jwtTest.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

}
