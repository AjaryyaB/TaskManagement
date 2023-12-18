package com.tms.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.dto.RoleDto;
import com.tms.entities.MRole;
import com.tms.repo.MRoleRepository;
import com.tms.service.MRoleService;
@Service
public class MRoleServiceImpl implements MRoleService {
	
	@Autowired
	private MRoleRepository  mRoleRepository;
	
	@Autowired
	private ModelMapper mapper;

	@Override
	public RoleDto createRole(RoleDto roleDto) {
		MRole save = mRoleRepository.save(mapper.map(roleDto, MRole.class));
		return mapper.map(save, RoleDto.class);		
	}

}
