package com.PortalTelco.controller;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.model.Customer;
import com.PortalTelco.service.customer.CustomerService;
import com.PortalTelco.service.customer.CustomerServiceImp;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("customer")
@CrossOrigin(origins = "http://localhost:4200")
public class CustomerController {


    private final CustomerService CustomerService;

    public CustomerController(CustomerServiceImp customerServiceImp) {
        this.CustomerService = customerServiceImp;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, String>> create(@RequestBody CustomerDTOSQL customerDTOSQL) {
        String message = String.valueOf(CustomerService.createCustomer(customerDTOSQL));
        Map<String, String> response = new HashMap<>();
        response.put("message", message);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/find-by-id/{id}")
    public ResponseEntity<Customer> getCustomerById(@PathVariable Long id) {
        return CustomerService.findById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/find-by-document/{document}")
    public ResponseEntity<List<Customer>> getCustomerByDocument(@PathVariable Long document) {
        List<Customer> customers = CustomerService.findByDocument(document);
        if(customers.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
            return ResponseEntity.ok(customers);
    }

    @PutMapping("/edit-customer/{id}")
    public ResponseEntity<Customer> updateCustomer(@PathVariable(value = "id") Long customerId,
                                                   @RequestBody Customer customerDetails) {
        Optional<Customer> updatedCustomer = CustomerService.updateCustomer(customerId, customerDetails);
        return updatedCustomer.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }


}
