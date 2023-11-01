import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CustomersComponent } from './components/customers/customers.component';
import { HomeComponent } from './components/home/home.component';
import { CustomerListComponent } from './components/customer-list/customer-list.component';


const routes: Routes = [
  {path: '', component: HomeComponent},
  {path: 'customer/create', component: CustomersComponent},
  {path: 'customer/edit-customer/:id', component: CustomersComponent},
  {path: 'customer/find', component: CustomerListComponent},
  {path: 'home', component: HomeComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
