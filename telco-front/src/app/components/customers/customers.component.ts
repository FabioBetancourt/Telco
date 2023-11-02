import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { Message } from 'primeng/api';
import { CustomerService } from 'src/app/service/customer.service';
import { ActivatedRoute } from '@angular/router';
import { Customer } from 'src/app/model/customer.model';

@Component({
  selector: 'app-customers',
  templateUrl: './customers.component.html',
  styleUrls: ['./customers.component.scss'],
})
export class CustomersComponent implements OnInit {
  customerForm: FormGroup;
  //variable to show messages
  messages: Message[] = [];
  showMessage: boolean = false;
  //this is necessary to edit endpoint
  isEditing: boolean = false;
  editingCustomerId: string | null = null;

  //building data
  constructor(
    private fb: FormBuilder,
    private customerService: CustomerService,
    private route: ActivatedRoute
  ) {
    this.customerForm = this.fb.group({
      document: ['', [Validators.required, Validators.pattern('^[0-9]*$')]],
      firstName: ['', [Validators.required]],
      lastName: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      phoneNumber: ['', [Validators.required]],
      address: ['', [Validators.required]],
    });
  }

  
  ngOnInit(): void {
    this.editingCustomerId = this.route.snapshot.paramMap.get('id');
    if (this.editingCustomerId) {
      this.isEditing = true;
      this.getCustomerData(this.editingCustomerId);
    }
  }

  onSubmit() {
    if (this.customerForm.valid) {
      //capitalize the first name and lastname
      const formData = this.customerForm.value;
      formData.firstName = this.capitalizeFirstLetter(formData.firstName);
      formData.lastName = this.capitalizeFirstLetter(formData.lastName);

      if (this.isEditing) {
        this.updateCustomer(formData);
      } else {
        this.createCustomer(formData);
      }

      this.showMessage = false;
    } else {
      this.showCompleteMessage(
        'info',
        'Informacion Incompleta!',
        'Debe llenar todos los campos'
      );
    }
}

createCustomer(data: Customer) {
    this.customerService.createCustomer(data).subscribe({
        next: (response) => {
          console.log('Customer created!', response);
          this.showCompleteMessage(
            'success',
            'Éxito!',
            'Usuario creado exitosamente.'
          );
          this.customerForm.reset();
        },
        error: (err) => {
          console.error('Error creating customer', err);
          this.showCompleteMessage(
            'error',
            'Algo Falló!',
            'El usuario no se a creado.'
          );
        },
    });
}

updateCustomer(data: Customer) {
    if (this.editingCustomerId) {
      this.customerService.updateCustomer(this.editingCustomerId, data).subscribe({
          next: (response) => {
          console.log('Customer updated!', response);
          this.showCompleteMessage(
            'success',
            'Éxito!',
            'Usuario actualizado exitosamente.'
          );
          this.customerForm.reset();
        },
        error: (err) => {
          console.error('Error updating customer', err);
          this.showCompleteMessage(
            'error',
            'Algo Falló!',
            'El usuario no se pudo actualizar.'
          );
        },
    });
  }else {
    console.error('editingCustomerId is null');
}
    
}
  //get first to edit
  getCustomerData(id: string) {
    this.customerService.getCustomer(id).subscribe((data) => { 
      this.customerForm.patchValue(data);
    });
  }


  //function to capitalize
  capitalizeFirstLetter(str: string): string {
    return str.toLowerCase().replace(/\b(\w)/g, (s) => s.toUpperCase());
  }

  //function to show messages
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
