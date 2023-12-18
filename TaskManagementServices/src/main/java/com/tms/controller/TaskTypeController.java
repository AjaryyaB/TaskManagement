package com.tms.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tms.dto.TaskTypeDto;
import com.tms.service.TaskTypeService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/taskType")
public class TaskTypeController {

	@Autowired
	private TaskTypeService taskTypeService;

	@PostMapping("/createTaskType")
	@ResponseStatus(value = HttpStatus.CREATED)
	public TaskTypeDto createTaskType(@Valid @RequestBody TaskTypeDto taskTypeDto) {
		return taskTypeService.createTaskType(taskTypeDto);
	}
}
