package com.tms.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.dto.GetTaskDto;
import com.tms.dto.TaskDto;
import com.tms.entities.GroupEntity;
import com.tms.entities.MEntity;
import com.tms.entities.MRole;
import com.tms.entities.MUser;
import com.tms.entities.Task;
import com.tms.entities.TaskPriority;
import com.tms.entities.TaskType;
import com.tms.repo.GroupRepository;
import com.tms.repo.MEntityRepository;
import com.tms.repo.MRoleRepository;
import com.tms.repo.MUserRepository;
import com.tms.repo.TaskLogRepository;
import com.tms.repo.TaskPriorityRepository;
import com.tms.repo.TaskRepository;
import com.tms.repo.TaskTypeRepository;
import com.tms.service.TaskService;

@Service
public class TaskServiceImpl implements TaskService {

	@Autowired
	private TaskRepository taskRepository;

	@Autowired
	private MUserRepository mUserRepository;
	@Autowired
	private TaskTypeRepository taskTypeRepository;
	@Autowired
	private GroupRepository groupRepository;
	@Autowired
	private MRoleRepository mRoleRepository;
	@Autowired
	private MEntityRepository mEntityRepository;
	@Autowired
	private TaskLogRepository taskLogRepository;
	@Autowired
	private TaskPriorityRepository taskPriorityRepository;

	@Override
	public TaskDto createTask(TaskDto createDto) {

		Task task = new Task();
		if (createDto!=null && createDto.getIsGroup()) {
			if (createDto.getGroup() != null) {
				Optional<GroupEntity> group = groupRepository.findById(Long.parseLong(createDto.getGroup()));
				task.setGroupId(group.get());
			}
		} else {
			if (createDto.getEntity() != null) {
				Optional<MEntity> entity = mEntityRepository.findById(Long.parseLong(createDto.getEntity()));
				task.setEntityId(entity.get());
			}
		}

		if (createDto.getTaskAssignUser() != null) {
			Optional<MUser> mUser = mUserRepository.findById(Long.parseLong(createDto.getTaskAssignUser()));
			task.setTaskAssignUserId(mUser.get());

		}
		if (createDto.getTaskPriority() != null) {
			Optional<TaskPriority> taskPriority = taskPriorityRepository
					.findById(Long.parseLong(createDto.getTaskPriority()));
			task.setTaskPriorityId(taskPriority.get());
		}
		if (createDto.getTaskRole() != null) {
			Optional<MRole> mRole = mRoleRepository.findById(Long.parseLong(createDto.getTaskRole()));
			task.setTaskRoleId(mRole.get());
		}
		if (createDto.getTaskType() != null) {
			Optional<TaskType> taskType = taskTypeRepository.findById(Long.parseLong(createDto.getTaskType()));
			task.setTaskTypeId(taskType.get());
		}

		task.setTargetDate(createDto.getTargetDate());
		task.setTaskAttachments(createDto.getTaskAttachments());
		task.setTaskConfiFlag(createDto.getTaskConfiFlag());
		task.setTaskDesc(createDto.getTaskDesc());
		task.setTaskEndDate(createDto.getTaskEndDate());
		task.setTaskName(createDto.getTaskName());
		task.setTaskStatus(createDto.getTaskStatus());
		task.setTaskStartDate(createDto.getTaskStartDate());
		task.setTaskNotes(createDto.getTaskNotes());

		Task save = taskRepository.save(task);
		createDto.setTaskId(save.getTaskId());
		return createDto;
	}

	@Override
	public List<GetTaskDto> getAllTaskByEntityId(long entity_id) {
		MEntity entity = mEntityRepository.findById(entity_id).orElse(null);

		List<GetTaskDto> tasksForEntity = taskRepository.findAll().stream().filter(task -> {
			MEntity taskEntity = task.getEntityId();
			return (taskEntity != null && taskEntity.getEntityId() == entity_id);
		}).map(this::mapToGetAllTaskDto).collect(Collectors.toList());

		List<GetTaskDto> tasksForGroupEntities = taskRepository.findAll().stream()
				.filter(task -> task.getGroupId() != null && task.getGroupId().getEntities().stream()
						.anyMatch(groupEntity -> groupEntity.getEntityId() == entity_id))
				.map(this::mapToGetAllTaskDto).collect(Collectors.toList());

		tasksForEntity.addAll(tasksForGroupEntities);

		return tasksForEntity;
	}

	private GetTaskDto mapToGetAllTaskDto(Task task) {
		GetTaskDto taskDto = new GetTaskDto();
		taskDto.setTaskId(task.getTaskId());
		taskDto.setTaskName(task.getTaskName());
		taskDto.setTaskDesc(task.getTaskDesc());

		MUser taskAssignUser = task.getTaskAssignUserId();
		if (taskAssignUser != null) {
			taskDto.setTaskAssignUserName(taskAssignUser.getUserName());
			taskDto.setTaskAssignUserDesignation(taskAssignUser.getDesignation());
			taskDto.setMobile(taskAssignUser.getMobile());
		}

		taskDto.setTaskEndDate(task.getTaskEndDate());

		TaskPriority taskPriority = task.getTaskPriorityId();
		if (taskPriority != null) {
			taskDto.setPriority(taskPriority.getTaskPriorityName());
		}

		return taskDto;
	}

	@Override
	public GetTaskDto getTaskDetailsByTaskId(long task_id) {
		// TODO Auto-generated method stub
		Task task = taskRepository.findById(task_id).get();
		GetTaskDto getTaskDto = new GetTaskDto();
		getTaskDto.setTaskId(task.getTaskId());
		getTaskDto.setTaskName(task.getTaskName());
		getTaskDto.setTaskDesc(task.getTaskDesc());
		getTaskDto.setTaskAssignUserName(task.getTaskAssignUserId().getUserName());
		getTaskDto.setMobile(task.getTaskAssignUserId().getMobile());

		getTaskDto.setPriority(task.getTaskPriorityId().getTaskPriorityName());
		getTaskDto.setTaskAssignUserDesignation(task.getTaskAssignUserId().getDesignation());
		getTaskDto.setTaskEndDate(task.getTaskEndDate());

		return getTaskDto;
	}

}
