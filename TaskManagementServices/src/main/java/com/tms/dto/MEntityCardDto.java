package com.tms.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MEntityCardDto {

	private long entityId;
	
	private String entityName;
	
	private long open;
	
	private long inProgress;
	
	private long overdue;

}
