package com.PortalTelco.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

//lombok
@AllArgsConstructor
@NoArgsConstructor
@Data

//model
@Entity
@Table(name = "CAMPAIGN")
public class Campaign {

    @Id
    @Column(name = "ID_CAMPAIGN")
    private Long idCampaign;

    @Column(name = "CAMPAIGN_JOIN_DATE")
    private Date campaignJoinDate;

    @Column(name = "NUMBER_OF_SERVICES")
    private Long numberOfServices;

    @Column(name = "CUSTOMER_SENIORITY")
    private Long customerSeniority;

    @Column(name = "DISCOUNT")
    private Long discount;

    @Column(name = "DISCOUNT_START_DATE")
    private Date discountStartDate;

    @Column(name = "DISCOUNT_END_DATE")
    private Date discountEndDate;

    @Column(name = "STATUS")
    private String status;
}
