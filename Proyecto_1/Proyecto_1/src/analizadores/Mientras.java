package analizadores;

public class Mientras {
    
    public String condicion;
    public String instrucciones;
    public String cache ;
    
    public Mientras(String condicion, String instrucciones){
        
        Tabulacion tab = new Tabulacion(instrucciones);
        cache = "while( " +tab.getCodigo()+ "): \n"+
                "   "+ instrucciones +"\n";
    }
    
    public Mientras(String condicion){       
        cache = "while( " + condicion + "): \n";          
    }
    
    public String getCodigo(){
        return cache;   
    }

}
