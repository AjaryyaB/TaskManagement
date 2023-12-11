package com.tms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tms.entities.MUser;

public interface MUserRepository extends JpaRepository<MUser, Long>{

}
