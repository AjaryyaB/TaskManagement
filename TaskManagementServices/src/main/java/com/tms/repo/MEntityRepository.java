package com.tms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tms.entities.MEntity;

public interface MEntityRepository extends JpaRepository<MEntity, Long> {

}
