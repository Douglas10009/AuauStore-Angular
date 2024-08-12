import { Component, inject, Input } from '@angular/core';

import { ProdutosCaninos } from '../../../IprodutosCaninos';
import { CardProductsService } from '../../card-products.service';
import { HttpClient } from '@angular/common/http';
import { CommonModule, NgClass } from '@angular/common';

@Component({
  selector: 'app-card-products',
  standalone: true,
  imports: [CommonModule, NgClass],
  // services: [HttpClient],
  templateUrl: './card-products.component.html',
  styleUrl: './card-products.component.scss'
})
export class CardProductsComponent {
  @Input() srcImage: string = '';
  @Input() AltImage: string = '';
  @Input() title: string = '';
  @Input() description: string = '';
  @Input() price: number = 0;

  // produtosCaninos: any[] = [];


  // constructor (private cardProductsService:CardProductsComponent) {
  //   this.cardProductsService
  // }

  // products: any[] = [];

  // httpClient = inject(HttpClient)
  // ngOnInit(){
  //   this.httpClient.get<any>('/products').subscribe((products)=> {
  //     this.products = products
  //   })
  // }


}
