package com.tms.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_Tasklog")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskLog {

	@Id
	@GeneratedValue(strategy =  GenerationType.IDENTITY)
	private long taskLogId;
	
	private String taskLogName;
	
	private String taskDateAndTimeStamp;
	
	private String taskLogSize;
	
	private String taskLogType;
	
	private String taskLogDetails;
	
}
