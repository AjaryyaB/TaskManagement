package com.tms.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_MRole")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MRole {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long roleId;

	private String roleName;

	private String roleDesc;

}
