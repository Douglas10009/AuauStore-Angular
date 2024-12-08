import { Component, Input } from '@angular/core';

import { ProdutosCaninos } from '../../interface/IprodutosCaninos';
import { CardProductsService } from '../../services/card-products.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-card-products',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './card-products.component.html',
  styleUrl: './card-products.component.scss'
})
export class CardProductsComponent {

  // ! nunca vai existir um instancia do componente sem o produtos estar definido
  @Input() produtoCanino!: ProdutosCaninos


  constructor (private cardProductsService:CardProductsService) {}


}
