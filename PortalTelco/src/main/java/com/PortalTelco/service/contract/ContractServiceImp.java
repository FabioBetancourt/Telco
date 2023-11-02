package com.PortalTelco.service.contract;

import com.PortalTelco.dto.ContractDTOSQL;
import com.PortalTelco.repository.contract.ContractRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;


@Service
public class ContractServiceImp implements ContractService{


    private final ContractRepository contractRepository;

    public ContractServiceImp(ContractRepository contractRepository) {
        this.contractRepository = contractRepository;
    }

    @Override
    public ResponseEntity<String> createContract (@RequestBody ContractDTOSQL contractDTOSQL){
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
