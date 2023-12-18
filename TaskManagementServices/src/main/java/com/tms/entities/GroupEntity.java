package com.tms.entities;

import java.time.LocalDate;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
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
	
	@Column(length = 50)
	private String groupName;
	@Column(length = 150)
	private String groupDesc;
	
	private LocalDate groupStartDate;
	
	private LocalDate groupEndDate;
	
	@Column(length = 15)
	private String groupStatus;
	
//	@ManyToOne
//	@JoinColumn(name = "entity_id")
//	private MEntity groupEntityId;
//	
	@ManyToMany(mappedBy = "group_entities", cascade = CascadeType.ALL)
	@JsonManagedReference
	private List<MEntity> entities;
	
	
}
