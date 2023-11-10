package com.PortalTelco.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

//lombok
@AllArgsConstructor
@NoArgsConstructor
@Data

//model
@Entity
@Table(name = "CUSTOMER")
public class Customer {

    @Id
    @Column(name = "ID_CUSTOMER")
    //necessary to insert clients by a document by jpa because we use sequence to insert id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "customer_seq")
    @SequenceGenerator(name = "customer_seq", sequenceName = "SEQ_ID_CUSTOMER", allocationSize = 1)
    private Long idCustomer;

    @Column(name = "DOCUMENT")
    private Long document;

    @Column(name = "FIRST_NAME")
    private String firstName;

    @Column(name = "LAST_NAME")
    private String lastName;

    @Column(name = "EMAIL")
    private String email;

    @Column(name = "PHONE_NUMBER")
    private String phoneNumber;

    @Column(name = "ADDRESS")
    private String address;
}
