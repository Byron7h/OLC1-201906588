 
%{
    // acá vamos a importar todas las clases que necesitemos
    // require es como un import, cada punto antes de la ruta es un directorio hacia atrás del actual, qu sería src
    
    //acá usamos el punto antes de la ruta para buicarnos seguún el directorio
    //const {Declaracion} = require('../instruccion/declaracion');
    //const {Declaracion_2} = require('../instruccion/declaracion_2');
    //const {Type} = require('../symbol/type');
    //const {Arithmetic} = require('../expression/aritmeticas');
    //const {ArithmeticOption} = require('../expression/aritmeticOption');
    //const {Literal} = require('../expression/literal');
    //const {PrintEnv} = require('../instruccion/printEnv');
    //const {Asignacion} = require('../instruccion/asignacion');
    //const {Print} = require('../instruccion/print');
    //const {If} = require('../instruccion/condicionif');
    //const {For} = require('../instruccion/for');
    //const {Relacional} = require('../expression/relacional');
    //const {RelacionalOption} = require('../expression/relacionalOption');
   // const {Logico} = require('../expression/logico');
    //const {LogicoOption} = require('../expression/logicoOptions');
    //const {Casteo} = require('../expression/casteo');
    //const {Buscador} = require('../expression/buscador');
    //const {C_if} = require('../objetos/condiciones_if');
    //const {Statement} = require('../instruccion/Statement');

    const {Nodo} = require('./nodo');
    var contador = 0;

    // const {el nombre con el que lo vamos a usar acá}  = require('ruta');

    //var ides = [];
    //var condiciones_if = [];

%}

%lex
%options case-insensitive

//expresiones regulares  
letter  [a-zA-Z]
number  [0-9]
int     {number}+
double  {int}"."{int}
id      ({letter}|"_")({letter}|"_"|{number})*
bool    "true"|"false" 
string  \"  [^\"]* \" | \“  [^\"]* \”
options [^\']|"\\"|"\n"|"\t"|"\r"|"\\"|"\\'"
char  \' {options} \' 
  

%%




\s+                                 /* skip whitespace */
"//".*                              // comentario simple línea
[/][*][^*]*[*]+([^/*][^*]*[*]+)*[/] // comentario multiple líneas





// • palabras reservadas 
"if"                    { console.log("Se encontró el token <if> con valor: "+ yytext );  return 'tif'} 
"else"                  { console.log("Se encontró el token <else> con valor: "+ yytext ); return 'telse'} 
"elif"                  { console.log("Se encontró el token <elif> con valor: "+ yytext ); return 'telif'} 
"switch"                { console.log("Se encontró el token <switch> con valor: "+ yytext ); return 'tswitch'} 
"case"                  { console.log("Se encontró el token <case> con valor: "+ yytext ); return 'tcase'} 
"for"                   { console.log("Se encontró el token <for> con valor: "+ yytext ); return 'tfor'} 
"do"                    { console.log("Se encontró el token <do> con valor: "+ yytext ); return 'tdo'} 
"void"                  { console.log("Se encontró el token <void> con valor: "+ yytext ); return 'tvoid'} 
"while"                 { console.log("Se encontró el token <while> con valor: "+ yytext ); return 'twhile'} 
"default"               { console.log("Se encontró el token <default> con valor: "+ yytext ); return 'tdefault'} 
"until"                 { console.log("Se encontró el token <until> con valor: "+ yytext ); return 'tuntil'} 
"break"                 { console.log("Se encontró el token <break> con valor: "+ yytext ); return 'tbreak'} 
"continue"              { console.log("Se encontró el token <continue> con valor: "+ yytext ); return 'tcontinue'} 
"return"                { console.log("Se encontró el token <return> con valor: "+ yytext ); return 'treturn'} 

"println"               { console.log("Se encontró el token <println> con valor: "+ yytext ); return 'tprintln'} 
"print"                 { console.log("Se encontró el token <print> con valor: "+ yytext ); return 'tprint'} 

"tolower"               { console.log("Se encontró el token <tolower> con valor: "+ yytext ); return 'ttolower'} 
"toupper"               { console.log("Se encontró el token <toupper> con valor: "+ yytext ); return 'ttoupper'} 
"round"                 { console.log("Se encontró el token <round> con valor: "+ yytext ); return 'tround'} 
"length"                { console.log("Se encontró el token <length> con valor: "+ yytext ); return 'tlength'} 
"typeof"                { console.log("Se encontró el token <typeof> con valor: "+ yytext ); return 'ttypeof'} 
"tostring"              { console.log("Se encontró el token <tostring> con valor: "+ yytext ); return 'ttostring'} 
"tochararray"           { console.log("Se encontró el token <tochar array> con valor: "+ yytext ); return 'ttochararray'} 
"push"                  { console.log("Se encontró el token <push> con valor: "+ yytext ); return 'tpush'} 
"pop"                   { console.log("Se encontró el token <pop> con valor: "+ yytext ); return 'tpop'} 
"run"                   { console.log("Se encontró el token <run> con valor: "+ yytext ); return 'trun'} 
"new"                   { console.log("Se encontró el token <new> con valor: "+ yytext ); return 'tnew'} 

"int"                   { console.log("Se encontró el token <int> con valor: "+ yytext ); return 'tint'} 
"double"                { console.log("Se encontró el token <double> con valor: "+ yytext ); return 'tdouble'} 
"string"                { console.log("Se encontró el token <string> con valor: "+ yytext ); return 'tstring'} 
"boolean"               { console.log("Se encontró el token <boolean> con valor: "+ yytext ); return 'tbool'} 
"char"                  { console.log("Se encontró el token <char> con valor: "+ yytext ); return 'tchar'} 


//"print"                 return 'tprint'
//"printEnv"              return 'tgprintEnv' // nos va a imprimir la tabla de simbolos




// • simbolos
">="                   { console.log("Se encontró el token >= con valor: "+ yytext ); return '>='} 
"<="                   { console.log("Se encontró el token <= con valor: "+ yytext ); return '<='}
">"                    { console.log("Se encontró el token > con valor: "+ yytext ); return '>'}
"<"                    { console.log("Se encontró el token < con valor: "+ yytext ); return '<'}
"=="                   { console.log("Se encontró el token <==> con valor: "+ yytext ); return '=='}
"!="                   { console.log("Se encontró el token <!=> con valor: "+ yytext ); return '!='}
"!"                    { console.log("Se encontró el token <!> con valor: "+ yytext ); return '!'}
"&&"                   { console.log("Se encontró el token <&&> con valor: "+ yytext ); return '&&'}
"||"                   { console.log("Se encontró el token <||> con valor: "+ yytext ); return '||'}


"++"                   { console.log("Se encontró el token <++> con valor: "+ yytext ); return '++'}
"--"                   { console.log("Se encontró el token <--> con valor: "+ yytext ); return '--'}
"+"                    { console.log("Se encontró el token <+> con valor: "+ yytext ); return '+'}
"-"                    { console.log("Se encontró el token <-> con valor: "+ yytext ); return '-'}
"*"                    { console.log("Se encontró el token <*> con valor: "+ yytext ); return '*'}
"/"                    { console.log("Se encontró el token </> con valor: "+ yytext ); return '/'}
"^"                    { console.log("Se encontró el token <^> con valor: "+ yytext ); return '^'}
"%"                    { console.log("Se encontró el token <%> con valor: "+ yytext ); return '%'}

","                    { console.log("Se encontró el token <,> con valor: "+ yytext ); return ','}
";"                    { console.log("Se encontró el token <;> con valor: "+ yytext ); return ';'}
":"                    { console.log("Se encontró el token <:> con valor: "+ yytext ); return ':'}
"="                    { console.log("Se encontró el token <=> con valor: "+ yytext ); return '='}
"("                    { console.log("Se encontró el token <(> con valor: "+ yytext ); return '('}
")"                    { console.log("Se encontró el token <)> con valor: "+ yytext ); return ')'}
"{"                    { console.log("Se encontró el token <{> con valor: "+ yytext ); return '{'}
"}"                    { console.log("Se encontró el token <}> con valor: "+ yytext ); return '}'}
"["                    { console.log("Se encontró el token <[]> con valor: "+ yytext ); return '['}
"]"                    { console.log("Se encontró el token <]> con valor: "+ yytext ); return ']'}
"."                    { console.log("Se encontró el token <.> con valor: "+ yytext ); return '.'}
"?"                    { console.log("Se encontró el token <?> con valor: "+ yytext ); return '?'}


{id}                   { console.log("Se encontró el token <id> con valor: "+ yytext ); return 'id' }
{double}               { console.log("Se encontró el token <double> con valor: "+ yytext ); return 'expreDOUBLE' }
{int}                  { console.log("Se encontró el token <int> con valor: "+ yytext ); return 'expreINT' }
{bool}                 { console.log("Se encontró el token <bool> con valor: "+ yytext ); return 'expreBOOL' }
{char}                 { yytext = yytext.substr(1,yyleng-2); console.log("Se encontró el token <char> con valor: "+ yytext ); return 'expreCHAR'}
{string}               { yytext = yytext.substr(1,yyleng-2); console.log("Se encontró el token <string> con valor: "+ yytext ); return 'expreSTRING'}


// • nuestro final de doc
<<EOF>>		            return 'EOF'

.   { 
        console.log("error lexico")
             // reporte para el usuario dónde está el error y por qué fue
    }

/lex

//•precedencia
%left '||'
%left '&&'
%left '!'
%left '<', '>', '<=', '>=', '==', '!='
%left '+', '-' //Esto es para la precedencia de operadores, esto evita el shift reduce
%left '*', '/', '%' // mismo nivel de precedencia, esto está en el enunciado
%left '^'
%start Init

%%

//nuestro simbolo inicial
Init    
    : Instructions EOF          //{  return $1;  }//intrucciones es un no_terminal, vamos a retornar lo almacenado en instricciones
;                                               // el return ya es para javascript, lleva un array de clases abstractas

Instructions
    : Instructions Instruction  //{ $1.push($2); $$ = $1; }//varias o una istruccion // EL.PUSH ES AGREGREGAR A UN ARRAY en JS  
    | Instruction               //{ $$ = [$1];            }
;//sabemos que esta va a ser la que se va a hacer primero, por lo que va a retornar al padre
// a la instruccion 1 le agregamos la instrucción 2, y retornamos la instruccion 2
// lo que traiga , entre corchetes, UN ARRAY


// una instruccion puede ser una declaración, o una asignación o un if o un for etc...
// modificamos las sentencias para que nos acepte con puntoycoma y sin 
Instruction
    : DECLARACION ';'       //{$$ = $1}
    //| PRINTENVIROMENT       {$$ = $1} // imprime lo que está el la tabla de simbolos
    //| PRINTENVIROMENT ';'   {$$ = $1}
    | INDECREMENTO ';'
    | ASIGNACION ';'        //{$$ = $1}
    | PRINT ';'             //{$$ = $1}
    | PRINTLN ';'             //{$$ = $1}
    | IF           //{$$ = $1}
    | CICLOFOR              //{$$ = $1} 
    | SWITCH 
    | WHILE 
    | DO_WHILE ';'
    | DO_UNTIL ';'   
   // | FUNCION 
    //| METODO
    | DECLARACION_VECTOR ';'
    | MODIFICACION_VECTOR ';'
    | FUNCIONES_NATIVAS ';'
    | LLAMADAS ';' 
    | FUNCIONES_VECTORES ';'
    //| RUN ';'
;


FIJOS     
    : DECLARACION ';' 
    | ASIGNACION ';' 
    | PRINT ';' 
    | PRINTLN ';'
    | LLAMADAS ';'
    | DECLARACION_VECTOR ';'
    | MODIFICACION_VECTOR ';'
    | FUNCIONES_VECTORES ';'
    | FUNCIONES_NATIVAS ';'
;

CICLOS
    : IF           
    | CICLOFOR              
    | SWITCH  
    | WHILE 
    | DO_WHILE ';'
    | DO_UNTIL ';' 
;

INSTRUCCIONES_METODO
    : CICLOS 
    | RETURN_SOLO
    | FIJOS
;

INSTRUCCIONES_FUNCION
    : CICLOS 
    | RETURN_VALOR
    | FIJOS
;

GLOBALES
    : CICLOS 
    | METODO
    | FUNCION
;



OPTERNARIO
    : EXPRE '?' EXPRE ':' EXPRE
;


BLOQUE
    : '{' Instructions '}'// {$$= new Statement($2, @1.first_line, @1.first_column);}
;

IF 
    : 'tif' '(' EXPRE ')' ACCIONES_  
    | 'tif' '(' EXPRE ')' ACCIONES_  COMPLEMENTO_IF
;

COMPLEMENTO_IF 
    : ELSE {console.log("entro else")}
    | LISTA_ELIF {console.log("Entro lista elif")}
    | LISTA_ELIF ELSE {console.log("ENTRO ELIS Y ELSE")}
;

LISTA_ELIF
    : 'telif' '(' EXPRE ')' ACCIONES_
    | LISTA_ELIF 'telif' '(' EXPRE ')' ACCIONES_
;

ELSE 
    : 'telse' ACCIONES_IF
;

ACCIONES_
    : BLOQUE
    | '{' '}'
;   



SWITCH 
    : 'tswitch' '(' EXPRE ')' '{' COMPLEMENTO_SWITCH '}'
;

COMPLEMENTO_SWITCH 
    : LISTA_CASE DEFAULT_CASE
    | LISTA_CASE
    | DEFAULT_CASE
;

LISTA_CASE
    : 'tcase' EXPRE ':' Instructions 'tbreak' ';'
    | LISTA_CASE 'tcase' EXPRE ':' Instructions 'tbreak' ';'
;

DEFAULT_CASE 
    :'tdefault' ':' Instructions 'tbreak' ';'
;

WHILE 
    : 'twhile' '(' EXPRE ')' BLOQUE
;

DO_WHILE 
    : 'tdo' BLOQUE 'twhile' (' EXPRE ')' 
;

DO_UNTIL 
    : 'tdo' BLOQUE 'tuntil' (' EXPRE ')'
;
/*
CONDICIONIF
    : 'tif' '(' EXPRE ')' BLOQUE  'telse' BLOQUE {

        //agregamos la condición actual al array
        var con = new C_if($3,$5); //creamos nuestro objeto
        condiciones_if.push(con); // lo agregamos al array
        
        
        $$= new If(condiciones_if,$7, @1.first_line, @1.first_column);
        condiciones_if = [];
        }
    
    
    
    | 'tif' '(' EXPRE ')' BLOQUE  // {

        //agregamos la condición actual al array
        //var con = new C_if($3,$5); //creamos nuestro objeto
        //condiciones_if.push(con); // lo agregamos al array
        
        
        
        //$$= new If(condiciones_if,$5, $7, @1.first_line, @1.first_column);}
    
                          
    | 'tif' '(' EXPRE ')' BLOQUE  'telse' CONDICIONIF {
                                                        var con = new C_if($3,$5); //creamos nuestro objeto
                                                        condiciones_if.push(con); // lo agregamos al array
                                                        }
                                                        
;
*/


// acá debemos hacer una funcionalidad para el incremento, en lugar de una asignación
CICLOFOR
    : 'tfor' '(' DECLARACION ';' EXPRE ';' ACTUALIZACION_FOR ')' ACCIONES_ //{$$= new For($3,$5,$8, @1.first_line, @1.first_column);}
    | 'tfor' '(' ASIGNACION ';' EXPRE ';' ACTUALIZACION_FOR ')' ACCIONES_ 
;

ACTUALIZACION_FOR
    : INDECREMENTO
    | ASIGNACION
;

// el $$ es para pasarle info del hijo al padre
DECLARACION
    // tipo id = expresion   (nombre, tipo, expresion)
    //: TIPOS 'id' '=' EXPRE { $$= new Declaracion($2,$1,$4, @1.first_line, @1.first_column)}  
    // <TIPO> id1, id2, id3, id4 = <EXPRESION>;
    : TIPOS LISTA_ID '=' EXPRE  /*{ $$= new Declaracion($2,$1,$4, @1.first_line, @1.first_column);                                  
                                    ides = [];
                                }*/

    | TIPOS LISTA_ID '=' CASTEO /* { $$= new Declaracion($2,$1,$4, @1.first_line, @1.first_column);                                  
                                    ides = [];
                                }*/
    | TIPOS LISTA_ID '=' OPTERNARIO 

    | TIPOS LISTA_ID            /*{ $$= new Declaracion_2($2,$1, @1.first_line, @1.first_column);                                  
                                    ides = [];
                                }
                                */
;


LISTA_ID
    : LISTA_ID ',' 'id' /*{
                        ides.push($3);
                        }*/
    | 'id' /*{
        ides.push($1);
        $$ = ides;
        //console.log($1);
        }*/
;



/*PRINTENVIROMENT
    : tgprintEnv '(' ')'  {$$= new PrintEnv(@1.first_line, @1.first_column)}
;*/

ASIGNACION
    : 'id' '='  EXPRE   //{$$= new Asignacion($1,$3, @1.first_line, @1.first_column)}
    | 'id' '='  CASTEO  //{$$= new Asignacion($1,$3, @1.first_line, @1.first_column)}
    | 'id' '='  OPTERNARIO
;

PRINT
    // tprint palabra reservada
    : 'tprint' '(' EXPRE ')' {console.log("PRINT " + $3 );} //{$$= new Print($3, @1.first_line, @1.first_column)}
;

PRINTLN
    // tprint palabra reservada
    : 'tprintln' '(' EXPRE ')'  {console.log("PRINTLN " + $3 );}  //{$$= new Print($3, @1.first_line, @1.first_column)}
;

EXPRE                        // creamos un nodo de tipo aritmetic, que es una clase abstracta, y la retornamos
                            // izquierda, derecha, tipo(de nuestro enum), fila y columna
    
    : '(' EXPRE ')'          //{$$=$2}
    | INDECREMENTO
    | EXPRE '+' EXPRE        { 
                                var nuevo = new Nodo("EXPRE", contador++);
                                var nuevo1 = new Nodo("+", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA SUMA ");
                            }

    | EXPRE '-' EXPRE       { 
                                var nuevo = new Nodo("EXPRE", contador++);
                                var nuevo1 = new Nodo("-", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA RESTA ");
                            }

    | EXPRE '*' EXPRE       { 
                                var nuevo = new Nodo("EXPRE", contador++);
                                var nuevo1 = new Nodo("*", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA MULTIPLICACION ");
                            }

    | EXPRE '/' EXPRE        { 
                                var nuevo = new Nodo("EXPRE", contador++);
                                var nuevo1 = new Nodo("/", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DIVISION ");
                            }
       
    | EXPRE '^' EXPRE        { 
                                var nuevo = new Nodo("EXPRE", contador++);
                                var nuevo1 = new Nodo("^", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA POTENCIA ");
                            }
       
    | EXPRE '%' EXPRE        { 
                                var nuevo = new Nodo("EXPRE", contador++);
                                var nuevo1 = new Nodo("%", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN MODULO ");
                            }
       
    | '-' EXPRE              //{$$=new Arithmetic($2, $2,ArithmeticOption.NEGACION ,  @1.first_line, @1.first_column);}


    | EXPRE '<' EXPRE        //{$$=new Relacional($1, $3,RelacionalOption.MENOR , @1.first_line, @1.first_column)}
    | EXPRE '>' EXPRE        //{$$=new Relacional($1, $3,RelacionalOption.MAYOR , @1.first_line, @1.first_column)}
    | EXPRE '<=' EXPRE       //{$$=new Relacional($1, $3,RelacionalOption.MENOR_I , @1.first_line, @1.first_column)}
    | EXPRE '>=' EXPRE       //{$$=new Relacional($1, $3,RelacionalOption.MAYOR_I , @1.first_line, @1.first_column)}
    | EXPRE '==' EXPRE       //{$$=new Relacional($1, $3,RelacionalOption.IGUAL , @1.first_line, @1.first_column)}
    | EXPRE '!=' EXPRE       //{$$=new Relacional($1, $3,RelacionalOption.DIFERENTE , @1.first_line, @1.first_column)}

    | EXPRE '&&' EXPRE       //{$$=new Logico($1, $3,LogicoOption.AND , @1.first_line, @1.first_column)}
    | EXPRE '||' EXPRE       //{$$=new Logico($1, $3,LogicoOption.OR , @1.first_line, @1.first_column)}
    | '!' EXPRE              //{$$=new Logico($2, $2,LogicoOption.NEG , @1.first_line, @1.first_column)}
    
    | 'id'                   {  console.log("se encontró un id");
                                $$ = new Nodo("ID", contador++, $1); }
                                //{$$=new Buscador($1, @1.first_line, @1.first_column)}
 
    | ACCESO_VECTOR

    | FUNCIONES_NATIVAS

    | F                      {$$ = $1; } // como es solo una hoja, se lo retornamos al padre
;

F
    // creamos la clase abstracta literal y la retornamos
    // valor, tipo(de nuestro enum), fila, columna
    //acá irían los demás valores que pueden ser hojas, como Boolean, String, etc
    // acá tam,bien podría ser un id, haciendo referencia a una variable que esté en la labra de simbolos
    : expreINT       { $$ = new Nodo("INT", contador ++, $1); console.log("SE ENCONTRÓ UN INT "); }
    | expreSTRING    { $$ = new Nodo("CADENA", contador ++, $1); console.log("SE ENCONTRÓ UNA CADENA"); }
    | expreBOOL      { $$ = new Nodo("BOOLEAN", contador ++, $1); console.log("SE ENCONTRÓ UN BOOLEAN "); }
    | expreDOUBLE    { $$ = new Nodo("DOUBLE", contador ++, $1); console.log("SE ENCONTRÓ UN DOUBLE "); }
    | expreCHAR      { $$ = new Nodo("CHAR", contador ++, $1); console.log("SE ENCONTRÓ UN CHAR "); }
             
;

CASTEO
    : '(' TIPOS ')' EXPRE    //{$$=new Casteo($2, $4, @1.first_line, @1.first_column)}
;

TIPOS
    : tint      //{$$=Type.INT}
    | tdouble   //{$$=Type.DOUBLE}
    | tstring   //{$$=Type.STRING}
    | tbool     //{$$=Type.BOOLEAN}
    | tchar     //{$$=Type.CHAR}    
;

INDECREMENTO
    : 'id' '++'
    | 'id' '--'
;

FUNCION 
    : 'id' '(' LISTA_PARAMETROS ')' ':' TIPOS ACCIONES_
    | 'id' '(' ')' ':' TIPOS ACCIONES_
;

METODO 
    : 'id' '(' LISTA_PARAMETROS ')' ':' 'tvoid' ACCIONES_
    | 'id' '('LISTA_PARAMETROS ')' ':' ACCIONES_
    | 'id' '(' ')' ':' 'tvoid' ACCIONES_
    | 'id' '(' ')' ':'  ACCIONES_
;

LISTA_PARAMETROS
    : LISTA_PARAMETROS ',' TIPOS EXPRE
    | TIPOS EXPRE
;
 
RETURN_VALOR
    : 'treturn' EXPRE ';'
;

RETURN_SOLO
    : 'treturn' ';'
;

SENTENCIAS_TRANSFERENCIA
    : 'tbreak'
    | 'tcontinue'
;

DECLARACION_VECTOR
    : TIPOS '['']' 'id' '=' 'tnew' TIPOS '[' EXPRE ']'
    | TIPOS '['']' '['']' 'id' '=' 'tnew' TIPOS '[' EXPRE ']' '[' EXPRE ']'
    | TIPOS '['']' 'id' '=' '{' LISTA_VALORES_1 '}'
    | TIPOS '['']' '['']' 'id' '=' '{' LISTA_VALORES_2 '}'
;

LISTA_VALORES_1
    : LISTA_VALORES_1 ',' EXPRE
    | EXPRE     
;

LISTA_VALORES_2
    : LISTA_VALORES_2 ',' '{' LISTA_VALORES_1 '}'
    | '{' LISTA_VALORES_1 '}'  
;

ACCESO_VECTOR
    : 'id' '[' EXPRE ']'
    | 'id' '[' EXPRE ']' '[' EXPRE ']' 
;

MODIFICACION_VECTOR
    : 'id' '[' EXPRE ']' '=' EXPRE 
    | 'id' '[' EXPRE ']' '[' EXPRE ']' '=' EXPRE 
;

FUNCIONES_NATIVAS
    : 'ttolower' '(' EXPRE ')'  
    | 'ttoupper' '(' EXPRE ')'
    | 'tround' '(' EXPRE ')' 
    | 'tlength' '(' EXPRE ')'
    | 'ttypeof' '(' EXPRE ')'
    | 'ttostring' '(' EXPRE ')'
    | 'ttochararray' '(' EXPRE ')'
;

FUNCIONES_VECTORES
    : 'id' '.' 'tpush' '(' EXPRE ')'  
    | 'id' '.' 'tpop' '(' ')'   
;

LLAMADAS 
    : 'id' '(' LISTA_ID ')'
    | 'id' '(' ')'
;


RUN 
    : 'trun' 'id' '(' ')' 
    | 'trun' 'id' '(' LISTA_VALORES_1 ')' 
;

