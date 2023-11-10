package com.PortalTelco.repository.customer;

import com.PortalTelco.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepositoryInterfaceJPA extends JpaRepository<Customer, Long> {
    //Necessary to get a list of clients with the same document
    List<Customer> findByDocument (Long document);
}
