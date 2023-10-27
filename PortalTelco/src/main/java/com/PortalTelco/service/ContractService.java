package com.PortalTelco.service;

import com.PortalTelco.dto.ContractDTOSQL;
import org.springframework.http.ResponseEntity;



public interface ContractService {

    ResponseEntity<String> createContract(ContractDTOSQL contractDTOSQL);
}
