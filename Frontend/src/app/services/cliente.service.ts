import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Cliente } from '../interface/Icliente'

@Injectable({
    providedIn: 'root',
})
export class ClientService {
    apiUrl = 'http://localhost:3000/clientes'; //Ainda não existe 

    constructor(private http: HttpClient) {}

    getProducts(): Observable<Cliente[]> {
        return this.http.get<Cliente[]>(this.apiUrl);
    }
}
