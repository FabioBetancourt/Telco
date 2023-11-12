import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Customer } from '../model/customer.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {
  
  private baseUrl = 'http://localhost:8080/customers';
  private createApiUrl = `${this.baseUrl}/create`;

  constructor(private httpClient: HttpClient ) {}
    

  createCustomer(customer: Customer) {
    return this.httpClient.post(this.createApiUrl, customer);
  }

  getCustomer(id: string): Observable<Customer> {
    const url = `${this.baseUrl}/find-by-id/${id}`;
    return this.httpClient.get<Customer>(url);
  }

  updateCustomer(id: string, data: Customer): Observable<Customer> {
    return this.httpClient.put<Customer>(`${this.baseUrl}/edit-customer/${id}`, data);
}


}
