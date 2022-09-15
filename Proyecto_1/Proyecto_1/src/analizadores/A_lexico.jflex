package analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

%%

%{
    public static LinkedList<TError> errores = new LinkedList<TError>();
%}

%public
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

// Expresiones regulares
letra = [a-zA-Z]
digito = [0-9]
numero_entero = {digito}+
numero_flotante =  {numero_entero}"."{numero_entero}
id = "_"({letra}|"_"|{digito})+"_"
cadena = \"[^\"]*\"
comentario_uni = "//"[^\n]*[\n]
comentario_multi = "/*"["*"]*[^"*/"]*["*"]*"*/"
caracter = (\'{letra}\')|("${"{digito}{digito}{digito}"}")|("${"{digito}{digito}"}")



%%
 
<YYINITIAL>{

    // Comentarios

    {comentario_uni}    { System.out.println("Reconocio token:<comentario_uni> lexema:" +yytext());}

    {comentario_multi}  { System.out.println("Reconocio token:<comentario_multi> lexema:" +yytext());}


    // Signos

    "+"           { System.out.println("Reconocio token:<suma> lexema:" +yytext());
                    return new Symbol(Simbolos.suma, yycolumn, yyline, yytext());       }

    "-"           { System.out.println("Reconocio token:<tresta> lexema:" +yytext());
                     return new Symbol(Simbolos.resta, yycolumn, yyline, yytext());     }

    "*"           { System.out.println("Reconocio token:<mult> lexema:" +yytext());
                     return new Symbol(Simbolos.mult, yycolumn, yyline, yytext());      }

    "/"           { System.out.println("Reconocio token:<div> lexema:" +yytext());
                     return new Symbol(Simbolos.div, yycolumn, yyline, yytext());       }

    "potencia"    { System.out.println("Reconocio token:<pot> lexema:" +yytext());
                     return new Symbol(Simbolos.pot, yycolumn, yyline, yytext());       }

    "mod"         { System.out.println("Reconocio token:<mod> lexema:" +yytext());
                     return new Symbol(Simbolos.mod, yycolumn, yyline, yytext());       }

    "("           { System.out.println("Reconocio token:<pare1> lexema:" +yytext());
                     return new Symbol(Simbolos.pare1, yycolumn, yyline, yytext());     }

    ")"           { System.out.println("Reconocio token:<pare2> lexema:" +yytext());
                     return new Symbol(Simbolos.pare2, yycolumn, yyline, yytext());     }

    "["           { System.out.println("Reconocio token:<cor1> lexema:" +yytext());
                     return new Symbol(Simbolos.cor1, yycolumn, yyline, yytext());      }

    "]"           { System.out.println("Reconocio token:<cor2> lexema:" +yytext());
                     return new Symbol(Simbolos.cor2, yycolumn, yyline, yytext());      }

    ","           { System.out.println("Reconocio token:<coma> lexema:" +yytext());
                     return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());     }

    [\?]           { System.out.println("Reconocio token:<duda2> lexema:" +yytext());
                     return new Symbol(Simbolos.duda2, yycolumn, yyline, yytext());     }

    [\¿]           { System.out.println("Reconocio token:<duda1> lexema:" +yytext());
                     return new Symbol(Simbolos.duda1, yycolumn, yyline, yytext());     }

    "->"          { System.out.println("Reconocio token:<asignacion> lexema:" +yytext());
                     return new Symbol(Simbolos.asignacion, yycolumn, yyline, yytext());}

    ";"           { System.out.println("Reconocio token:<pyc> lexema:" +yytext());
                     return new Symbol(Simbolos.pyc, yycolumn, yyline, yytext());       }
    
    
    // Palabras recervadas

    "verdadero"         {  System.out.println("Reconocio token:<pr_verdadero> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_verdadero, yycolumn, yyline, yytext());     }

    "falso"             {  System.out.println("Reconocio token:<pr_falso> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_falso, yycolumn, yyline, yytext());    }

    "ingresar"          {  System.out.println("Reconocio token:<pr_ingresar> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_ingresar, yycolumn, yyline, yytext());    }

    "como"              {  System.out.println("Reconocio token:<pr_como> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_como, yycolumn, yyline, yytext());     }

    "con_valor"         {  System.out.println("Reconocio token:<pr_con_valor> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_con_valor, yycolumn, yyline, yytext());     }

    "si"                {  System.out.println("Reconocio token:<pr_si> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_si, yycolumn, yyline, yytext());     }

    "entonces"          {  System.out.println("Reconocio token:<pr_entonces> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_entonces, yycolumn, yyline, yytext());     }

    "fin_si"            {  System.out.println("Reconocio token:<pr_fin_si> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_fin_si, yycolumn, yyline, yytext());     }

    "de_lo_contrario"   {  System.out.println("Reconocio token:<pr_de_lo_contrario> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_de_lo_contrario, yycolumn, yyline, yytext());     }

    "segun"             {  System.out.println("Reconocio token:<pr_segun> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_segun, yycolumn, yyline, yytext());     }

    "hacer"             {  System.out.println("Reconocio token:<pr_hacer> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_hacer, yycolumn, yyline, yytext());     }

    "fin_segun"         {  System.out.println("Reconocio token:<pr_fin_segun> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_fin_segun, yycolumn, yyline, yytext());    }

    "para"              {  System.out.println("Reconocio token:<pr_para> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_para, yycolumn, yyline, yytext());    }

    "hasta"             {  System.out.println("Reconocio token:<pr_hasta> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_hasta, yycolumn, yyline, yytext());     }

    "fin_para"          {  System.out.println("Reconocio token:<pr_fin_para> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_fin_para, yycolumn, yyline, yytext());  }   

    "mientras"          {  System.out.println("Reconocio token:<pr_mientras> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_mientras, yycolumn, yyline, yytext());     }

    "fin_mientras"      {  System.out.println("Reconocio token:<pr_fin_mientras> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_fin_mientras, yycolumn, yyline, yytext());     }

    "repetir"           {  System.out.println("Reconocio token:<pr_repetir> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_repetir, yycolumn, yyline, yytext());     }

    "hasta_que"         {  System.out.println("Reconocio token:<pr_hasta_que> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_hasta_que, yycolumn, yyline, yytext());     }

    "metodo"            {  System.out.println("Reconocio token:<pr_metodo> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_metodo, yycolumn, yyline, yytext());     }

    "fin_metodo"        {  System.out.println("Reconocio token:<pr_fin_metodo> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_fin_metodo, yycolumn, yyline, yytext());    }

    "con_parametros"    {  System.out.println("Reconocio token:<pr_con_parametros> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_con_parametros, yycolumn, yyline, yytext());    }

    "funcion"           {  System.out.println("Reconocio token:<pr_funcion> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_funcion, yycolumn, yyline, yytext());     }

    "fin_funcion"       {  System.out.println("Reconocio token:<pr_fin_funcion> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_fin_funcion, yycolumn, yyline, yytext());     }

    "ejecutar"          {  System.out.println("Reconocio token:<pr_ejecutar> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_ejecutar, yycolumn, yyline, yytext());     }

    "imprimir"          {  System.out.println("Reconocio token:<pr_imprimir> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_imprimir, yycolumn, yyline, yytext());     }

    "imprimir_nl"       {  System.out.println("Reconocio token:<pr_imprimir_nl> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_imprimir_nl, yycolumn, yyline, yytext());     }

    "or"                {  System.out.println("Reconocio token:<pr_or> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_or, yycolumn, yyline, yytext());     }

    "and"               {  System.out.println("Reconocio token:<pr_and> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_and, yycolumn, yyline, yytext());     }

    "not"               {  System.out.println("Reconocio token:<pr_not> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_not, yycolumn, yyline, yytext());     }

    "mayor"             {  System.out.println("Reconocio token:<pr_mayor> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_mayor, yycolumn, yyline, yytext());    }

    "menor"             {  System.out.println("Reconocio token:<pr_menor> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_menor, yycolumn, yyline, yytext());    }

    "mayor_o_igual"     {  System.out.println("Reconocio token:<pr_mayor_o_igual> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_mayor_o_igual, yycolumn, yyline, yytext());     }

    "menor_o_igual"     {  System.out.println("Reconocio token:<pr_menor_o_igual> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_menor_o_igual, yycolumn, yyline, yytext());     }

    "es_igual"          {  System.out.println("Reconocio token:<pr_es_igual> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_es_igual, yycolumn, yyline, yytext());     }

    "es_diferente"      {  System.out.println("Reconocio token:<pr_es_diferente> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_es_diferente, yycolumn, yyline, yytext());     }

    "cadena"            {  System.out.println("Reconocio token:<td_cadena> lexema:" +yytext());
                            return new Symbol(Simbolos.td_cadena, yycolumn, yyline, yytext());     }
                            
    "numero"            {  System.out.println("Reconocio token:<td_numero> lexema:" +yytext());
                            return new Symbol(Simbolos.td_numero, yycolumn, yyline, yytext());     }

    "boolean"           {  System.out.println("Reconocio token:<td_boolean> lexema:" +yytext());
                            return new Symbol(Simbolos.td_boolean, yycolumn, yyline, yytext());     }

    "caracter"          {  System.out.println("Reconocio token:<td_caracter> lexema:" +yytext());
                            return new Symbol(Simbolos.td_caracter, yycolumn, yyline, yytext());     }
   
    "inicio"            {  System.out.println("Reconocio token:<pr_inicio> lexema:" +yytext());
                          return new Symbol(Simbolos.pr_inicio, yycolumn, yyline, yytext());     }

    "fin"               {  System.out.println("Reconocio token:<pr_fin> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_fin, yycolumn, yyline, yytext());     }

    "con_incremental"   {  System.out.println("Reconocio token:<pr_con_incremental> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_con_incremental, yycolumn, yyline, yytext());     }

    "retornar"          {  System.out.println("Reconocio token:<pr_retornar> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_retornar, yycolumn, yyline, yytext());     }

    "o_si"              {  System.out.println("Reconocio token:<pr_o_si> lexema:" +yytext());
                            return new Symbol(Simbolos.pr_o_si, yycolumn, yyline, yytext());     }




    // Expresiones regulares

    {numero_entero}     {  System.out.println("Reconocio token:<num> lexema:" +yytext());
                            return new Symbol(Simbolos.num, yycolumn, yyline, yytext());     }

    {numero_flotante}   {  System.out.println("Reconocio token:<num> lexema:" +yytext());
                            return new Symbol(Simbolos.num, yycolumn, yyline, yytext());     }

    {id}                {  System.out.println("Reconocio token:<id> lexema:" +yytext());
                            return new Symbol(Simbolos.id, yycolumn, yyline, yytext());     }

    {cadena}            {  System.out.println("Reconocio token:<cadena> lexema:" +yytext());
                            return new Symbol(Simbolos.cadena, yycolumn, yyline, yytext());     }

    {caracter}            {  System.out.println("Reconocio token:<caracter> lexema:" +yytext());
                            return new Symbol(Simbolos.caracter, yycolumn, yyline, yytext());     }



}






[ \t\r\n\f]             { /* Espacios en blanco, se ignoran */	}

.                     	{                           
                            System.out.println("Reconocio token:<error_lexico> lexema:"+yytext());
                            /*tipo, lexema, descripcion, fila, columna; lo agtegamos a la lista de errores*/
                            TError tmp = new TError("Lexico", yytext(),"Caracter no reconocido", yyline, yycolumn );
                            errores.add(tmp);     
}