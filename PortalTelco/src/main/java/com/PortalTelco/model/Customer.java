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
