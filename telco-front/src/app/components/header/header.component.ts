import { Component, OnInit } from '@angular/core';
import { MenuItem } from 'primeng/api';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  items: MenuItem[] | undefined;

  ngOnInit() {
    this.items = [
      {
        label: 'Inicio',
        icon: 'pi pi-fw pi-home ',
        routerLink: '/',
      },
      {
        label: 'Clientes',
        icon: 'pi pi-fw pi-user',
        items: [
          {
            label: 'Nuevo',
            icon: 'pi pi-fw pi-user-plus',
            routerLink: '/customer/create',
          },
          {
            label: 'Buscar',
            icon: 'pi pi-fw pi-users',
            routerLink: '/customer/find',
          },
        ],
      },
      {
        label: 'Contratos',
        icon: 'pi pi-fw pi-file',
        items: [
          {
            label: 'Nuevo',
            icon: 'pi pi-fw pi-plus',
          },
          {
            separator: true,
          },
          {
            label: 'Export',
            icon: 'pi pi-fw pi-external-link',
          },
        ],
      },
      {
        label: 'Campañas',
        icon: 'pi pi-fw pi-calendar',
        items: [
          {
            label: 'Nueva',
            icon: 'pi pi-fw pi-calendar-plus',
          },
          {
            label: 'Obtener',
            icon: 'pi pi-fw pi-calendar',
          },
          {
            label: 'Editar',
            icon: 'pi pi-fw pi-pencil',
          },
        ],
      },
      {
        label: 'Facturas',
        icon: 'pi pi-fw pi-book',
      },
      {
        label: 'Quit',
        icon: 'pi pi-fw pi-power-off',
        routerLink: 'home',
      },
    ];
  }
}