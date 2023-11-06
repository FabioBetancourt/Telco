import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Message } from 'primeng/api';
import { Billing } from 'src/app/model/billing.model';

@Component({
  selector: 'app-billing-list',
  templateUrl: './billing-list.component.html',
  styleUrls: ['./billing-list.component.scss']
})
export class BillingListComponent {
  
  inputValue: string | null | undefined;
  selectedType: string | undefined;
  results!: Billing[];
  messages: Message[] = [];
  showMessage: boolean = false;


  constructor(private http: HttpClient, private route: ActivatedRoute) {
    this.route.paramMap.subscribe(params => {
      this.inputValue = params.get('id');
      if (this.inputValue) {
        this.search();
      }
    });
  }
  

  search() {
    let baseUrl = 'http://localhost:8080/billings/';
    if (this.inputValue) { // Verifica que inputValue tenga contenido
      let url = baseUrl + `${this.inputValue}`;
      this.http.get<Billing | Billing[]>(url).subscribe({
        next: (data) => {
          this.results = Array.isArray(data) ? data : [data];
          this.showCompleteMessage('success', 'Éxito', 'Facturas Encontradas!');
        },
        error: (error) => {
          if (error.status === 404) {
            this.showCompleteMessage(
              'info',
              'Error',
              'No se encontraron Facturas con ese ID.'
            );
          } else {
            this.showCompleteMessage(
              'error',
              'Error',
              'Hubo un problema al buscar las Facturas.'
            );
          }
        },
      });
    } else {
      this.showCompleteMessage(
        'info',
        'Error',
        'Ingrese un ID válido para buscar.'
      );
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
