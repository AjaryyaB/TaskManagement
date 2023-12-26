package com.tms.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
	
	private long userId;

	private String userName;

	private String password;

	private String fullName;

	private LocalDate createDate;

	private String status;

	private String role;

	private String entity;
	
	private String email;
	
	private String designation;
	
	private boolean defaultUser;
//	private LocalDate endDate;

	private Long mobile;
}
