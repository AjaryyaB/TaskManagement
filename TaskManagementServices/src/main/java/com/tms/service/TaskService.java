package com.tms.service;

import java.util.List;

import com.tms.dto.GetAllTaskDto;
import com.tms.dto.TaskDto;

public interface TaskService {

	TaskDto createTask(TaskDto createDto);
	
	

	List<GetAllTaskDto> getAllTaskByEntityId(long entity_id);
	
}
