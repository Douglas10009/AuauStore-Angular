import { Component, Input } from '@angular/core';

import { ProdutosCaninos } from '../../../IprodutosCaninos';
import { CardProductsService } from '../../card-products.service';
import { CommonModule, NgClass } from '@angular/common';

@Component({
  selector: 'app-card-products',
  standalone: true,
  imports: [CommonModule, NgClass],
  templateUrl: './card-products.component.html',
  styleUrl: './card-products.component.scss'
})
export class CardProductsComponent {

  // ! nunca vai existir um instancia do componente sem o produtos estar definido
  @Input() produtoCanino!: ProdutosCaninos


  constructor (private cardProductsService:CardProductsService) {}


}
