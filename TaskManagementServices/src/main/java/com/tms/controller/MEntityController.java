package com.tms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.tms.dto.MEntityCardDto;
import com.tms.dto.MEntityDto;
import com.tms.service.MEntityService;

@RestController
@RequestMapping("/mentity")
@CrossOrigin(origins = "*")
public class MEntityController {
	
	@Autowired
	private MEntityService entityService;
	
	@RequestMapping("/getAllMEntities")
	public List<MEntityDto> getAllMEntities(){
		List<MEntityDto> allMEntities = entityService.getAllMEntities();
		return allMEntities;
	}
	@RequestMapping("/getAllMEntitiesWithTaskCount")
	public List<MEntityCardDto> getAllMEntitiesWithTaskCount(){
		
		return entityService.getAllMEntitiesWithTaskCount();
	}

}
