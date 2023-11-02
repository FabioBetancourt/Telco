import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Message } from 'primeng/api';
import { Campaign } from 'src/app/model/campaign.model';
import { CampaignService } from 'src/app/service/campaign.service';

@Component({
  selector: 'app-campaign-create',
  templateUrl: './campaign-create.component.html',
  styleUrls: ['./campaign-create.component.scss']
})
export class CampaignCreateComponent implements OnInit{

  campaignForm: FormGroup;
  //variable to show messages
  messages: Message[] = [];
  showMessage: boolean = false;
  //this is necessary to edit endpoint
  isEditing: boolean = false;
  editingCampaignId: string | null = null;
  //show date p-calenda
  date : Date | undefined;

  //building data
  constructor(
    private fb: FormBuilder,
    private campaignService: CampaignService,
    private route: ActivatedRoute,
  ) {
    this.campaignForm = this.fb.group({
      numberOfServices: ['', [Validators.required, Validators.pattern('^[0-9]+$')]],
      customerSeniority: ['', [Validators.required , Validators.pattern('^[0-9]+$')]],
      discount: ['', [Validators.required, Validators.pattern('^[0-9]+$')]],
      discountStartDate: ['', [Validators.required]],
      discountEndDate: ['', [Validators.required]],
    });
  }

  
  ngOnInit(): void {
    this.editingCampaignId = this.route.snapshot.paramMap.get('id');
    if (this.editingCampaignId) {
      this.isEditing = true;
      this.getCampaignData(this.editingCampaignId);
    }
  }

  onSubmit() {
    if (this.campaignForm.valid) {
      //capitalize the first name and lastname
      const formData = this.campaignForm.value;

      if (this.isEditing) {
        this.updateCampaign(formData);
      } else {
        this.createCampaign(formData);
      }
      this.showMessage = false;
    } else {
      this.showCompleteMessage(
        'info',
        'Informacion Incompleta!',
        'Debe llenar todos los campos'
      );
    }
}

createCampaign(dataCampaign: Campaign) {
    this.campaignService.createCampaign(dataCampaign).subscribe({
        next: (response) => {
          console.log('Campaign created!', response);
          this.showCompleteMessage(
            'success',
            'Éxito!',
            'Campaña creada exitosamente.'
          );
          this.campaignForm.reset();
        },
        error: (err) => {
          console.error('Error creating campaign', err);
          this.showCompleteMessage(
            'error',
            'Algo Falló!',
            'La campaña no se a creado.'
          );
        },
    });
}

updateCampaign(dataCampaign: Campaign) {
    if (this.editingCampaignId) {
      this.campaignService.updateCampaign(this.editingCampaignId, dataCampaign).subscribe({
          next: (response) => {
          console.log('Campaign updated!', response);
          this.showCompleteMessage(
            'success',
            'Éxito!',
            'Campaña actualizada exitosamente.'
          );
          this.campaignForm.reset();
        },
        error: (err) => {
          console.error('Error updating campaign', err);
          this.showCompleteMessage(
            'error',
            'Algo Falló!',
            'La campaña no se pudo actualizar.'
          );
        },
    });
  }else {
    console.error('editingCampaignId is null');
}
    
}
  //get first to edit
  getCampaignData(id: string) {
    this.campaignService.getCampaignByStatus(id).subscribe((data) => { 
      this.campaignForm.patchValue(data);
    });
  }

  //function to show messages
  showCompleteMessage(
    type: 'success' | 'error' | 'info',
    summary: string,
    detail: string
  ) {
    this.messages = [];
    this.messages.push({ severity: type, summary: summary, detail: detail });
    this.showMessage = true;

    // No mostramos el temporizador si es un mensaje de tipo 'info'
    if (type !== 'info') {
      setTimeout(() => {
        this.showMessage = false;
      }, 3000);
    }
  }
}
