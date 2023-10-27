package com.PortalTelco.service;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.model.Customer;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Optional;

public interface CustomerService {
    //POST
    ResponseEntity<String> createCustomer(CustomerDTOSQL customerDTOSQL);
    //GET BY ID
    Optional<Customer> findById(Long id);
    //GET BY DOCUMENT
    List<Customer> findByDocument(Long document);
    //PUT BY ID
    Optional<Customer> updateCustomer(Long id, Customer customerDetails);
}
