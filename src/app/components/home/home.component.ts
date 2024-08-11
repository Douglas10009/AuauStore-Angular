import { Component } from '@angular/core';
import { HeaderComponent } from '../header/header.component';
import { CardProductsComponent } from '../card-products/card-products.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [HeaderComponent, CardProductsComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
})
export class HomeComponent {

}
