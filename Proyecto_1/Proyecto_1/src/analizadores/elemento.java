
package analizadores;
import java.util.ArrayList;


public class elemento {
    
    
    public String nombre;
    public elemento padre;  
    public ArrayList<elemento> hijos = new ArrayList<elemento>(); 
    
    public elemento(String nombre) {
        this.nombre= nombre;

    }
    
    
    public void agregar_hijo(String nombre) { //retorna una cadena de informacion 
        elemento nuevo = new elemento (nombre);
        nuevo.padre = this;
        hijos.add(nuevo);
    }

        
    
    
    
}
