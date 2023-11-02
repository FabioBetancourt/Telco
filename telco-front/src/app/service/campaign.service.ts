import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Campaign } from '../model/campaign.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class CampaignService {
  private baseUrl = 'http://localhost:8080/campaign';
  private createApiUrl = `${this.baseUrl}/create`;
  private getApiUrl = `${this.baseUrl}/get-by-id`;
  private EditApiUrl = `${this.baseUrl}/edit-campaign`;

  constructor(private httpClient: HttpClient) {}

  createCampaign(campaign: Campaign) {
    return this.httpClient.post(this.createApiUrl, campaign);
  }

  getCampaignByStatus(status: string): Observable<Campaign[]> {
    const url = `${this.getApiUrl}/${status}`;
    return this.httpClient.get<Campaign[]>(url);
  }

  updateCampaign(id: string, dataCampaign: Campaign): Observable<Campaign> {
    return this.httpClient.put<Campaign>(
      `${this.EditApiUrl}/${id}`,
      dataCampaign
    );
  }
}
