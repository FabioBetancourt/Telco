package com.PortalTelco.controller;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.repository.CustomerRepository;
import com.PortalTelco.service.CustomerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("customer")
//@CrossOrigin(origins = "*")
public class CustomerController {

    private final CustomerRepository customerRepository;

    public CustomerController(CustomerService customerService, CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @PostMapping
    public ResponseEntity<String> create(@RequestBody CustomerDTOSQL customerDTOSQL) {
         try {
            customerRepository.addCustomer(customerDTOSQL);
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body("El cliente: " + customerDTOSQL.getFirstName() + " con numero de documento: " +
                            customerDTOSQL.getDocument() + " ha sido creado exitosamente");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Halgo salio mal, Error ocurrido: " + e);
        }
    }
}
