package com.tms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.dto.GetAllTaskDto;
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

		if (createDto.getEntity() != null) {
			Optional<MEntity> entity = mEntityRepository.findById(Long.parseLong(createDto.getEntity()));
			task.setEntityId(entity.get());
		}

		if (createDto.getGroup() != null) {
			Optional<GroupEntity> group = groupRepository.findById(Long.parseLong(createDto.getGroup()));
			task.setGroupId(group.get());
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
//		createDto.setEntity(task.getEntityId().getEntityId());
		return createDto;
	}

//	@Override
//	public List<GetAllTaskDto> getAllTaskByEntityId(long entity_id) {
//
//		List<GetAllTaskDto> list2 = taskRepository.findAll().stream()
//				.filter(task -> task.getEntityId().getEntityId() == entity_id).map(task -> {
//					GetAllTaskDto taskDto = new GetAllTaskDto();
//					taskDto.setTaskId(task.getTaskId());
//					taskDto.setTaskName(task.getTaskName());
//					taskDto.setTaskDesc(task.getTaskDesc());
//					taskDto.setTaskAssignUserName(task.getTaskAssignUserId().getUserName());
//					taskDto.setTaskAssignUserDesignation(task.getTaskAssignUserId().getDesignation());
//					taskDto.setTaskEndDate(task.getTaskEndDate());
//					taskDto.setPriority(task.getTaskPriorityId().getTaskPriorityName());
//
//					return taskDto;
//				}).toList();
//
//		return list2;
//	}
//	@Override
//	public List<GetAllTaskDto> getAllTaskByEntityId(long entity_id) {
//
//	    List<GetAllTaskDto> list2 = taskRepository.findAll().stream()
//	            .filter(task -> {
//	                MEntity taskEntity = task.getEntityId();
//	                return taskEntity != null && taskEntity.getEntityId() == entity_id;
//	            })
//	            .map(task -> {
//	                GetAllTaskDto taskDto = new GetAllTaskDto();
//	                taskDto.setTaskId(task.getTaskId());
//	                taskDto.setTaskName(task.getTaskName());
//	                taskDto.setTaskDesc(task.getTaskDesc());
//
//	                MUser taskAssignUser = task.getTaskAssignUserId();
//	                if (taskAssignUser != null) {
//	                    taskDto.setTaskAssignUserName(taskAssignUser.getUserName());
//	                    taskDto.setTaskAssignUserDesignation(taskAssignUser.getDesignation());
//	                }
//
//	                taskDto.setTaskEndDate(task.getTaskEndDate());
//
//	                TaskPriority taskPriority = task.getTaskPriorityId();
//	                if (taskPriority != null) {
//	                    taskDto.setPriority(taskPriority.getTaskPriorityName());
//	                }
//
//	                return taskDto;
//	            })
//	            .collect(Collectors.toList());
//
//	    return list2;
//	}

	@Override
	public List<GetAllTaskDto> getAllTaskByEntityId(long entity_id) {
	    MEntity entity = mEntityRepository.findById(entity_id).orElse(null);

	    List<GetAllTaskDto> tasksForEntity = taskRepository.findAll().stream()
	            .filter(task -> {
	                MEntity taskEntity = task.getEntityId();
	                return (taskEntity != null && taskEntity.getEntityId() == entity_id)
	                        || (entity != null && entity.getGroup_entities() != null && entity.getGroup_entities().stream()
	                                .anyMatch(group -> group.getEntities().contains(taskEntity)));
	            })
	            .map(task -> {
	                GetAllTaskDto taskDto = new GetAllTaskDto();
	                taskDto.setTaskId(task.getTaskId());
	                taskDto.setTaskName(task.getTaskName());
	                taskDto.setTaskDesc(task.getTaskDesc());

	                MUser taskAssignUser = task.getTaskAssignUserId();
	                if (taskAssignUser != null) {
	                    taskDto.setTaskAssignUserName(taskAssignUser.getUserName());
	                    taskDto.setTaskAssignUserDesignation(taskAssignUser.getDesignation());
	                }

	                taskDto.setTaskEndDate(task.getTaskEndDate());

	                TaskPriority taskPriority = task.getTaskPriorityId();
	                if (taskPriority != null) {
	                    taskDto.setPriority(taskPriority.getTaskPriorityName());
	                }

	                return taskDto;
	            })
	            .collect(Collectors.toList());

	    return tasksForEntity;
	}

}
