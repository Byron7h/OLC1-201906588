/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_1;

import analizadores.Analizador_Lexico;
import analizadores.nodo;
import analizadores.Analizador_sintactico;
import analizadores.TError;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.LinkedList;

import analizadores.Analizador_sintactico_2;





public class Proyecto_1 {
    
    
    

    public static String cache = "";
    public static nodo padre = Analizador_sintactico.padre;
    
    public static void main(String[] args) {
        
        
        Ventana_principal ventana = new Ventana_principal();
        ventana.setVisible(true);
        ventana.setLocationRelativeTo(null); // Acá le decimos que nos la coloque en el centro
        
        


        
        /*
        
        try {
            
            Analizador_Lexico lexico = new Analizador_Lexico( new BufferedReader(new FileReader("./entrada.txt"))

            );
            
            Analizador_sintactico sintactico = new Analizador_sintactico(lexico);
            System.out.println("");
            sintactico.parse();
            
            if ( Analizador_Lexico.errores.isEmpty()  && Analizador_sintactico.errores.isEmpty()){ //hacemos todo el proceso
                
                System.out.println("No se encontraron errores");
                AST();
                Analizador_Lexico lexic = new Analizador_Lexico( new BufferedReader(new FileReader("./entrada.txt")));
                Analizador_sintactico_2 sintactico_2 = new Analizador_sintactico_2(lexic);
                sintactico_2.parse();
                System.out.println("++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                System.out.println(Analizador_sintactico_2.cache);
                
                
            }else{

                System.out.println("Se encontraron errores en el archivo de entrada");
                reporte_errores(Analizador_Lexico.errores,Analizador_sintactico.errores );
                            System.out.println("llego5");
                AST();
            }
            
            
            
            
            String cach = Analizador_sintactico.padre.valor;
            System.out.println(cach);
        } catch (Exception e) {
            
        }
        
        */
    }

    
}
