import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Billing } from '../model/billing.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BillingService {

  private baseUrl = 'http://localhost:8080/billings';

  constructor(private httpClient: HttpClient ) {}
    
  getBillings(id: string): Observable<Billing> {
    const url = `${this.baseUrl}/${id}`;
    return this.httpClient.get<Billing>(url);
  }

  exportCustomers(): Observable<Blob> {
    return this.httpClient.get(`${this.baseUrl}/export`, { responseType: 'blob' });
  }
}
