import { Component, Input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Cliente } from '../../interface/Icliente';
import { ClientService } from '../../services/cliente.service';
import { FormsModule, NgModel } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [RouterLink, CommonModule, FormsModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {
  @Input() localNome = "";   // <-- Novo campo, se quiser capturar nome
  @Input() localEmail = "";
  @Input() localSenha = "";

  Clientes!: Cliente[];
  router!: Router;

  constructor(private clienteService: ClientService, router: Router) {
    this.router = router;
  }

  ngOnInit() {
    this.clienteService.getClientes().subscribe((clientes) => {
      this.Clientes = clientes;
    });
  }

  login() {
    




    // =-=-=- APAGAR ISSO -=-=-=-=-
    console.log(this.Clientes);    
    // =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-


    let naoTemLogin = true;

    this.Clientes.forEach(cliente => {
      if (cliente.email === this.localEmail && cliente.senha === this.localSenha) {
        alert("Login Realizado, seja bem-vindo: " + cliente.nome);
        naoTemLogin = false;
        this.router.navigate(['/adocao']);
      }
    });

    if (naoTemLogin) {
      alert("Login não encontrado");
    }
  }
}