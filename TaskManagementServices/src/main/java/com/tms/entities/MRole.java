package com.tms.entities;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
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

	
	@Column(length = 50)
	private String roleName;
	@Column(length = 150)
	private String roleDesc;
	
	
	private LocalDate roleCrDate;
	
	private LocalDate roleEnDate;

}
