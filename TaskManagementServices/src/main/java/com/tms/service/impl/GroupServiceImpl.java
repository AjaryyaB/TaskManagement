package com.tms.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.dto.GroupCreateDto;
import com.tms.dto.MEntityDto;
import com.tms.entities.GroupEntity;
import com.tms.entities.MEntity;
import com.tms.repo.GroupRepository;
import com.tms.repo.MEntityRepository;
import com.tms.service.GroupService;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupRepository groupRepository;

	@Autowired
	private MEntityRepository mEntityRepository;

	@Override
	public GroupCreateDto createGroup(GroupCreateDto createDto) {
		// TODO Auto-generated method stub
		GroupEntity groupEntity = new GroupEntity();
		groupEntity.setGroupId(createDto.getGroupId());
		groupEntity.setGroupName(createDto.getGroupName());
		groupEntity.setGroupDesc(createDto.getGroupDesc());
		groupEntity.setGroupStatus(createDto.getGroupStatus());
		groupEntity.setGroupStartDate(createDto.getGroupStartDate());
		groupEntity.setGroupEndDate(createDto.getGroupEndDate());

		List<Long> mEntityIds = createDto.getEntitiesId();

		if (mEntityIds != null && !mEntityIds.isEmpty()) {
			List<MEntity> associatedEntities = mEntityRepository.findAll().stream()
					.filter(entity -> mEntityIds.contains(entity.getEntityId())).toList();

			for (MEntity entity : associatedEntities) {
				entity.getGroup_entities().add(groupEntity);
			}

			groupEntity.setEntities(associatedEntities);
		}
		
		groupRepository.save(groupEntity);

		return createDto;

	}
}
