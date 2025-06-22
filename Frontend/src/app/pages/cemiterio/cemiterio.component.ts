import { Component } from '@angular/core';
import { HeaderComponent } from '../../components/header/header.component';
import { FooterComponent } from "../../components/footer/footer.component";
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-cemiterio',
  standalone: true,
  imports: [HeaderComponent, FooterComponent, CommonModule],
  templateUrl: './cemiterio.component.html',
  styleUrl: './cemiterio.component.scss'
})
export class CemiterioComponent {
  planos = [
    { nome: 'Básico', preco: 5, descontoVacinas: 10, descontoAdocao: 5, descontoSepultamento: 10, banhoTosa: 1 },
    { nome: 'Intermediário', preco: 10, descontoVacinas: 15, descontoAdocao: 10, descontoSepultamento: 15, banhoTosa: 2 },
    { nome: 'Premium', preco: 15, descontoVacinas: 20, descontoAdocao: 15, descontoSepultamento: 20, banhoTosa: 3 }
  ];
}

