package analizadores;

/* Este objeto nos va a servir para manejar las tabulaciones de python
    va a recibir una cadena y va a retornar otra con una tab más
    antes del inicio de cada linea
 */
public class Tabulacion {
    
    String codigo = "" ;
    
    public Tabulacion(String contenido){
        
        codigo = contenido.replace("\n", "\n"+" \t");
        codigo = " \t" + codigo;

    }
    
    public String getCodigo(){
            return codigo;
    }
}
