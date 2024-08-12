import { Component } from '@angular/core';
import { HeaderComponent } from '../header/header.component';
import { CardProductsComponent } from '../card-products/card-products.component';
import { FooterComponent } from "../footer/footer.component";

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [HeaderComponent, CardProductsComponent, FooterComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
})
export class HomeComponent {

}
