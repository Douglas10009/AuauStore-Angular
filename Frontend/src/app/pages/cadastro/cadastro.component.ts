import { Component, Input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { CardProductsService } from '../../services/card-products.service';
import { Cliente } from '../../interface/Icliente';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: './cadastro.component.html',
  styleUrls: ['./cadastro.component.scss']
})
export class CadastroComponent {
  @Input() localNome = "";
  @Input() localEmail = "";
  @Input() localSenha = "";


  cliente: Cliente = {
    idCliente: 0,
    nome: '',
    idade: 0,
    email: '',
    senha: ''
  };

  constructor(private router: Router, private cardProductsService: CardProductsService) { }

  cadastrar() {
    // Colocar o service para adicionar ao banco de dados
    
    this.cardProductsService.addClient(this.cliente).subscribe(
      (response) => {
        console.log('Cliente cadastrado com sucesso!', response);
      },
      (error) => {
        console.error('Erro ao cadastrar cliente:', error);
      }
    );



    alert(`Conta criada com sucesso para ${this.localNome} (${this.localEmail})!`);
    this.router.navigate(['/login']);
  }
}