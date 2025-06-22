import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ProdutosCaninos } from '../interface/IprodutosCaninos';
import { Cliente } from '../interface/Icliente';


@Injectable({
  providedIn: 'root'
})
export class CardProductsService {
  apiUrl = 'http://localhost:3000/produtos';


  constructor(private http: HttpClient) { }
  getProducts():Observable<ProdutosCaninos[]> {
    return this.http.get<ProdutosCaninos[]>(this.apiUrl);
  }

  // Função para adicionar um cliente
  addClient(cliente: Cliente): Observable<ProdutosCaninos[]> {
    return this.http.post<ProdutosCaninos[]>(this.apiUrl, cliente);
  }

 
}

