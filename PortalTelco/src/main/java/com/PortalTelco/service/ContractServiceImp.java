package com.PortalTelco.service;

import com.PortalTelco.dto.ContractDTOSQL;
import com.PortalTelco.repository.ContractRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;

@Service
public class ContractServiceImp implements ContractService {
    @Autowired
    private EntityManager entityManager;

    private final ContractRepository contractRepository;

    @Autowired
    public ContractServiceImp(ContractRepository contractRepository) {
        this.contractRepository = contractRepository;
    }

    @Override
    public void CreateContract(ContractDTOSQL contractDTOSQL) {
        contractRepository.AddCustomerService(contractDTOSQL);
    }
}
