package com.tms.controller;

import java.util.Date;
import java.util.HashMap;
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
	public ResponseEntity<Map<String, Object>> authenticateUser(
			@Valid @RequestBody AuthenticationDto authenticationDto) {
		Map<String, Object> result = new HashMap<>();
		boolean validateUser = service.validateUser(authenticationDto.getUserName(), authenticationDto.getPassword());

		if (validateUser) {
			result.put("message", "Login Successfull");
			result.put("timestamp", new Date());

			return ResponseEntity.ok(result);
		} else {
			result.put("message", "Invalid Credentials");
			result.put("timestamp", new Date());

			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(result);
		}

	}

	@RequestMapping("/createUser")
	public ResponseEntity<UserDto> createUser(@Valid @RequestBody UserDto userDto) {
		return new ResponseEntity<>(service.createUser(userDto), HttpStatus.CREATED);
	}
}
