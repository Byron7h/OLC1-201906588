package analizadores;


public class Repetir {
    
    public String condicion;
    public String instrucciones;
    public String cache ;
    
    public Repetir ( String instrucciones, String condicion){
        
        Tabulacion tab = new Tabulacion(instrucciones);
        
        cache = "valor = "+condicion+"\n"+
                "while valor == true \n"+
                tab.getCodigo() +"\n"+
                "   if valor == false:\n "+
                "       break\n";
 
    }
    
    public Repetir ( String condicion){
        
        cache = "valor = "+condicion+"\n"+
                "while valor == true \n"+
                "   if valor == false:\n "+
                "       break\n";
    }
    
    
    public String getCodigo(){
        return cache;   
    }

    
}
