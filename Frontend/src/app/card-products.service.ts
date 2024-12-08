import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ProdutosCaninos } from '../IprodutosCaninos';


@Injectable({
  providedIn: 'root'
})
export class CardProductsService {
  apiUrl = 'http://localhost:3000/produtos';


  constructor(private http: HttpClient) { }
  getProducts():Observable<ProdutosCaninos[]> {
    return this.http.get<ProdutosCaninos[]>(this.apiUrl);
  }

 
}

