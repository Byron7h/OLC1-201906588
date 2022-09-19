
package analizadores;

public class Ramificacion {
    
    public String cache = "";
  
    public Ramificacion(String condicion, String instrucciones){
 
        Tabulacion tab = new Tabulacion(instrucciones);
        cache = "elif"+" " + condicion + " : \n" + 
                tab.getCodigo() + "\n";
    }     
    
    public String getCodigo(){
        return cache;
    }
}
