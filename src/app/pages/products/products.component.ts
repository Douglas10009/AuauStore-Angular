import { Component } from '@angular/core';
import { HeaderComponent } from "../../components/header/header.component";
import { FooterComponent } from "../../components/footer/footer.component";
import { CardProductsComponent } from "../../components/card-products/card-products.component";

@Component({
  selector: 'app-products',
  standalone: true,
  imports: [HeaderComponent, FooterComponent, CardProductsComponent],
  templateUrl: './products.component.html',
  styleUrl: './products.component.scss'
})
export class ProductsComponent {

}
