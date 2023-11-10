package com.PortalTelco.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//lombok
@AllArgsConstructor
@NoArgsConstructor
@Data

public class CustomerDTO {
    private Long document;
    private String firstName;
    private String lastName;
    private String Email;
    private String phoneNumber;
    private String address;
}
