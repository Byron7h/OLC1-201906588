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





public class Proyecto_1 {

    public static String cache = "";
    public static nodo padre = Analizador_sintactico.padre;
    
    public static void main(String[] args) {
        try {
            
            Analizador_Lexico lexico = new Analizador_Lexico(
            new BufferedReader(new FileReader("./entrada.txt"))

            );
            
            Analizador_sintactico sintactico = new Analizador_sintactico(lexico);
            sintactico.parse();
            
            if ( Analizador_Lexico.errores.isEmpty()  && Analizador_sintactico.errores.isEmpty()){ //hacemos todo el proceso
                System.out.println("No se encontraron errores");
                AST();

            }else{

                System.out.println("Se encontraron errores en el archivo de entrada");
                reporte_errores(Analizador_Lexico.errores,Analizador_sintactico.errores );
                AST();
            }
            
            
            
            
            String cache = Analizador_sintactico.cache;
            System.out.println(cache);
        } catch (Exception e) {
            
        }
    }
    public static void AST(){
        
        cache  = "digraph structs {\n"+
                "    fontname=\"Helvetica,Arial,sans-serif\"\n"+
                "    node [shape=record, fontname=\"Helvetica,Arial,sans-serif\" ];\n ";
       
        AST(Analizador_sintactico.padre);
        cache += "}";
        System.out.println(cache);
        GenerarImagen("AST", cache);
        cache ="";
        

        
    
    
    
    }
    public static void AST(nodo actual){
        
        if(actual.cadena){
            cache += "    "+actual.getId()+" [label="+actual.getEtiqueta()+"];\n";
        }else{
     
            cache += "    "+actual.getId()+" [label=\""+actual.getEtiqueta()+"\"];\n";
        }
        ArrayList<nodo> hijos = actual.getHijos();
        String aux= ""; 
        
        if(!hijos.isEmpty() ){

            for(nodo i : hijos){        
                cache += "    "+actual.getId()+" -> "+i.getId()+";\n";
                AST(i);
            }
                  
        }

        
        
        
        
      /*                           result += "    subgraph cluster_"+nombre_padre+" {\n"
                                    + "      color = white;\n"
                                    + "      "+nombre_izquierda+"; "+nombre_derecha+"; }\n";/          
          
    */
    }
        public static void GenerarImagen(String nombre, String txtDTO) {
        try {
            // creamos un nuevo archivo txt
            String contenido = txtDTO;
            File file = new File("C:\\Users\\usuario\\Documents\\Byron\\U\\8vo Semestre\\Compi_1\\OLC1-201906588\\Proyecto_1\\Proyecto_1\\Reportes\\AST\\"+nombre + ".txt");

            if (!file.exists()) {
                file.createNewFile();
            }
            
            // Le escribimos nuestro codigo dto
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(contenido);
            bw.close();

            //---------Compilar el dto
            
            // ruta de dot.exe, mi equipo -> archivos del programa -> graphviz -> bin ->dot

            String dotPath = "C:\\Program Files\\Graphviz\\bin\\dot.exe";
            String fileIn = file.getCanonicalPath(); //esto es para obtener la ruta
            String fileOU = fileIn.replace(".txt", ".jpg"); // salida de imagen
            String tParam = "-Tjpg";
            String tOparam = "-o";

            String[] cmd = new String[5]; // cadena de cadenas 
            cmd[0] = dotPath;
            cmd[1] = tParam;
            cmd[2] = fileIn;
            cmd[3] = tOparam;
            cmd[4] = fileOU;

            Runtime rt = Runtime.getRuntime(); //herramienta para ejecutar comandos
            rt.exec(cmd);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
            public static void reporte_errores(LinkedList<TError> lexico , LinkedList<TError> sintactico){

            int contador = 1;
            
            try{
   
            String ruta = "C:\\Users\\usuario\\Documents\\Byron\\U\\8vo Semestre\\Compi_1\\OLC1-201906588\\Proyecto_1\\Proyecto_1\\Reportes\\Reporte_errores.html";
            PrintWriter writer = new PrintWriter(ruta, "UTF-8");
            
            writer.println("<link href=\"Reporte_muestra.css\" rel=\"stylesheet\">");
            writer.println("<body>");
            writer.println("    <div id=\"wrapper\">");

            writer.println("    <h2> Reporte de errores </h2>");
            writer.println("    <table id=\"keywords\" cellspacing=\"0\" cellpadding=\"0\">");
            writer.println("        <thead>");
            writer.println("        <tr>");
            
            writer.println("            <th><span>#</span></th>");
            writer.println("            <th><span>Tipo</span></th>");
            writer.println("            <th><span>Descripcion</span></th>");
            writer.println("            <th><span>Lexema</span></th>");
            writer.println("            <th><span>Fila</span></th>");
            writer.println("            <th><span>Columna</span></th>");

            writer.println("        </tr>");
            writer.println("        </thead>");
            writer.println("        <tbody>");
            
            for (TError error : lexico) { 
                writer.println("            <tr>");
                writer.println("                <td>"+contador+"</td>");
                writer.println("                <td>Lexico</td>");
                writer.println("                <td>"+error.descripcion+"</td>");  
                writer.println("                <td>"+error.lexema+"</td>");
                writer.println("                <td>"+error.linea+"</td>");
                writer.println("                <td>"+error.columna+"</td>"); 
                writer.println("            </tr>");
                contador++;
            }
            
            for (TError error : sintactico) { 
                writer.println("            <tr>");
                writer.println("                <td>"+contador+"</td>");
                writer.println("                <td>Sintáctico</td>");
                writer.println("                <td>"+error.descripcion+"</td>");  
                writer.println("                <td>"+error.lexema+"</td>");
                writer.println("                <td>"+error.linea+"</td>");
                writer.println("                <td>"+error.columna+"</td>"); 
                writer.println("            </tr>");
                contador++;
            }
            
            
            
            
            writer.println("        </tbody>");
            writer.println("    </table>");
            
      
            writer.println("</BODY>");
            writer.println("</HTML>");
            writer.close();
            
            }catch (Exception e) {
            e.printStackTrace();
            }

    }
    
}
