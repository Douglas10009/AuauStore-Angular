import { Component, input, Input } from '@angular/core';
import { RouterLink } from '@angular/router';
import { Cliente } from '../../interface/Icliente';
import { ClientService } from '../../services/cliente.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [RouterLink],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent {
    @Input() localNome = "";
    @Input() localSenha = "";

    // --------------------------
    // CÓDIGO REUTILIZADO DO home.component.html
    Clientes!: Cliente[]

    constructor (private clienteService:ClientService) {}
  
    ngOnInit(){
      this.clienteService.getProducts().subscribe((clientes) => {
        this.Clientes = clientes
      })
    }

    // --------------------------

    ngOnChange(){
        alert('hola');
        if (this.localNome == 'a') {
            alert("hola")
        }

    }

    ngOnSubmit(){
        alert("Submit");
    }

    
}
