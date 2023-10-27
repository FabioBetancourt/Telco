package com.PortalTelco.repository;

import com.PortalTelco.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CustomerRepositoryInterfaceJPA extends JpaRepository<Customer, Long> {
    List<Customer> findByDocument (Long document);
}
