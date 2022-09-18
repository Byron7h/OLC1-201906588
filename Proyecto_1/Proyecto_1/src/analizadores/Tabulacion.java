package analizadores;

/* Este objeto nos va a servir para manejar las tabulaciones de python
    va a recibir una cadena y va a retornar otra con una tab más
    antes del inicio de cada linea
 */
public class Tabulacion {
    
    String codigo = "" ;
    
    public Tabulacion(String contenido){
        
        String[] cadena = contenido.split("\n");  
   
        for (String linea : cadena){          
            codigo += codigo + "\t" + linea + "\n";     
        }
    }
    
    public String getCodigo(){
            return codigo;
    }
}
