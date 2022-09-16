/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadores;

/**
 *
 * @author usuario
 */
public class Lista_segun {
    //duda1 EXPRE duda2 pr_entonces INSTRUCCIONES
    public String cache = "";
  
    public Lista_segun(String variable, String expre, String instruccion){
        
        cache = "elif " + variable + " == "+ expre+" : \n" + 
                "   "+ instruccion + "\n";
    }     
    
    public String get_codigo(){
        return cache;
    }
    
}
