package com.tms.service;

import java.util.Map;

import com.tms.dto.UserDto;

public interface MUserService {
	public Map<String, Object> validateUser(String userName, String password);
	
	UserDto createUser(UserDto dto);

}
