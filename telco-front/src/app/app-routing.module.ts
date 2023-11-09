import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CustomersComponent } from './components/customers/customers.component';
import { HomeComponent } from './components/home/home.component';
import { CustomerListComponent } from './components/customer-list/customer-list.component';
import { CreateContractComponent } from './components/create-contract/create-contract.component';
import { CampaignCreateComponent } from './components/campaign-create/campaign-create.component';
import { CampaignListComponent } from './components/campaign-list/campaign-list.component';
import { BillingListComponent } from './components/billing-list/billing-list.component';
import { UploadFileComponent } from './components/upload-file/upload-file.component';

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'customer/create', component: CustomersComponent },
  { path: 'customer/edit-customer/:id', component: CustomersComponent },
  { path: 'customer/find', component: CustomerListComponent },
  { path: 'contract/create/:id', component: CreateContractComponent },
  { path: 'campaign/create', component: CampaignCreateComponent },
  { path: 'campaign/edit-campaign/:id', component: CampaignCreateComponent },
  { path: 'campaign/list', component: CampaignListComponent },
  { path: 'billings', component: BillingListComponent },
  { path: 'billings/:id', component: BillingListComponent },
  { path: 'document/export', component: BillingListComponent },
  { path: 'files/upload', component: UploadFileComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
