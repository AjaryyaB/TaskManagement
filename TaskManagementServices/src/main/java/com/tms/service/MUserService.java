package com.tms.service;

import com.tms.dto.UserDto;

public interface MUserService {
	public boolean validateUser(String userName, String password);
	
	UserDto createUser(UserDto dto);

}
