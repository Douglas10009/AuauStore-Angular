import { Component } from '@angular/core';
import { HeaderComponent } from "../../components/header/header.component";
import { FooterComponent } from "../../components/footer/footer.component";
import { CardProductsComponent } from "../../components/card-products/card-products.component";
import { ProdutosCaninos } from '../../interface/IprodutosCaninos';
import { CardProductsService } from '../../services/card-products.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-products',
  standalone: true,
  imports: [HeaderComponent, FooterComponent, CardProductsComponent, CommonModule],
  templateUrl: './products.component.html',
  styleUrl: './products.component.scss'
})
export class ProductsComponent {

    // --------------------------
    // CÓDIGO REUTILIZADO DO home.component.html
    produtosCaninos!: ProdutosCaninos[]

    constructor (private cardProductsService:CardProductsService) {}
  
    ngOnInit(){
      this.cardProductsService.getProducts().subscribe((products) => {
        this.produtosCaninos = products
      })
    }

    // --------------------------
}
