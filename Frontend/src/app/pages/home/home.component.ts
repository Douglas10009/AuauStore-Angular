import { Component } from '@angular/core';
import { HeaderComponent } from '../../components/header/header.component';
import { CardProductsComponent } from '../../components/card-products/card-products.component';
import { FooterComponent } from "../../components/footer/footer.component";
import { CardProductsService } from '../../services/card-products.service';
import { ProdutosCaninos } from '../../interface/IprodutosCaninos';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [HeaderComponent, CardProductsComponent, FooterComponent, CommonModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
})
export class HomeComponent {
  produtosCaninos!: ProdutosCaninos[]

  constructor (private cardProductsService:CardProductsService) {}

  ngOnInit(){
    this.cardProductsService.getProducts().subscribe((products) => {
      this.produtosCaninos = products
    })
  }
}
