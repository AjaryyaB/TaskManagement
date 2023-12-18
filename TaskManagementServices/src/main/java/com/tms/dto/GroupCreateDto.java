package com.tms.dto;

import java.time.LocalDate;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupCreateDto {

	private long groupId;

	private String groupName;

	private String groupDesc;

	private LocalDate groupStartDate;

	private LocalDate groupEndDate;

	private String groupStatus;

	private List<Long> entitiesId;
}
