package com.tms.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_MTPriority")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskPriority {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long taskPriorityId;
	@Column(length = 50)
	private String taskPriorityName;
	@Column(length = 150)
	private String taskPriorityDesc;
}
