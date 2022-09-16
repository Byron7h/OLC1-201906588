/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package analizadores;




/**
              pr_si EXPRE pr_entonces INSTRUCCIONES pr_fin_si
            | pr_si EXPRE pr_entonces INSTRUCCIONES pr_de_lo_contrario INSTRUCCIONES pr_fin_si
            | pr_si EXPRE pr_entonces INSTRUCCIONES RAMIFICACION pr_fin_si
            | pr_si EXPRE pr_entonces INSTRUCCIONES RAMIFICACION pr_de_lo_contrario INSTRUCCIONES pr_fin_si
 */
public class Si {
    
    public String cache = "";

    public Si (String expre, String instrucciones){
        
        cache = "if " + expre +" : \n"+
                "   "+ instrucciones +"\n";  

    }
    
    public Si (boolean de_lo_contra, String expre, String instrucciones, String tentativa){
        
        // tiene else y no elif
        if (de_lo_contra){
            cache = "if " + expre +" : \n"+
            "   "+ instrucciones +"\n"+
            "else: \n"+
            "   "+ tentativa +"\n";           
            
        // tiene elif sin else
        }else{
            cache = "if " + expre +" : \n"+
                "   "+ instrucciones +"\n"+
                tentativa + "\n";             
            }   
    }
    
    
    public Si (String expre, String instrucciones, String ramificacion, String I_de_lo_contra){
           
        cache = "if " + expre +" : \n"+
                "   "+ instrucciones +"\n"+
                ramificacion + "\n"+
                "else: \n"+
                "   "+ I_de_lo_contra +"\n";             
    } 
    
    public String get_codigo(){
        return cache;
    }
}
/*if primera_condicion:
ejecutar sentencia
elif segunda_condicion:*/