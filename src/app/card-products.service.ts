import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class CardProductsService {
  apiUrl = 'http://localhost:3000/products';

  constructor(private http:HttpClient) { }

 

  // async getAllProducts(): Promise<any[]> {
  //   const data = await fetch(this.apiUrl);
  //   return await data.json() ?? [];
  // }
}
