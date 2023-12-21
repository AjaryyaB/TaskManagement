package com.tms.entities;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tbl_MUser")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MUser {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long userId;
	@Column(length = 50)
	private String userName;
	@Column(length = 50)
	private String password;
	@Column(length = 50)
	private String fullName;

	private LocalDate createDate;
	
	@Column(length = 15)
	private String status;
	@Column(length = 50)
	private String designation;

	@Column(length = 100)
	private String email;
	
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	private MRole roleId;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "entity_id")
	private MEntity entityId;

	private LocalDate endDate;

	private Long mobile;

	private boolean isDefaultUser;

}
