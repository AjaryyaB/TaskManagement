package com.tms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tms.dto.GroupCreateDto;
import com.tms.service.GroupService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/group")
@CrossOrigin(origins = "*")
public class GroupController {

	
	@Autowired
	private GroupService groupService;
	
	@PostMapping("/createGroup")
	@ResponseStatus(value = HttpStatus.CREATED)
	public GroupCreateDto createGroup(@Valid @RequestBody GroupCreateDto createDto) {
		return groupService.createGroup(createDto);
	}
}
