package com.PortalTelco.controller;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.model.Customer;
import com.PortalTelco.service.customer.CustomerService;
import com.PortalTelco.service.customer.CustomerServiceImp;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("customer")
@CrossOrigin
public class CustomerController {


    private final CustomerService customerService;

    public CustomerController(CustomerServiceImp customerServiceImp) {
        this.customerService = customerServiceImp;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, String>> create(@RequestBody CustomerDTOSQL customerDTOSQL) {
        String message = String.valueOf(customerService.createCustomer(customerDTOSQL));
        Map<String, String> response = new HashMap<>();
        response.put("message", message);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/find-by-id/{id}")
    public ResponseEntity<Customer> getCustomerById(@PathVariable Long id) {
        return customerService.findById(id)
                .map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @GetMapping("/find-by-document/{document}")
    public ResponseEntity<List<Customer>> getCustomerByDocument(@PathVariable Long document) {
        List<Customer> customers = customerService.findByDocument(document);
        if(customers.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
            return ResponseEntity.ok(customers);
    }

    @PutMapping("/edit-customer/{id}")
    public ResponseEntity<Customer> updateCustomer(@PathVariable(value = "id") Long customerId,
                                                   @RequestBody Customer customerDetails) {
        Optional<Customer> updatedCustomer = customerService.updateCustomer(customerId, customerDetails);
        return updatedCustomer.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping("/file/upload")
    public ResponseEntity<?> uploadCustomersPlainText(@RequestParam("file") MultipartFile file) {
        log.info("Archivo recibido: {}", file.getOriginalFilename());
        if (file.isEmpty()) {
            log.warn("Archivo vacío: {}", file.getOriginalFilename());
            return ResponseEntity.badRequest().body(Map.of("message", "El archivo está vacío"));
        }
        try {
            customerService.processPlainTextFile(file);
            log.info("Proceso completado para el archivo: {}", file.getOriginalFilename());
            return ResponseEntity.ok(Map.of("message", "Clientes cargados exitosamente desde archivo de texto plano."));
        } catch (Exception e) {
            log.error("Error al procesar el archivo: {}", file.getOriginalFilename(), e);
            e.printStackTrace();
            return ResponseEntity.badRequest().body(Map.of("error", "Error al procesar el archivo: " + e.getMessage()));
        }
    }

}
