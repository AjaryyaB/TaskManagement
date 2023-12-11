package com.tms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tms.entities.GroupEntity;

public interface GroupRepository extends JpaRepository<GroupEntity, Long> {

}
