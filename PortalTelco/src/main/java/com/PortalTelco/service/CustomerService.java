package com.PortalTelco.service;

import com.PortalTelco.dto.CustomerDTOSQL;
import org.springframework.stereotype.Service;


public interface CustomerService {

    void createCustomer(CustomerDTOSQL customerDTOSQL);
}
