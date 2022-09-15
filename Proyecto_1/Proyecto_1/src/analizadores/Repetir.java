package analizadores;


public class Repetir {
    
    public String condicion;
    public String instrucciones;
    public String cache ;
    
    public Repetir ( String instrucciones, String condicion){
        
        cache = "valor = "+condicion+"\n"+
                "while valor == true \n"+
                "   "+ instrucciones +"\n"+
                "   if valor == false:\n "+
                "       break\n";
 
    }
    
    public Repetir ( String condicion){
        
        cache = "valor = "+condicion+"\n"+
                "while valor == true \n"+
                "   if valor == false:\n "+
                "       break\n";
    }
    
    
    public String get_codigo(){
        return cache;   
    }

    
}
