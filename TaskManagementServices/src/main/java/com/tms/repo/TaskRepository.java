package com.tms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tms.entities.Task;

public interface TaskRepository extends JpaRepository<Task, Long> {

}
