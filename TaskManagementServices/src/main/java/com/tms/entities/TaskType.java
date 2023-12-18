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

@Entity(name = "tbl_MTaskType")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TaskType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long taskTypeId;
	@Column(length = 50)
	private String taskTypeName;
	@Column(length = 150)
	private String taskTypeDesc;

}
