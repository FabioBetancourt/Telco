package com.PortalTelco.service.billing;

import com.PortalTelco.model.Billing;
import com.PortalTelco.repository.billing.BillingRepositoryInterfaceJPA;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillingServiceImp implements BillingService{

    private final BillingRepositoryInterfaceJPA billingRepositoryInterfaceJPA;

    public BillingServiceImp(BillingRepositoryInterfaceJPA billingRepositoryInterfaceJPA) {
        this.billingRepositoryInterfaceJPA = billingRepositoryInterfaceJPA;
    }
    @Override
    public List<Billing> getBillingsByCustomerId(Long fkIdCustomer) {
        return billingRepositoryInterfaceJPA.findBillingsByFkIdCustomer(fkIdCustomer);
    }
}
