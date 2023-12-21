package com.tms.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import com.tms.configuration.ModelMapperConfig;
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
	    List<MEntity> entities = entityRepository.findAll();

	    for (MEntity entity : entities) {
	        MEntityCardDto cardDto = new MEntityCardDto();
	        cardDto.setEntityId(entity.getEntityId());
	        cardDto.setEntityName(entity.getEntityName());

	        // Fetch tasks for the current entity from the Task repository
	        List<Task> entityTasks = repository.findByEntityId(entity);

	        // Initialize counts for each entity
	        long openCount = 0;
	        long inProgressCount = 0;
	        long overdueCount = 0;

	        // Calculate counts for different task statuses
	        for (Task task : entityTasks) {
	            if (task.getTaskStatus().equalsIgnoreCase("open")) {
	                openCount++;
	            } else if (task.getTaskStatus().equalsIgnoreCase("inProgress")) {
	            	inProgressCount++;
	            } else if (task.getTaskStatus().equalsIgnoreCase("overdue")) {
	            	overdueCount++;
	            }
	        }

	        // Set counts in the DTO
	        cardDto.setOpen(openCount);
	        cardDto.setInProgress(inProgressCount);
	        cardDto.setOverdue(overdueCount);

	        mEntities.add(cardDto);
	    }

	    return mEntities;
	}

	
	
}
