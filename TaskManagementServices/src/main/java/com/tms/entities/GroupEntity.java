package com.tms.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_MGroup")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class GroupEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long groupId;
	
	private String groupName;
	
	private String groupDesc;
	
	private String groupStartDate;
	
	private String groupEndDate;
	
	private String groupStatus;
	
	@ManyToOne
	@JoinColumn(name = "entity_id")
	private MEntity groupEntityId;
	
	
}
