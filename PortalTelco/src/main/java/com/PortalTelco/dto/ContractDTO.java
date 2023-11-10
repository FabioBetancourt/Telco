package com.PortalTelco.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
//lombok
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ContractDTO {

    private Long fkIdCustomer;
    private Long fkIdService;
}
