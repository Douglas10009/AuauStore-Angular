import { Component, Input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

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

  constructor(private router: Router) {}

  cadastrar() {
    // Colocar o service para adicionar ao banco de dados
    alert(`Conta criada com sucesso para ${this.localNome} (${this.localEmail})!`);
    this.router.navigate(['/login']);
  }
}