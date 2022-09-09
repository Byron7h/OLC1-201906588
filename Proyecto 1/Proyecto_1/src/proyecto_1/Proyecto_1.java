/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_1;

import analizadores.Analizador_Lexico_;
import analizadores.Analizador_sintactico;
import java.io.BufferedReader;
import java.io.FileReader;



/**
 *
 * @author usuario
 */
public class Proyecto_1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
try {
Analizador_Lexico_ lexico = new Analizador_Lexico_(
new BufferedReader(new FileReader("./entrada.txt"))
);
Analizador_sintactico sintactico = new Analizador_sintactico(lexico);
sintactico.parse();
} catch (Exception e) {
}

    }
    
    
}
