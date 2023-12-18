package com.tms.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GroupEntityResponseDto {

	private long entityId;

	@NotBlank(message = "Entity name cannot be blank")
    @Size(max = 50, message = "Entity name length must be less than or equal to 50")
    private String entityName;
}
