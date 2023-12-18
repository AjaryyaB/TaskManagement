package com.tms.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;


import com.tms.entities.MUser;

public interface MUserRepository extends JpaRepository<MUser, Long>{
	Optional<MUser> findByUserName(String email);
}
