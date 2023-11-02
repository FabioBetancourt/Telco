import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Contract } from '../model/contract.model';
import { Observable } from 'rxjs';
import { Service } from '../model/services.model';

@Injectable({
  providedIn: 'root'
})
export class ContractService {
  private baseUrl = 'http://localhost:8080/contract';
  private createApiUrl = `${this.baseUrl}/create`;

  constructor(private httpClient: HttpClient ) {}
  
  createContract(contract: Contract) {
    return this.httpClient.post(this.createApiUrl, contract);
  }

  getServices(): Observable<Service[]>{
    return this.httpClient.get<Service[]>(`http://localhost:8080/services/get-all`)
  }

}
