package com.PortalTelco.service;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;

@Service
public class CustomerServiceImp implements CustomerService{

    @Autowired
    private EntityManager entityManager;

    private final CustomerRepository customerRepository;

    @Autowired
    public CustomerServiceImp(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }


    @Override
    public void createCustomer(CustomerDTOSQL customerDTOSQL) {
        customerRepository.addCustomer(customerDTOSQL);
    }
}
