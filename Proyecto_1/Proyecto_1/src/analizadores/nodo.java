package analizadores;
import java.util.ArrayList;

public class nodo {
    
    private String etiqueta;
    private ArrayList<nodo> hijos = new ArrayList<>();
    public String valor = null;
    public boolean cadena = false;
    private int id ;

    public nodo (String etiqueta, int id){
        this.etiqueta = etiqueta;
        this.id = id;
    
    }
    
    public nodo (String etiqueta, String valor, int id){
        this.etiqueta = etiqueta;
        this.id = id;
        this.valor = valor;
    
    }
    
    public void AddHijos(nodo nuevo) {
        hijos.add(nuevo);
    }
    
    public String getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(String etiqueta) {
        this.etiqueta = etiqueta;
    }

    public ArrayList<nodo> getHijos() {
        return hijos;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id; 
    }
    
    public String getValor() {
        return valor;
    }
    
    public void setValor(String valor) {
        this.valor = valor; 
    }
    
    
}


