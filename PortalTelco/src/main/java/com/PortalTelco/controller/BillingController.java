package com.PortalTelco.controller;

import com.PortalTelco.model.Billing;
import com.PortalTelco.service.billing.BillingService;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
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

    @GetMapping("/export")
    public ResponseEntity<Resource> exportCustomersToExcel() {
        List<Billing> billings = billingService.findCustomersWithDiscount();

        byte[] excelContent = billingService.createExcelFile(billings);
        ByteArrayResource resource = new ByteArrayResource(excelContent);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=billings.xlsx")
                .contentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
                .body(resource);
    }
}
