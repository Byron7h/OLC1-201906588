
package analizadores;

public class Ramificacion {
    
    public String cache = "";
  
    public Ramificacion(String condicion, String instruccion){
        
        cache = "elif"+" " + condicion + " : \n" + 
                "   "+instruccion;
    }     
    
    public String get_codigo(){
        return cache;
    }
}
