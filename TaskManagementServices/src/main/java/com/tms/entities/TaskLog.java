package com.tms.entities;

import java.time.LocalDate;

import jakarta.persistence.Column;
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
	@Column(length = 50)
	private String taskLogName;
	
	private LocalDate taskLogDateAndTimeStamp;
	@Column(length = 50)
	private String taskLogSize;
	@Column(length = 50)
	private String taskLogType;
	@Column(length = 255)
	private String taskLogDetails;
	
}
