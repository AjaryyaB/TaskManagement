package com.tms.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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

	private String entityName;

	private String entityDesc;

	private String entityStatus;

	private String entityCIN;

	private String entityGST;

	private String entityLegalName;

	private String entityAddress;

	private String entityContact;

	private String entityEmail;

	private String entityURL;

}
