package com.tms.service;

import java.util.List;

import com.tms.dto.GetTaskDto;
import com.tms.dto.TaskDto;

public interface TaskService {

	TaskDto createTask(TaskDto createDto);

	List<GetTaskDto> getAllTaskByEntityId(long entity_id);
	
	GetTaskDto getTaskDetailsByTaskId(long task_id);

}
