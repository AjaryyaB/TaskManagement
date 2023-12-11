package com.tms.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_MRolePerm")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MRolePerm {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long rolePermId;

	private String rolePermName;

	private String rolePermDesc;

	private String rolePermStatus;
	
	@OneToOne
	@JoinColumn(name = "role_id")
	private MRole roleId;


}
