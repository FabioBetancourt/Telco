import { Component, OnInit } from '@angular/core';
import { FormGroup, Validators, FormBuilder } from '@angular/forms';
import { Message } from 'primeng/api';
import { CustomerService } from 'src/app/service/customer.service';

@Component({
  selector: 'app-customers',
  templateUrl: './customers.component.html',
  styleUrls: ['./customers.component.scss']
})
export class CustomersComponent{
  customerForm: FormGroup;
  messages: Message[] = [];
  showMessage: boolean = false;

  //building data
  constructor(private fb: FormBuilder, private customerService: CustomerService) {
    this.customerForm = this.fb.group({
      document: ['', [Validators.required, Validators.pattern('^[0-9]*$')]],
      firstName: ['', [Validators.required]],
      lastName: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      phoneNumber: ['', [Validators.required]],
      address: ['', [Validators.required]],
    });
  }

  onSubmit(){
    if (this.customerForm.valid) {
      //capitalize the first name and lastname
      const formData = this.customerForm.value;
      formData.firstName = this.capitalizeFirstLetter(formData.firstName);
      formData.lastName = this.capitalizeFirstLetter(formData.lastName);

      //sending data
      this.customerService.createCustomer(this.customerForm.value).subscribe({
        next: (response) => {
          console.log('Customer created!', response);
          this.showCompleteMessage('success', 'Éxito!', 'Usuario creado exitosamente.');
          this.customerForm.reset();
        },
        error: (err) => {
          console.error('Error creating customer', err);
          this.showCompleteMessage('error', 'Algo Falló!', 'El usuario no se a creado.');
        }
      });
      this.showMessage = false;
    }else{
      this.showCompleteMessage('info', 'Informacion Incompleta!', 'Debe llenar todos los campos');
    }
  }

  //function to capitalize 
  capitalizeFirstLetter(str: string): string {
    return str.toLowerCase().replace(/\b(\w)/g, s => s.toUpperCase());
  }
  
  //function to show messages
  showCompleteMessage(type: 'success' | 'error' | 'info', summary: string, detail: string) {
    this.messages = [];
    this.messages.push({severity: type, summary: summary, detail: detail});
    this.showMessage = true;

    // No mostramos el temporizador si es un mensaje de tipo 'info'
    if (type !== 'info') {
        setTimeout(() => {
            this.showMessage = false;
        }, 3000);
    }
}
}
