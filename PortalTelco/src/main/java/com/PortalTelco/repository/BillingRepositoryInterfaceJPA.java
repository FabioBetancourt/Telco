package com.PortalTelco.repository;

import com.PortalTelco.model.Billing;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BillingRepositoryInterfaceJPA extends JpaRepository<Billing, Long> {
    List<Billing> getByIdBilling (Long id);
}
