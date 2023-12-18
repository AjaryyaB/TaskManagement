package com.tms.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tms.dto.AuthenticationDto;
import com.tms.dto.UserDto;
import com.tms.service.MUserService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/user")
@CrossOrigin(origins = "*")
public class MUserController {

	@Autowired
	private MUserService service;

	@RequestMapping("/authenticateUser")
	
	public ResponseEntity<Map<String, Object>> authenticateUser(@Valid @RequestBody AuthenticationDto authenticationDto) {
		
		
		Map<String, Object> validateUser = service.validateUser(authenticationDto.getUserName(),
				authenticationDto.getPassword());
		return ResponseEntity.ok(validateUser);
	}
	@RequestMapping("/createUser")
	@ResponseStatus(value = HttpStatus.CREATED)
	public UserDto createUser(@Valid @RequestBody UserDto userDto) {
		return service.createUser(userDto);
	}
}
