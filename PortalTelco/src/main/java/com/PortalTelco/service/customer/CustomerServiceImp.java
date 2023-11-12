package com.PortalTelco.service.customer;

import com.PortalTelco.dto.CustomerDTOSQL;
import com.PortalTelco.model.Customer;
import com.PortalTelco.repository.customer.CustomerRepository;
import com.PortalTelco.repository.customer.CustomerRepositoryInterfaceJPA;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Slf4j
@Service
public class CustomerServiceImp implements CustomerService {


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

    @Override
    @Transactional
    public void processPlainTextFile(MultipartFile file) throws IOException {
        log.info("Iniciando procesamiento del archivo: {}", file.getOriginalFilename());
        List<Customer> customers = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new InputStreamReader(file.getInputStream()))) {
            String line = reader.readLine();
            if (line == null || !line.contains("DOCUMENTO")) {
                log.error("Encabezado incorrecto en el archivo: {}", file.getOriginalFilename());
                throw new IllegalArgumentException("El archivo no tiene el encabezado correcto.");
            }
            while ((line = reader.readLine()) != null) {
                try {
                    String[] data = line.split(";");
                    if (data.length != 6) {
                        log.warn("Línea con formato incorrecto: {}", line);
                        continue;
                    }
                    Customer customer = parseCustomer(data);
                    log.info("Cliente procesado: {}", customer);
                    customers.add(customer);
                } catch (Exception e) {
                    log.error("Error al procesar la línea: {}", line, e);
                }
            }
        }
        customerRepositoryInterfaceJPA.saveAll(customers);
        log.info("Clientes guardados en la base de datos: {}", customers.size());
    }

    private Customer parseCustomer(String[] data) {
        Customer customer = new Customer();
        customer.setDocument(Long.parseLong(data[0].trim()));
        customer.setFirstName(data[1].trim());
        customer.setLastName(data[2].trim());
        customer.setEmail(data[3].trim());
        customer.setPhoneNumber(data[4].trim());
        customer.setAddress(data[5].trim());
        return customer;
    }

}

