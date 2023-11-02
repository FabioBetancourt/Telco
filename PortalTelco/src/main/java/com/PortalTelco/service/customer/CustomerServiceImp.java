package com.PortalTelco.service.customer;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.model.Customer;
import com.PortalTelco.repository.customer.CustomerRepository;
import com.PortalTelco.repository.customer.CustomerRepositoryInterfaceJPA;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CustomerServiceImp implements CustomerService{


    private final CustomerRepository customerRepository;
    private final CustomerRepositoryInterfaceJPA customerRepositoryInterfaceJPA;

    public CustomerServiceImp(CustomerRepository customerRepository, CustomerRepositoryInterfaceJPA customerRepositoryInterfaceJPA) {
        this.customerRepository = customerRepository;
        this.customerRepositoryInterfaceJPA = customerRepositoryInterfaceJPA;
    }

    /*******************************************JDBC***********************************************/
    @Override
    public ResponseEntity<String> createCustomer(CustomerDTOSQL customerDTOSQL) {
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
    /*****************************************JPA********************************************************/
    @Override
    public Optional<Customer> findById(Long id) {
        return customerRepositoryInterfaceJPA.findById(id);
    }
    @Override
    public List<Customer> findByDocument(Long document) {
        return customerRepositoryInterfaceJPA.findByDocument(document);
    }
    @Override
    public Optional<Customer> updateCustomer(Long id, Customer customerDetails) {
        Optional<Customer> customerOptional = customerRepositoryInterfaceJPA.findById(id);
        if (customerOptional.isEmpty()) {
            return Optional.empty();
        }
        Customer customer = customerOptional.get();
        customer.setDocument(customerDetails.getDocument());
        customer.setFirstName(customerDetails.getFirstName());
        customer.setLastName(customerDetails.getLastName());
        customer.setEmail(customerDetails.getEmail());
        customer.setPhoneNumber(customerDetails.getPhoneNumber());
        customer.setAddress(customerDetails.getAddress());
        customerRepositoryInterfaceJPA.save(customer);
        return Optional.of(customer);
    }

}
