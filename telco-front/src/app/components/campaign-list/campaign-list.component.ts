import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Message, SelectItem } from 'primeng/api';
import { Campaign } from 'src/app/model/campaign.model';

@Component({
  selector: 'app-campaign-list',
  templateUrl: './campaign-list.component.html',
  styleUrls: ['./campaign-list.component.scss'],
})
export class CampaignListComponent {
  inputValue: string | undefined;
  selectedType: string | undefined;
  results!: Campaign[];
  messages: Message[] = [];
  showMessage: boolean = false;
  statusOptions: SelectItem[];

  constructor(private http: HttpClient) {
    this.statusOptions = [
      { label: 'Activo', value: 'Activo' },
      { label: 'Inactivo', value: 'Inactivo' },
    ];
  }

  search() {
    if (this.selectedType) {
      const url = `http://localhost:8080/campaign/get-by-status/${this.selectedType}`;
      this.http.get<Campaign[]>(url).subscribe({
        next: (data) => {
          if (data && data.length > 0) {
            this.results = data;
            this.showCompleteMessage(
              'success',
              'Éxito',
              'Camapañas encontradas con éxito.'
            );
          }
        },
        error: (error) => {
          if (error.status === 404) {
            this.showCompleteMessage(
              'info',
              'Error',
              'No se encontraron Camapañas con ese estado.'
            );
          } else {
            this.showCompleteMessage(
              'error',
              'Error',
              'Hubo un problema al buscar las Camapañas.'
            );
          }
        },
      });
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
