package com.PortalTelco.controller;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.model.Customer;
import com.PortalTelco.service.CustomerService;
import com.PortalTelco.service.CustomerServiceImp;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("customer")
//@CrossOrigin(origins = "*")
public class CustomerController {


    private final CustomerService CustomerService;

    public CustomerController(CustomerServiceImp customerServiceImp) {
        this.CustomerService = customerServiceImp;
    }

    @PostMapping("/create")
    public ResponseEntity<String> create(@RequestBody CustomerDTOSQL customerDTOSQL) {
        return CustomerService.createCustomer(customerDTOSQL);
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
