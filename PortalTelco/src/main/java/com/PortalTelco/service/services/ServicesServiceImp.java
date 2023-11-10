package com.PortalTelco.service.services;


import com.PortalTelco.model.Services;
import com.PortalTelco.repository.services.ServicesRepositoryInterfaceJPA;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServicesServiceImp implements ServicesService {

    private final ServicesRepositoryInterfaceJPA servicesRepositoryInterfaceJPA;

    public ServicesServiceImp(ServicesRepositoryInterfaceJPA servicesRepositoryInterfaceJPA) {
        this.servicesRepositoryInterfaceJPA = servicesRepositoryInterfaceJPA;
    }
    @Override
    public List<Services> getAllServices() {
        return this.servicesRepositoryInterfaceJPA.findAll();
    }

}
