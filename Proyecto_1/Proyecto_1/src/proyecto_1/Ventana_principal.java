/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto_1;

import analizadores.Analizador_Lexico;
import analizadores.Analizador_sintactico;
import analizadores.Analizador_sintactico_2;
import analizadores.TError;
import analizadores.nodo;
import java.awt.Desktop;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.LinkedList;
import javax.swing.JOptionPane;


/**
 *
 * @author usuario
 */
public class Ventana_principal extends javax.swing.JFrame {

    /**
     * Creates new form Ventana_principal
     */
    
    public String codigo_original;
    public String codigo_python;
    public String cache;
    
    
    public Ventana_principal() {
        initComponents();
    }

    public void AST(){
        
        cache  = "digraph structs {\n"+
                "    fontname=\"Helvetica,Arial,sans-serif\"\n"+
                "    node [shape=record, fontname=\"Helvetica,Arial,sans-serif\" ];\n ";
       
        AST(Analizador_sintactico.padre);
        cache += "}";
        System.out.println(cache);
        GenerarImagen("AST", cache);
        cache ="";
        

        
    
    
    
    }
    public void AST(nodo actual){
        
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
    
    
            public static void no_reporte_errores(){
            int contador = 1;
            
            try{
   
            String ruta = "C:\\Users\\usuario\\Documents\\Byron\\U\\8vo Semestre\\Compi_1\\OLC1-201906588\\Proyecto_1\\Proyecto_1\\Reportes\\Reporte_errores.html";
            PrintWriter writer = new PrintWriter(ruta, "UTF-8");
            
            writer.println("<link href=\"Reporte_muestra.css\" rel=\"stylesheet\">");
            writer.println("<body>");
            writer.println("    <div id=\"wrapper\">");

            writer.println("    <h2> No se encontraron errores </h2>");
              
            writer.println("</BODY>");
            writer.println("</HTML>");
            writer.close();
            
            }catch (Exception e) {
            e.printStackTrace();
            }

    }
    
    
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        Original = new java.awt.TextArea();
        python = new java.awt.TextArea();
        button1 = new java.awt.Button();
        jComboBox1 = new javax.swing.JComboBox<>();
        jComboBox2 = new javax.swing.JComboBox<>();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setBackground(new java.awt.Color(255, 255, 255));

        Original.setCursor(new java.awt.Cursor(java.awt.Cursor.TEXT_CURSOR));
        Original.setFont(new java.awt.Font("Dialog", 0, 18)); // NOI18N

        python.setEditable(false);
        python.setFont(new java.awt.Font("Dialog", 0, 18)); // NOI18N

        button1.setLabel("TRADUCIR");
        button1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                button1ActionPerformed(evt);
            }
        });

        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Reportes", "Errores", "AST" }));
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        jComboBox2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "Item 1", "Item 2", "Item 3", "Item 4" }));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(Original, javax.swing.GroupLayout.DEFAULT_SIZE, 733, Short.MAX_VALUE)
                        .addComponent(python, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(button1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 343, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(30, 30, 30)
                        .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, 343, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap(18, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(46, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jComboBox2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(30, 30, 30)
                .addComponent(Original, javax.swing.GroupLayout.PREFERRED_SIZE, 233, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(33, 33, 33)
                .addComponent(button1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(29, 29, 29)
                .addComponent(python, javax.swing.GroupLayout.PREFERRED_SIZE, 223, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(27, 27, 27))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    
    // • BOTON TRADUCIR 
    private void button1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_button1ActionPerformed
        if (!Original.getText().equals("")){
            

            
            
            
            try {
                        
            
            Analizador_Lexico lexico = new Analizador_Lexico(new StringReader(Original.getText()));
            
            Analizador_sintactico sintactico = new Analizador_sintactico(lexico);
            System.out.println("");
            sintactico.parse();
            
            if ( Analizador_Lexico.errores.isEmpty()  && Analizador_sintactico.errores.isEmpty()){ //hacemos todo el proceso
                
                AST();
                no_reporte_errores();
                JOptionPane.showMessageDialog(this, "Texto sin errores, se ha generado el AST");

                Analizador_Lexico lexic = new Analizador_Lexico(new StringReader(Original.getText()));
                Analizador_sintactico_2 sintactico_2 = new Analizador_sintactico_2(lexic);
                sintactico_2.parse();
                python.setText(Analizador_sintactico_2.cache);
                
                Analizador_Lexico.errores.clear();
                Analizador_sintactico.errores.clear();
                
            }else{
                JOptionPane.showMessageDialog(this, "Texto con errores, puede verlos a detalle en el apartado de reportes");
                reporte_errores(Analizador_Lexico.errores,Analizador_sintactico.errores );
                Analizador_Lexico.errores.clear();
                Analizador_sintactico.errores.clear();
                AST();
            }
            
        } catch (Exception e) {
            
        }
            
            
            
            
        }
    }//GEN-LAST:event_button1ActionPerformed

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        String item = (String)jComboBox1.getSelectedItem();

        if ("Errores".equals(item)) {

            try {
                File objetofile = new File ("C:\\Users\\usuario\\Documents\\Byron\\U\\8vo Semestre\\Compi_1\\OLC1-201906588\\Proyecto_1\\Proyecto_1\\Reportes\\Reporte_errores.html");
                Desktop.getDesktop().open(objetofile);

            }catch (IOException ex) {
                JOptionPane.showMessageDialog(null, "Archivo no válido");
                System.out.println(ex);
            }
            
            
            
            JOptionPane.showMessageDialog(this, "Errores");
            
         }else{
            try {
                File objetofile = new File ("C:\\Users\\usuario\\Documents\\Byron\\U\\8vo Semestre\\Compi_1\\OLC1-201906588\\Proyecto_1\\Proyecto_1\\Reportes\\AST\\AST.jpg");
                Desktop.getDesktop().open(objetofile);

            }catch (IOException ex) {
                JOptionPane.showMessageDialog(null, "Archivo no válido");
                System.out.println(ex);
            }
            JOptionPane.showMessageDialog(this, "AST");
        
        }
    }//GEN-LAST:event_jComboBox1ActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Ventana_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Ventana_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Ventana_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Ventana_principal.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Ventana_principal().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private java.awt.TextArea Original;
    private java.awt.Button button1;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JComboBox<String> jComboBox2;
    private java.awt.TextArea python;
    // End of variables declaration//GEN-END:variables
}
