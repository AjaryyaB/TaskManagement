package com.tms.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleDto {

	private long roleId;

	private String roleName;
	private String roleDesc;

	private LocalDate roleCrDate;

	private LocalDate roleEnDate;

}
