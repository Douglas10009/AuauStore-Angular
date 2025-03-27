import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { HeaderComponent } from '../../components/header/header.component';
import { FooterComponent } from '../../components/footer/footer.component';

@Component({
  selector: 'app-carteirinha',
  standalone: true,
  imports: [HeaderComponent, FooterComponent, CommonModule],
  templateUrl: './carteirinha.component.html',
  styleUrl: './carteirinha.component.scss'
})
export class CarteirinhaComponent {

  rows = Array.from({ length: 6 }); 
}
