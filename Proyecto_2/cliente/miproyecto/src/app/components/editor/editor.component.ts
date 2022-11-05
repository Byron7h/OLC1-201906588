import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-editor',
  templateUrl: './editor.component.html',
  styleUrls: ['./editor.component.css']
})
export class EditorComponent implements OnInit {

  constructor( private service: UserService) {

    

   } //este user service es el que creammos, en .services

  
  


  ngOnInit(): void {
  }


  // cuando presione ese botón va a llamar a este evento
  // esta es la funcion que tenemos en el service
  //acá le podíamos enviar parámetros
  geterrores(){
    this.service.geterrores().subscribe(

      // si todo ok entra acá
      (res)=>{
        console.log("ñego hasta acá")
        console.log(res)
        
      },
      
      
      //  si no esta todo ok entra acá
      (err)=>{
        console.log(err)
      }
      
      )


    
                          
    // return info

  }


  posttexto(){

    var texto : any = document.getElementById("area_texto") ;
    this.service.posttexto(texto.value).subscribe(

      // si todo ok entra acá
      (res)=>{
        console.log("LLEGÓ AL POST")
        console.log(res)

        var resp :JSON = res
        var contenido : string = resp.['msg']
        this.codigo_dot(resp)
        
      },
      
      
      //  si no esta todo ok entra acá
      (err)=>{
        console.log("ERROR EN EL POST")
        console.log(err)
      }
      
      )


    
                          
    // return info

  }

  codigo_dot( codigo : string){


    //var nueva1  = codigo.replace("->", "||");
    //console.log(nueva1)



    console.log("llegóa l dot")
    var salida : any = document.getElementById("area_texto2")
    salida.value = codigo

  }


}
