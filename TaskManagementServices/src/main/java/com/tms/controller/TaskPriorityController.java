package com.tms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tms.dto.TaskPriorityDto;
import com.tms.service.TaskPriorityService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/taskPriority")
@CrossOrigin(origins = "*")
public class TaskPriorityController {

	
	@Autowired
	private TaskPriorityService priorityService;
	
	@PostMapping("/createPriority")
	@ResponseStatus(value = HttpStatus.CREATED)
	public TaskPriorityDto createPriority(@Valid @RequestBody TaskPriorityDto dto ) {
		return priorityService.createTaskPriority(dto);
		
	}
}
