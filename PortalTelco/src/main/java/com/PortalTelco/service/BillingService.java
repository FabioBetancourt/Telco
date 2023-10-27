package com.PortalTelco.service;

import com.PortalTelco.model.Billing;

import java.util.List;

public interface BillingService {

    List<Billing> findByIdBilling (Long id);
}
