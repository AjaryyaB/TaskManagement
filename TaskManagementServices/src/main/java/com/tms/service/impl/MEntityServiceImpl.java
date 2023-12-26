package com.tms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.tms.configuration.ModelMapperConfig;
import com.tms.dto.GetTaskDto;
import com.tms.dto.MEntityCardDto;
import com.tms.dto.MEntityDto;
import com.tms.entities.MEntity;
import com.tms.entities.Task;
import com.tms.repo.MEntityRepository;
import com.tms.repo.TaskRepository;
import com.tms.service.MEntityService;

@Service

public class MEntityServiceImpl implements MEntityService {

	@Autowired
	private MEntityRepository entityRepository;
	
	@Autowired
	private TaskRepository repository;
	
	ModelMapperConfig config = new ModelMapperConfig();

	@Override
	public List<MEntityDto> getAllMEntities() {
		List<MEntity> entities = entityRepository.findAll();

		// Initialize ModelMapper
		ModelMapper mapper = config.mapper();

		// Perform mapping using Java 8 Stream API
		List<MEntityDto> entityDtos = entities.stream().map(entity -> mapper.map(entity, MEntityDto.class))
				.collect(Collectors.toList());
		

		return entityDtos;
	}


	@Override
	public List<MEntityCardDto> getAllMEntitiesWithTaskCount() {
	    List<MEntityCardDto> mEntities = new ArrayList<>();
	    
	    try {
	        List<MEntity> entities = entityRepository.findAll();
	        
	        for (MEntity entity : entities) {
	            MEntityCardDto cardDto = new MEntityCardDto();
	            cardDto.setEntityId(entity.getEntityId());
	            cardDto.setEntityName(entity.getEntityName());

	            // Fetch tasks for the current entity from the Task repository
	            List<Task> entityTasks = repository.findByEntityId(entity);
	            
	            List<Task> groupEntityTasks = repository.findAll().stream()
						.filter(task -> task.getGroupId() != null && task.getGroupId().getEntities().stream()
						.anyMatch(groupEntity -> groupEntity.getEntityId() == entity.getEntityId())).collect(Collectors.toList());

	            // Initialize counts for each entity
	            long openCount = countTasksByStatus(entityTasks, "open") +
	                             countTasksByStatus(groupEntityTasks, "open");

	            long inProgressCount = countTasksByStatus(entityTasks, "inProgress") +
	                                   countTasksByStatus(groupEntityTasks, "inProgress");

	            long overdueCount = countTasksByStatus(entityTasks, "overdue") +
	                                countTasksByStatus(groupEntityTasks, "overdue");

	            // Set counts in the DTO
	            cardDto.setOpen(openCount);
	            cardDto.setInProgress(inProgressCount);
	            cardDto.setOverdue(overdueCount);

	            mEntities.add(cardDto);
	        }
	    } catch (Exception e) {
	        // Handle exceptions appropriately (logging, error reporting, etc.)
	        e.printStackTrace();
	        // Throw or handle the exception as per your application's error handling strategy
	    }

	    return mEntities;
	}

	private long countTasksByStatus(List<Task> tasks, String status) {
	    return tasks.stream()
	                .filter(task -> task.getTaskStatus().equalsIgnoreCase(status))
	                .count();
	}


	
	
}
