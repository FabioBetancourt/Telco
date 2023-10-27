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
@Table (name = "BILLING")
public class Billing {

    @Id
    @Column(name = "ID_BILLING")
    private Long idBilling;

    @Column(name = "VALUE")
    private Long value;

    @Column(name = "DISCOUNT")
    private Long discount;

    @Column(name = "VALUE_DISCOUNT")
    private Long valueDiscount;

    @Column(name = "DISCOUNT_END_DATE")
    private Date discountEndDate;
}
