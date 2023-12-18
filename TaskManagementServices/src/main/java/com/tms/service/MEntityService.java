package com.tms.service;


import java.util.List;

import com.tms.dto.MEntityCardDto;
import com.tms.dto.MEntityDto;

public interface MEntityService {
	
	 public List<MEntityDto> getAllMEntities(); 
	 
	 public List<MEntityCardDto> getAllMEntitiesWithTaskCount();

}
