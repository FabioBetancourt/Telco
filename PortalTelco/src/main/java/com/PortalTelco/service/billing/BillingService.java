package com.PortalTelco.service.billing;

import com.PortalTelco.model.Billing;

import java.util.List;

public interface BillingService {

    public List<Billing> getBillingsByCustomerId(Long fkIdCustomer);
    List<Billing> findCustomersWithDiscount();
    byte[] createExcelFile(List<Billing> billings);
}
