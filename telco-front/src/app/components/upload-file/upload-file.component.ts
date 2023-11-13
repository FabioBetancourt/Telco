import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Message } from 'primeng/api';

@Component({
  selector: 'app-upload-file',
  templateUrl: './upload-file.component.html',
  styleUrls: ['./upload-file.component.scss'],
})
export class UploadFileComponent {
  messages: Message[] = [];
  showMessage: boolean = false;
  selectedFile: File | null = null;

  constructor(private http: HttpClient) {}

  onFileSelect(event: any): void {
    if (event.files && event.files.length > 0) {
      this.selectedFile = event.files[0];
      console.log('Archivo seleccionado:', this.selectedFile);
    }
  }
  

  upload(): void {
    if (this.selectedFile) {
      const formData = new FormData();
      formData.append('file', this.selectedFile, this.selectedFile.name);

      this.http
        .post('http://localhost:8080/customers/file/upload', formData)
        .subscribe({
          next: (response) => {
            console.log(response);
            this.showCompleteMessage(
              'success',
              'Exito!',
              'Archivo recibido y clientes creados'
            );
          },
          error: (error) => {
            console.error(error);
            this.showCompleteMessage("error", "Algo Fallo!", "Algo Fallo durante la carga del archivo")
          },
        });
    } else {
      this.showCompleteMessage(
        'info',
        'Algo Fallo!',
        'Por favor, selecciona un archivo primero.'
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
