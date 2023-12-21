package com.tms.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GetTaskDto {
	private long taskId;
	private String taskName;
	private String taskDesc;
	private String taskAssignUserName;
	private String priority;
	private String taskAssignUserDesignation;
	private LocalDate taskEndDate;	
	private long mobile;
}
