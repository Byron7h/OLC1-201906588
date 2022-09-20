
package analizadores;

/* Este método es válido para funciones y métodos, por la forma en 
que contruimos la gramática*/

public class Metodo {
    
    String id;
    String parametros;
    String instrucciones;
    String cache;
       
    public Metodo(String id,String parametros,String instrucciones){
        
        cache = "def " + id  + "( "+ parametros +" ): \n";
        Tabulacion nueva = new Tabulacion(instrucciones);
        cache += nueva.getCodigo();       
    }
    
    public Metodo(String id,String instrucciones){
        cache = "def " + id  + "(): \n";
        Tabulacion nueva = new Tabulacion(instrucciones);
        cache += nueva.getCodigo();   
    }
    
    public String getCodigo(){
        return cache;   
    }
}
