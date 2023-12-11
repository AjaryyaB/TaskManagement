package com.tms.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_Task")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Task {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long taskId;

	private String taskName;

	private String taskDesc;

	private String taskStartDate;

	private String taskEndDate;

	private String taskStatus;

	private String taskNotes;

	private String taskAttachments;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private MUser taskAssignUserId;

	@ManyToOne
	@JoinColumn(name = "task_type_id")
	private TaskType taskTypeId;

	@ManyToOne
	@JoinColumn(name = "task_priority_id")
	private TaskPriority taskPriorityId;

	private String targetDate;

	private String taskConfiFlag;

	@ManyToOne
	@JoinColumn(name = "group_id")
	private GroupEntity groupId;

	private long taskRoleId;

	@ManyToOne
	@JoinColumn(name = "entity_id")
	private MEntity entityId;

	@OneToOne
	@JoinColumn(name = "task_log_id")
	private TaskLog taskLogId;
}
