package com.PortalTelco.controller;

import com.PortalTelco.dto.ContractDTOSQL;
import com.PortalTelco.model.Contract;
import com.PortalTelco.service.ContractService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("contract")
public class ContractController {

    private final ContractService ContractService;

    public ContractController(com.PortalTelco.service.ContractService contractService) {
        ContractService = contractService;
    }

    @PostMapping("/create")
    public ResponseEntity<String> create(@RequestBody ContractDTOSQL contractDTOSQL) {
        return ContractService.createContract(contractDTOSQL);
    }
}

