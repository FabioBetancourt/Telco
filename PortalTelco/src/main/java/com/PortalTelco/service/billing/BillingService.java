package com.PortalTelco.service.billing;

import com.PortalTelco.model.Billing;

import java.util.List;

public interface BillingService {

    List<Billing> findByIdBilling (Long id);
}
