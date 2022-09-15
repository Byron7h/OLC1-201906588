package analizadores;

public class Mientras {
    
    public String condicion;
    public String instrucciones;
    public String cache ;
    
    public Mientras(String condicion, String instrucciones){       
        cache = "while( " + condicion + "): \n"+
                "   "+ instrucciones +"\n";
    }
    
    public Mientras(String condicion){       
        cache = "while( " + condicion + "): \n";          
    }
    
    public String get_codigo(){
        return cache;   
    }

}
