package analizadores;
import java_cup.runtime.*; 
import java.util.LinkedList;

%%

%{
    String cache = "";
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

%%


// Expresiones regulares

letra = [a-zA-Z]
digito = [0-9]
numero_entero = [0-9]+
numero_flotante =  {numero_entero}"."{numero_entero}
id = "_"(letra|"_"|digito)+"_"
cadena = \"[^\"]*\"

// Estados 

<YYINITIAL>{

    "+"           { return new Symbol(Simbolos.tsuma, yycolumn, yyline, yytext());      }
    "-"           { return new Symbol(Simbolos.tresta, yycolumn, yyline, yytext());     }
    "*"           { return new Symbol(Simbolos.tmult, yycolumn, yyline, yytext());      }
    "/"           { return new Symbol(Simbolos.tmul, yycolumn, yyline, yytext());       }
    "potencia"    { return new Symbol(Simbolos.tpot, yycolumn, yyline, yytext());       }
    "mod"         { return new Symbol(Simbolos.tmod, yycolumn, yyline, yytext());       }
    "("           { return new Symbol(Simbolos.tpare1, yycolumn, yyline, yytext());     }
    ")"           { return new Symbol(Simbolos.tpare2, yycolumn, yyline, yytext());     }
    "["           { return new Symbol(Simbolos.tcor1, yycolumn, yyline, yytext());      }
    "]"           { return new Symbol(Simbolos.tcor2, yycolumn, yyline, yytext());      }
    "="           { return new Symbol(Simbolos.tigual, yycolumn, yyline, yytext());     }
    "->"          { return new Symbol(Simbolos.tasignacion, yycolumn, yyline, yytext());}
    ";"           { return new Symbol(Simbolos.tpyc, yycolumn, yyline, yytext());       }
    "//"          { yybegin(ESTADOCOMENTARIO2);}
    "/*"          { yybegin(ESTADOCOMENTARIO);}
    

    "verdadero"         { return new Symbol(Simbolos.tverdadero, yycolumn, yyline, yytext());     }
    "falso"             { return new Symbol(Simbolos.tfalso, yycolumn, yyline, yytext());    }
    "ingresar"          { return new Symbol(Simbolos.tingresar, yycolumn, yyline, yytext());    }
    "como"              { return new Symbol(Simbolos.tcomo, yycolumn, yyline, yytext());     }
    "con_valor"         { return new Symbol(Simbolos.tcon_valor, yycolumn, yyline, yytext());     }
    "si"                { return new Symbol(Simbolos.tsi, yycolumn, yyline, yytext());     }
    "entonces"          { return new Symbol(Simbolos.tentonces, yycolumn, yyline, yytext());     }
    "fin_si"            { return new Symbol(Simbolos.tfin_si, yycolumn, yyline, yytext());     }
    "de_lo_contrario"   { return new Symbol(Simbolos.tde_lo_contrario, yycolumn, yyline, yytext());     }
    "segun"             { return new Symbol(Simbolos.tsegun, yycolumn, yyline, yytext());     }
    "hacer"             { return new Symbol(Simbolos.thacer, yycolumn, yyline, yytext());     }
    "fin_segun"         { return new Symbol(Simbolos.tfin_segun, yycolumn, yyline, yytext());    }
    "para"              { return new Symbol(Simbolos.tpara, yycolumn, yyline, yytext());    }
    "hasta"             { return new Symbol(Simbolos.thasta, yycolumn, yyline, yytext());     }
    "fin_para"          { return new Symbol(Simbolos.tfin_para, yycolumn, yyline, yytext());     }
    "mientras"          { return new Symbol(Simbolos.tmientras, yycolumn, yyline, yytext());     }
    "fin_mientras"      { return new Symbol(Simbolos.tfin_mientras, yycolumn, yyline, yytext());     }
    "repetir"           { return new Symbol(Simbolos.trepetir, yycolumn, yyline, yytext());     }
    "hasta_que"         { return new Symbol(Simbolos.thasta_que, yycolumn, yyline, yytext());     }
    "retomar"           { return new Symbol(Simbolos.tretomar, yycolumn, yyline, yytext());     }
    "metodo"            { return new Symbol(Simbolos.tmetodo, yycolumn, yyline, yytext());     }
    "fin_metodo"        { return new Symbol(Simbolos.tfin_metodo, yycolumn, yyline, yytext());    }
    "con_parametros"    { return new Symbol(Simbolos.tcon_parametros, yycolumn, yyline, yytext());    }
    "funcion"           { return new Symbol(Simbolos.tfuncion, yycolumn, yyline, yytext());     }
    "fin_funcion"       { return new Symbol(Simbolos.tfin_funcion, yycolumn, yyline, yytext());     }
    "ejecutar"          { return new Symbol(Simbolos.tejecutar, yycolumn, yyline, yytext());     }
    "imprimir"          { return new Symbol(Simbolos.timprimir, yycolumn, yyline, yytext());     }
    "imprimir_nl"       { return new Symbol(Simbolos.timprimir_nl, yycolumn, yyline, yytext());     }
    "or"                { return new Symbol(Simbolos.tor, yycolumn, yyline, yytext());     }
    "and"               { return new Symbol(Simbolos.tand, yycolumn, yyline, yytext());     }
    "not"               { return new Symbol(Simbolos.tnot, yycolumn, yyline, yytext());     }
    "mayor"             { return new Symbol(Simbolos.tmayor, yycolumn, yyline, yytext());    }
    "menor"             { return new Symbol(Simbolos.tmenor, yycolumn, yyline, yytext());    }
    "mayor_o_igual"     { return new Symbol(Simbolos.tmayor_o_igual, yycolumn, yyline, yytext());     }
    "menor_o_igual"     { return new Symbol(Simbolos.tmenor_o_igual, yycolumn, yyline, yytext());     }
    "es_igual"          { return new Symbol(Simbolos.tes_igual, yycolumn, yyline, yytext());     }
    "es_diferente"      { return new Symbol(Simbolos.tes_diferente, yycolumn, yyline, yytext());     }


    {numero_entero}     { return new Symbol(Simbolos.tnum, yycolumn, yyline, yytext());     }
    {numero_flotante}   { return new Symbol(Simbolos.tnum, yycolumn, yyline, yytext());     }
    {id}                { return new Symbol(Simbolos.tid, yycolumn, yyline, yytext());     }
    {cadena}            { return new Symbol(Simbolos.tcadena, yycolumn, yyline, yytext());     }

}


<ESTADOCOMENTARIO> {

                    [^"*/"] { 
                                cache += cache + YYTEXT() ;
                                //• CADENA_LEXEMA += CADENA_LEXEMA + YYTEXT() //Acá vamos guardando todos los caracteres de la cadena
                            }      

                    "*/"    { 
                                // Cuando vuelva a encontrar las (") quiere decir que terminó la cadena, por lo que se guarda y se traslada al estado inicial de nuevo
                                System.out.println("Fin del estado cadena");
                                yybegin(YYINITIAL); 
                                System.out.println("Reconocio token:<cadena>");
                                return new Symbol(Simbolos.comentario_multilinea, yycolumn, yyline, cache);   
                                cache = "";
                            }
}

<ESTADOCOMENTARIO2> {

                    [^\n] { 
                                cache += cache + YYTEXT() ;
                                //• CADENA_LEXEMA += CADENA_LEXEMA + YYTEXT() //Acá vamos guardando todos los caracteres de la cadena
                            }      

                    [\n]    { 
                                // Cuando vuelva a encontrar las (") quiere decir que terminó la cadena, por lo que se guarda y se traslada al estado inicial de nuevo
                                System.out.println("Fin del estado cadena");
                                yybegin(YYINITIAL); 
                                System.out.println("Reconocio token:<cadena>");
                                return new Symbol(Simbolos.comentario_unilinea, yycolumn, yyline, cache);   
                                cache = "";
                            }
}





[ \t\r\n\f]             { /* Espacios en blanco, se ignoran */	}

.                     	{
                            System.out.println("Error Lexico : "+yytext()+ "Linea"+yyline+" Columna "+yycolumn);
                        }
