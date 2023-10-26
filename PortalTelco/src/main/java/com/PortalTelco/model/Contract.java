package com.PortalTelco.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

//lombok
@AllArgsConstructor
@NoArgsConstructor
@Data

//model
@Entity
@Table(name = "CUSTOMER_SERVICES")
public class Contract {

    @Id
    @Column(name = "ID_CUSTOMER_SERVICE")
    private Long idCustomerService;

    @Column(name = "FK_ID_CUSTOMER")
    private Long fkIdCustomer;

    @Column(name = "FK_ID_SERVICE")
    private String fkIdService;

    @Column(name = "CONTRACT_DATE")
    private Date contractDate;

}

