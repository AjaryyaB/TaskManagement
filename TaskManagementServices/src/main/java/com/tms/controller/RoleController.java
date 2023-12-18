package com.tms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.tms.dto.RoleDto;
import com.tms.service.MRoleService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/role")
@CrossOrigin(origins = "*")
public class RoleController {

	@Autowired
	private MRoleService mRoleService;

	@PostMapping("/createRole")
	@ResponseStatus(value = HttpStatus.CREATED)
	public RoleDto createGroup(@Valid @RequestBody RoleDto roleDto) {
		return mRoleService.createRole(roleDto);
	}
}
