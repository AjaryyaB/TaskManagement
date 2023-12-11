package com.tms.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tms.entities.TaskLog;

public interface TaskLogRepository extends JpaRepository<TaskLog, Long> {

}
