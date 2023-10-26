package com.PortalTelco.service;

import com.PortalTelco.dto.CustomerDTOSQL;


public interface CustomerService {

    void createCustomer(CustomerDTOSQL customerDTOSQL);


    //CustomerDTOSQL getCustomerById(Long id);
}
