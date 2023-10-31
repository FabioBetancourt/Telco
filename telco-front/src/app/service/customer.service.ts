import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Customer } from '../model/customer.model';

@Injectable({
  providedIn: 'root'
})
export class CustomerService {
  private apiUrl = 'http://localhost:8080/customer/create';

  constructor(private httpClient: HttpClient ) {}
    

  createCustomer(customer: Customer) {
    return this.httpClient.post(this.apiUrl, customer);
  }
}
