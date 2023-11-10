package com.PortalTelco.repository.billing;

import com.PortalTelco.model.Billing;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface BillingRepositoryInterfaceJPA extends JpaRepository<Billing, Long> {
    // Query to search billings by fkIdCustomer
    @Query("SELECT b FROM Billing b JOIN Contract c ON b.idBilling = c.idCustomerService WHERE c.fkIdCustomer = :fkIdCustomer")
    List<Billing> findBillingsByFkIdCustomer(@Param("fkIdCustomer") Long fkIdCustomer);

    //Query to generate a report
    @Query("SELECT b FROM Billing b WHERE b.discount <> 0")
    List<Billing> findByDiscountNotZero();
}
