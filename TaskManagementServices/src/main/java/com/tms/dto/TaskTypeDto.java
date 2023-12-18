package com.tms.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskTypeDto {

	private long taskTypeId;
	
	private String taskTypeName;
	
	private String taskTypeDesc;
}
