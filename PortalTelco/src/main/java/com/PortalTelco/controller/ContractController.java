package com.PortalTelco.controller;

import com.PortalTelco.dto.ContractDTOSQL;
import com.PortalTelco.repository.ContractRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("contract")
public class ContractController {

    private final ContractRepository contractRepository;

    public ContractController(ContractRepository contractRepository) {
        this.contractRepository = contractRepository;
    }


    @PostMapping
    public ResponseEntity<String> create (@RequestBody ContractDTOSQL contractDTOSQL){
        try{
            contractRepository.AddCustomerService(contractDTOSQL);
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body("El cliente con id: "+ contractDTOSQL.getFkIdCustomer() +
                            " ha contrata el servicio de id: " + contractDTOSQL.getFkIdService());
        }catch (Exception e){
            System.out.println(e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Halgo salio mal, Error ocurrido: " + e);
        }
    }
}
