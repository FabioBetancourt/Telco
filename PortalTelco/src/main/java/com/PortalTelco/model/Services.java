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
@Table(name = "services")
public class Services {

    @Id
    @Column(name = "ID_SERVICE")
    private Long idService;
    @Column(name = "SERVICE_NAME")
    private String serviceName;
    @Column(name = "PRICE")
    private Long price;
    @Column(name = "INCORPORATION_DATE")
    private Date incoporationDate;
    @Column(name = "STATUS")
    private String status;
}
