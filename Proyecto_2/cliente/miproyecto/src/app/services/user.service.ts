import { getLocaleDateFormat } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  URL = "http://localhost:8080" //para acceder a nuestro servidor
  constructor( private http:HttpClient) { }


  // funciones
geterrores(){
  return this.http.get(this.URL+'/geterrores')
}

/*
posttexto(){
  return this.http.post(this.URL+'/AST', any)
}
*/


}

