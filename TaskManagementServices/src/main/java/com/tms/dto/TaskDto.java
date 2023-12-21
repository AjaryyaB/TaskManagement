package com.tms.dto;

import java.time.LocalDate;

import com.tms.entities.GroupEntity;
import com.tms.entities.MEntity;
import com.tms.entities.MRole;
import com.tms.entities.MUser;
import com.tms.entities.Task;
import com.tms.entities.TaskLog;
import com.tms.entities.TaskPriority;
import com.tms.entities.TaskType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TaskDto {

	private long taskId;
	private String taskName;
	private String taskDesc;

	private LocalDate taskStartDate;

	private LocalDate taskEndDate;
	private String taskStatus;
	private String taskNotes;
	private String taskAttachments;

	private String taskAssignUser;

	private String taskType;

	private String taskPriority;

	private LocalDate targetDate;

	private Boolean taskConfiFlag;

	private String group;
	
	private Boolean isGroup;

	private String taskRole;

	private String entity;

	private String taskLog;
}
