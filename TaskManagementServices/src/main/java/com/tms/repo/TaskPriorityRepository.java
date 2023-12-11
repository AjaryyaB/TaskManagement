package com.tms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tms.entities.TaskPriority;

public interface TaskPriorityRepository extends JpaRepository<TaskPriority, Long> {

}
