package com.PortalTelco.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

//lombok
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CampaignDTO {

    private Long numberOfServices;
    private Long customerSeniority;
    private Long discount;
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date discountStartDate;
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    private Date discountEndDate;

}
