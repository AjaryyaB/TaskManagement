package com.tms.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticationDto {
	@NotBlank(message = "UserName must not be blank")
	private String userName;
	@NotBlank(message = "Password must not be blank")
	private String password;
}
