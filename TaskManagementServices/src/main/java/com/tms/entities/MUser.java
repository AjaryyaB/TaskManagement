package com.tms.entities;

import java.time.LocalDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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

	private String userName;

	private String password;

	private String fullName;

	private LocalDate createDate;

	private String status;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id")
	private MRole roleId;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "entity_id")
	private MEntity entityId;

	private String endDate;
	
}
