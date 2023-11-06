package com.PortalTelco.controller;

import com.PortalTelco.model.Billing;
import com.PortalTelco.service.billing.BillingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("billings")
@CrossOrigin(origins = "http://localhost:4200")
public class BillingController {

    private final BillingService billingService;

    public BillingController(BillingService billingService) {
        this.billingService = billingService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<List<Billing>> getCustomerBillings (@PathVariable Long id){
        List<Billing> billings = billingService.getBillingsByCustomerId(id);
        if (billings.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(billings);
    }

}
