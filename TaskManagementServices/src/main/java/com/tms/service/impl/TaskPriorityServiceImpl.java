package com.tms.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.dto.TaskPriorityDto;
import com.tms.entities.TaskPriority;
import com.tms.repo.TaskPriorityRepository;
import com.tms.service.TaskPriorityService;

@Service
public class TaskPriorityServiceImpl implements TaskPriorityService {

	@Autowired
	private TaskPriorityRepository taskPriorityRepository;

	@Autowired
	private ModelMapper mapper;

	@Override
	public TaskPriorityDto createTaskPriority(TaskPriorityDto taskPriorityDto) {

		TaskPriority save = taskPriorityRepository.save(mapper.map(taskPriorityDto, TaskPriority.class));
		return mapper.map(save, TaskPriorityDto.class);
	}

}
