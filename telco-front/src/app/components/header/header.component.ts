import { Component, OnInit } from '@angular/core';
import { MenuItem } from 'primeng/api';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit{
  items: MenuItem[] | undefined;

  ngOnInit() {
      this.items = [
        {
          label: 'Clientes',
          icon: 'pi pi-fw pi-user',
          items: [
              {
                  label: 'Nuevo',
                  icon: 'pi pi-fw pi-user-plus',
                  routerLink: '/customers'
              },
              {
                  label: 'Buscar',
                  icon: 'pi pi-fw pi-users',
                  items: [
                      {
                          label: 'Por Id',
                          icon: 'pi pi-fw pi-filter',
                      },
                      {
                          icon: 'pi pi-fw pi-bars',
                          label: 'Por Documento '
                      }
                  ]
              },
              {
                label: 'Editar',
                icon: 'pi pi-fw pi-user-plus'
            }
          ]
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
                      separator: true
                  },
                  {
                      label: 'Export',
                      icon: 'pi pi-fw pi-external-link'
                  }
              ]
          },
          {
              label: 'Campañas',
              icon: 'pi pi-fw pi-calendar',
              items: [
                  {
                      label: 'Nueva',
                      icon: 'pi pi-fw pi-pencil'
                  },
                  {
                      label: 'Obtener',
                      icon: 'pi pi-fw pi-align-right'
                  },
                  {
                      label: 'Editar',
                      icon: 'pi pi-fw pi-align-center'
                  }
              ]
          },
          {
              label: 'Facturas',
              icon: 'pi pi-fw pi-book'
          },
          {
              label: 'Quit',
              icon: 'pi pi-fw pi-power-off'
          }
      ];
  }
}
