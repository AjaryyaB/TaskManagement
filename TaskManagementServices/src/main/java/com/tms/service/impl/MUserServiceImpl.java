package com.tms.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tms.dto.UserDto;
import com.tms.entities.MEntity;
import com.tms.entities.MRole;
import com.tms.entities.MUser;
import com.tms.exception.EntityNotFound;
import com.tms.exception.RoleNotFound;
import com.tms.exception.UserNameNotFoundException;
import com.tms.repo.MEntityRepository;
import com.tms.repo.MRoleRepository;
import com.tms.repo.MUserRepository;
import com.tms.service.MUserService;

@Service
public class MUserServiceImpl implements MUserService {

	@Autowired
	private MUserRepository mUserRepository;
	@Autowired
	private MEntityRepository mEntityRepository;
	@Autowired
	private MRoleRepository mRoleRepository;

	@Override
	public boolean validateUser(String userName, String password) {
		
		boolean isValid = false;
		try {
			MUser muser = mUserRepository.findByUserName(userName)
					.orElseThrow(() -> new UserNameNotFoundException("UserName not found..!"));

			if (muser.getUserName().equals(userName) && muser.getPassword().equals(password)) {

				isValid = true;
			} else {
				isValid = false;
			}
		} catch (UserNameNotFoundException e) {
			
		} catch (Exception e) {
			
		}

		return isValid;
	}

	@Override
	public UserDto createUser(UserDto dto) {
		MUser mUser = new MUser();
		if(dto!=null) {
			mUser.setFullName(dto.getFullName());
			mUser.setPassword(dto.getPassword());
			mUser.setUserName(dto.getUserName());
			mUser.setCreateDate(dto.getCreateDate());
			mUser.setMobile(dto.getMobile());
			mUser.setStatus(dto.getStatus());
			mUser.setEmail(dto.getEmail());

			if (dto.getRole() != null) {
				MRole mRole = mRoleRepository.findById(Long.parseLong(dto.getRole()))
						.orElseThrow(() -> new RoleNotFound("Role Not Found"));
				mUser.setRoleId(mRole);
				dto.setRole(mRole.getRoleName());
			} else {
				mUser.setRoleId(null);
				dto.setRole(null);
			}

			if (dto.getEntity() != null) {
				MEntity mEntity = mEntityRepository.findById(Long.parseLong(dto.getEntity()))
						.orElseThrow(() -> new EntityNotFound("Entity Not Found"));
				mUser.setEntityId(mEntity);
				dto.setEntity(mEntity.getEntityName());

			} else {
				mUser.setEntityId(null);
				dto.setEntity(null);
			}
			mUserRepository.save(mUser);
			dto.setUserId(mUser.getUserId());
		}
		

		return dto;
	}
}
