
package analizadores;

public class Para {
    
    public String variable;
    public String R1;
    public String R2;
    public String instrucciones;
    public String incremento = "1";
    public String cache ;
    public boolean instru;

    // Con incremento e instrucciones
    public Para(String variable,String R1, String R2, String incremento, String instrucciones){
        cache = "for " + variable + " in range( "+ R1 + " , "+ R2 +" , "+ incremento+"):"+
                "   "+ instrucciones; 
    }
    
    
    // solo con incremento o solo con instruccion
    public Para(boolean instru, String variable,String R1, String R2, String tentativa){
        
        // con istruccion, sin incremento
        if (instru){
            cache = "for " + variable + " in range( "+ R1 + " , "+ R2 +" , "+ incremento+"):"+
            "   "+ tentativa; 
            
        // sin istruccion, con incremento    
        }else{
            cache = "for " + variable + " in range( "+ R1 + " , "+ R2 +" , "+ tentativa+"):"; 
        }
    }
    
    //sin incremento y sin instrucciones
    public Para(String variable,String R1, String R2){
        cache = "for " + variable + " in range( "+ incremento +" , " +R1+" , "+ R2 + "):"; 
    }

    public String get_codigo(){
        return cache;   
    }
 
}
