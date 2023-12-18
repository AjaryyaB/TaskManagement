package com.tms.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.dto.TaskTypeDto;
import com.tms.entities.TaskType;
import com.tms.repo.TaskTypeRepository;
import com.tms.service.TaskTypeService;

@Service
public class TaskTypeServiceImpl implements TaskTypeService {

	@Autowired
	private TaskTypeRepository taskTypeRepository;

	@Autowired
	private ModelMapper mapper;

	@Override
	public TaskTypeDto createTaskType(TaskTypeDto taskTypeDto) {
		TaskType taskType = taskTypeRepository.save(mapper.map(taskTypeDto, TaskType.class));

		return mapper.map(taskType, TaskTypeDto.class);
	}

}
