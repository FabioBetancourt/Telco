package com.PortalTelco.controller;

import com.PortalTelco.dto.ContractDTOSQL;

import com.PortalTelco.service.contract.ContractService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

import java.util.Map;

@RestController
@RequestMapping("contract")
@CrossOrigin(origins = "http://localhost:4200")
public class ContractController {

    private final ContractService ContractService;

    public ContractController(com.PortalTelco.service.contract.ContractService contractService) {
        ContractService = contractService;
    }

    @PostMapping("/create")
    public ResponseEntity<Map<String, String>> create(@RequestBody ContractDTOSQL contractDTOSQL) {
        String message = String.valueOf(ContractService.createContract(contractDTOSQL));
        Map<String, String> response = new HashMap<>();
        response.put("message", message);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }
}

