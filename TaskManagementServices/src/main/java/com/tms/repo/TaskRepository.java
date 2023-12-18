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

//	@Query("SELECT task from Task task WHERE task.entityId.entityId= :entity_id")
//	List<Task> getAllTaskByEntityId(@Param("entity_id") long entity_id);
//	
//	@Query("SELECT task FROM Task task WHERE task.entityId.entityId = :entityId")
//	List<Task> getAllTaskByEntityId(@Param("entityId") long entityId);
}
