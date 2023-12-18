package com.tms.entities;

import jakarta.persistence.Column;
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
	@Column(length = 50)
	private String rolePermName;
	@Column(length = 150)
	private String rolePermDesc;
	@Column(length = 15)
	private String rolePermStatus;
	
	@OneToOne
	@JoinColumn(name = "role_id")
	private MRole roleId;


}
