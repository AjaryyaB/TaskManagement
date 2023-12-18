package com.tms.entities;

import java.time.LocalDate;

import jakarta.persistence.Column;
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
	@Column(length = 50)
	private String taskName;
	@Column(length = 150)
	private String taskDesc;

	private LocalDate taskStartDate;

	private LocalDate taskEndDate;
	@Column(length = 15)
	private String taskStatus;
	@Column(length = 150)
	private String taskNotes;
	@Column(length = 50)
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

	private LocalDate targetDate;

	private Boolean taskConfiFlag;

	@ManyToOne
	@JoinColumn(name = "group_id")
	private GroupEntity groupId;
	
	@ManyToOne
	@JoinColumn(name = "role_id")
	private MRole taskRoleId;

	@ManyToOne
	@JoinColumn(name = "entity_id")
	private MEntity entityId;

	@OneToOne
	@JoinColumn(name = "task_log_id")
	private TaskLog taskLogId;
}
