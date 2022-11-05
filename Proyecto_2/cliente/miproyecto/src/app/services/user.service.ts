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
  console.log("llego a la funcion")
  return this.http.get('http://localhost:8080/errores')
}

posttexto(text:string){
  console.log("llego a la funcion post")
  return this.http.post('http://localhost:8080/AST',{"texto":text})
}

/*
posttexto(){
  return this.http.post(this.URL+'/AST', any)
}
*/


}

