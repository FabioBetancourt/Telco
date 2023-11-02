import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Message } from 'primeng/api';
import { Contract } from 'src/app/model/contract.model';
import { ContractService } from 'src/app/service/contract.service';
import { Service } from 'src/app/model/services.model';

@Component({
  selector: 'app-create-contract',
  templateUrl: './create-contract.component.html',
  styleUrls: ['./create-contract.component.scss'],
})
export class CreateContractComponent implements OnInit {
  contractForm: FormGroup;
  //variable to show messages
  messages: Message[] = [];
  showMessage: boolean = false;
  services: Service[] = [];
  nodes: any[] = [];
  selectedNodes: any;

  //building data
  constructor(
    private fb: FormBuilder,
    private contractService: ContractService,
    private route: ActivatedRoute
  ) {
    this.contractForm = this.fb.group({
      fkIdCustomer: ['', [Validators.required, Validators.pattern('^[0-9]*$')]],
      fkIdService: ['', [Validators.required,]],
    });
  }

  ngOnInit(): void {
    this.contractService.getServices().subscribe((data) => {
      this.services = data;
      this.nodes = data.map((service) => ({
        label: `${service.serviceName} ${new Intl.NumberFormat('es-MX', { style: 'currency', currency: 'COP' }).format(service.price)}`,
        value: service.idService, 
      }));
      console.log(this.nodes)
    });
    const idCustomer = this.route.snapshot.paramMap.get('id');
    if (idCustomer) {
      this.contractForm?.get('fkIdCustomer')?.setValue(idCustomer);
    }
  }

  onSubmit() {
    if (this.contractForm.valid) {
      const formData = {
        fkIdCustomer: this.contractForm.get('fkIdCustomer')?.value,
        fkIdService: this.contractForm.get('fkIdService')?.value.value // Aquí obtenemos el valor de la propiedad "value" dentro del objeto
      };
      this.createContract(formData);
      this.showMessage = false;
    } else {
      this.showCompleteMessage(
        'info',
        'Informacion Incompleta!',
        'Debe llenar todos los campos'
      );
    }
  }

  createContract(data: Contract) {
    this.contractService.createContract(data).subscribe({
      next: (response) => {
        console.log('Contract created!', response);
        this.showCompleteMessage(
          'success',
          'Éxito!',
          'Contrato Asignado con exito'
        );
        this.contractForm.reset();
      },
      error: (err) => {
        console.error('Error creating a contrat', err);
        this.showCompleteMessage(
          'error',
          'Algo Falló!',
          'El contrato no se pudo asignar.'
        );
      },
    });
  }

  showCompleteMessage(
    type: 'success' | 'error' | 'info',
    summary: string,
    detail: string
  ) {
    this.messages = [];
    this.messages.push({ severity: type, summary: summary, detail: detail });
    this.showMessage = true;

    // No mostramos el temporizador si es un mensaje de tipo 'info'
    if (type !== 'info') {
      setTimeout(() => {
        this.showMessage = false;
      }, 3000);
    }
  }
}
