package com.PortalTelco.service.contract;

import com.PortalTelco.dto.ContractDTOSQL;
import org.springframework.http.ResponseEntity;



public interface ContractService {
    ResponseEntity<String> createContract(ContractDTOSQL contractDTOSQL);
}
