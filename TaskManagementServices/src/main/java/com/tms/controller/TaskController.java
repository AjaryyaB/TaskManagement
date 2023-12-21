package com.tms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tms.dto.GetTaskDto;
import com.tms.dto.TaskDto;
import com.tms.service.TaskService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/task")
@CrossOrigin(origins = "*")
public class TaskController {

	@Autowired
	private TaskService taskService;
	
	@PostMapping("/createTask")
	@ResponseStatus(value = HttpStatus.CREATED)
	public TaskDto createTask(@Valid @RequestBody TaskDto taskCreateDto) {
		return taskService.createTask(taskCreateDto);
	}
	
	@GetMapping("/getAllTaskByEntityId")
	@ResponseStatus(value = HttpStatus.OK)
	public List<GetTaskDto> getAllTaskByEntityId(@Valid @RequestParam long entity_id) {
		return taskService.getAllTaskByEntityId(entity_id);
	}
	
	
	
	@GetMapping("/getTaskById")
	@ResponseStatus(value = HttpStatus.OK)
	public GetTaskDto getTaskDetailsByTaskId(@Valid @RequestParam long task_id) {
		return taskService.getTaskDetailsByTaskId(task_id);
	}
	
	
}
