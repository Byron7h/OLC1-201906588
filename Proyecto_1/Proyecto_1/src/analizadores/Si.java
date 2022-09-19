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
        
        Tabulacion tab = new Tabulacion(instrucciones);
        cache = "if " + expre +" : \n"+
                tab.getCodigo() +"\n";  

    }
    
    public Si (boolean de_lo_contra, String expre, String instrucciones, String tentativa){
        
        Tabulacion tab = new Tabulacion(instrucciones);

        
        // tiene else y no elif
        if (de_lo_contra){
            Tabulacion tab1 = new Tabulacion(tentativa);
            cache = "if " + expre +" : \n"+
            tab.getCodigo() +"\n"+
            "else: \n"+
            tab1.getCodigo() +"\n";           
            
        // tiene elif sin else
        }else{
            cache = "if " + expre +" : \n"+
                tab.getCodigo() +"\n"+
                tentativa + "\n";             
            }   
    }
    
    
    public Si (String expre, String instrucciones, String ramificacion, String I_de_lo_contra){
        Tabulacion tab = new Tabulacion(instrucciones);
        Tabulacion tab1 = new Tabulacion(I_de_lo_contra);
        cache = "if " + expre +" : \n"+
                tab.getCodigo() +"\n"+
                ramificacion + "\n"+
                "else: \n"+
                tab1.getCodigo() +"\n";             
    } 
    
    public String getCodigo(){
        return cache;
    }
}
/*if primera_condicion:
ejecutar sentencia
elif segunda_condicion:*/