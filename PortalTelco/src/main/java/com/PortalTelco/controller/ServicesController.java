package com.PortalTelco.controller;

import com.PortalTelco.model.Services;
import com.PortalTelco.service.services.ServicesService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
@RequestMapping("/services")
@CrossOrigin(origins = "http://localhost:4200")
public class ServicesController {

    private final ServicesService servicesService;

    public ServicesController(ServicesService servicesService) {
        this.servicesService = servicesService;
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<Services>> getAllServices(){
        List<Services> services = servicesService.getAllServices();
        if(services.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(services);
    }
}
