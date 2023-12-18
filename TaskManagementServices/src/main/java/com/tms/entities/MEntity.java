package com.tms.entities;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonBackReference;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_MEntity")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long entityId;

	@Column(length = 50)
	private String entityName;

	@Column(length = 150)
	private String entityDesc;

	@Column(length = 15)
	private String entityStatus;

	@Column(length = 25)
	private String entityCIN;

	@Column(length = 25)
	private String entityGST;

	@Column(length = 50)
	private String entityLegalName;
	@Column(length = 50)
	private String entityAddress;
	@Column(length = 15)
	private String entityContact;
	@Column(length = 50)
	private String entityEmail;
	@Column(length = 150)
	private String entityURL;

	@ManyToMany
	@JoinTable(joinColumns = @JoinColumn(name = "entity_id"), 
	inverseJoinColumns = @JoinColumn(name = "group_id"))
	@JsonBackReference
	private List<GroupEntity> group_entities;
}