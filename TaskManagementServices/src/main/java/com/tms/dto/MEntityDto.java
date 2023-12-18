package com.tms.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MEntityDto {
	
	private long entityId;

	@NotBlank(message = "Entity name cannot be blank")
    @Size(max = 50, message = "Entity name length must be less than or equal to 50")
    private String entityName;

	@Size(max = 50, message = "Entity description length must be less than or equal to 50")
    private String entityDesc;

    @NotBlank(message = "Entity status cannot be blank")
    private String entityStatus;

    @NotBlank(message = "Entity CIN cannot be blank")
    private String entityCIN;

    @NotBlank(message = "Entity GST cannot be blank")
    private String entityGST;

    @Size(max = 50, message = "Entity legal name length must be less than or equal to 50")
    private String entityLegalName;

    @NotBlank(message = "Entity address cannot be blank")
    @Size(max = 50, message = "Entity address length must be less than or equal to 50")
    private String entityAddress;

    @NotBlank(message = "Entity contact cannot be blank")
    @Size(min = 10, max = 15, message = "Entity contact must be between 10 and 15 characters")
    private String entityContact;

    @Email(message = "Invalid email format")
    @NotBlank(message = "Entity email cannot be blank")
    private String entityEmail;

    @Size(max = 100, message = "Entity URL length must be less than or equal to 100")
    private String entityURL;

}
