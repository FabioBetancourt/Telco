import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CustomersComponent } from './components/customers/customers.component';
import { HomeComponent } from './components/home/home.component';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ButtonModule } from 'primeng/button';
import { InputTextModule } from 'primeng/inputtext';
import { CardModule } from 'primeng/card';
import { MessagesModule } from 'primeng/messages';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { MenubarModule } from 'primeng/menubar';
import { CustomerListComponent } from './components/customer-list/customer-list.component';
import { RadioButtonModule } from 'primeng/radiobutton';
import { TableModule } from 'primeng/table';
import { CreateContractComponent } from './components/create-contract/create-contract.component';
import {TreeSelectModule} from 'primeng/treeselect';

@NgModule({
  declarations: [
    AppComponent,
    CustomersComponent,
    HomeComponent,
    HeaderComponent,
    FooterComponent,
    CustomerListComponent,
    CreateContractComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule, 
    ReactiveFormsModule,
    ButtonModule,
    BrowserAnimationsModule,
    InputTextModule,
    CardModule,
    MessagesModule,
    MenubarModule,
    RadioButtonModule,
    FormsModule,
    TableModule,
    TreeSelectModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
