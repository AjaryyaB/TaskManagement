package com.tms.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tms.dto.TaskDto;
import com.tms.entities.MEntity;
import com.tms.entities.Task;

public interface TaskRepository extends JpaRepository<Task, Long> {

	public List<Task> findByEntityId(MEntity enity);

	public Task findByTaskId(long task_id);
}
