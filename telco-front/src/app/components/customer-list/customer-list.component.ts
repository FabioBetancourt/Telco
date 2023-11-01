import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Message } from 'primeng/api';
import { Customer } from 'src/app/model/customer.model';

@Component({
  selector: 'app-customer-list',
  templateUrl: './customer-list.component.html',
  styleUrls: ['./customer-list.component.scss'],
})
export class CustomerListComponent {
  constructor(private http: HttpClient) {}

  inputValue: string | undefined;
  selectedType: string | undefined;
  results!: Customer[];
  messages: Message[] = [];
  showMessage: boolean = false;

  search() {
    let url = 'http://localhost:8080/customer/';

    if (this.selectedType === 'Id') {
      url += `find-by-id/${this.inputValue}`;

      this.http.get<Customer>(url).subscribe({
        next: (data) => {
          if (data) {
            this.results = [data];
            this.showCompleteMessage('success', 'Éxito', 'Cliente Encontrado!');
          }
        },
        error: (error) => {
          if (error.status === 404) {
            this.showCompleteMessage(
              'info',
              'Error',
              'No se encontraron clientes con ese ID.'
            );
          } else {
            this.showCompleteMessage(
              'error',
              'Error',
              'Hubo un problema al buscar el cliente'
            );
          }
        },
      });
    } else if (this.selectedType === 'Documento') {
      url += `find-by-document/${this.inputValue}`;

      this.http.get<Customer[]>(url).subscribe({
        next: (data) => {
          if (data && data.length > 0) {
            this.results = data;
            this.showCompleteMessage(
              'success',
              'Éxito',
              'Clientes encontrados con éxito.'
            );
          }
        },
        error: (error) => {
          if (error.status === 404) {
            this.showCompleteMessage(
              'info',
              'Error',
              'No se encontraron clientes con ese documento.'
            );
          } else {
            this.showCompleteMessage(
              'error',
              'Error',
              'Hubo un problema al buscar los clientes.'
            );
          }
        },
      });
    } else {
      this.showCompleteMessage("error", "Error!", "Debe escoger ID o DOCUMENTO en el filtro de busqueda")
    }
  }

  showCompleteMessage(
    type: 'success' | 'error' | 'info',
    summary: string,
    detail: string
  ) {
    this.messages = [];
    this.messages.push({ severity: type, summary: summary, detail: detail });
    this.showMessage = true;

    if (type !== 'info') {
      setTimeout(() => {
        this.showMessage = false;
      }, 3000);
    }
  }
}
