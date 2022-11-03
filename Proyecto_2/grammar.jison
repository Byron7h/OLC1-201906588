 
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

    : FUNCION 
    | DECLARACION ';'       //{$$ = $1}
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

// 
OPTERNARIO
    : EXPRE '?' EXPRE ':' EXPRE { 
                                var nuevo = new Nodo("OP_TERNARIO", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);
                                nuevo.addHijos($5);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN OPTERNARIO ");
                            }
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
    : 'telse' ACCIONES_
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

//
WHILE 
    : 'twhile' '(' EXPRE ')' BLOQUE { 
                                var nuevo = new Nodo("WHILE", contador++);

                                nuevo.addHijos($3);
                                nuevo.addHijos($5);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN DO WHILE ");
                            }
;
;
//
DO_WHILE 
    : 'tdo' BLOQUE 'twhile' '(' EXPRE ')'
                            { 
                                var nuevo = new Nodo("DO WHILE", contador++);

                                nuevo.addHijos($2);
                                nuevo.addHijos($5);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN DO WHILE ");
                            }
;
//
DO_UNTIL 
    : 'tdo' BLOQUE 'tuntil' '(' EXPRE ')' 
                            { 
                                var nuevo = new Nodo("DO UNTIL", contador++);

                                nuevo.addHijos($2);
                                nuevo.addHijos($5);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN DOUNTIL ");
                            }
;

// acá debemos hacer una funcionalidad para el incremento, en lugar de una asignación
CICLOFOR
    : 'tfor' '(' DECLARACION ';' EXPRE ';' ACTUALIZACION_FOR ')' ACCIONES_ //{$$= new For($3,$5,$8, @1.first_line, @1.first_column);}
    | 'tfor' '(' ASIGNACION ';' EXPRE ';' ACTUALIZACION_FOR ')' ACCIONES_ 
;

ACTUALIZACION_FOR
    : INDECREMENTO
    | ASIGNACION
;

//
DECLARACION

    : TIPOS LISTA_ID '=' EXPRE  { 
                                var nuevo = new Nodo("DECLARACION", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($2);
                                nuevo.addHijos($4);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION ");
                            }

    | TIPOS LISTA_ID '=' CASTEO { 
                                var nuevo = new Nodo("DECLARACION", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($2);
                                nuevo.addHijos($4);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION ");
                            }

    | TIPOS LISTA_ID '=' OPTERNARIO { 
                                var nuevo = new Nodo("DECLARACION", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($2);
                                nuevo.addHijos($4);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION ");
                            }

    | TIPOS LISTA_ID        { 
                                var nuevo = new Nodo("DECLARACION", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($2);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION ");
                            }
;
//
LISTA_ID
    : LISTA_ID ',' 'id' { 
                                var nuevo = new Nodo("LISTA ID", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $3);
                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);

                                $$ = nuevo;
                                console.log("se encontró un id");
                         }

    | 'id'              {  
                                $$ = new Nodo("ID", contador++, $1);
                                console.log("se encontró un id");
                        }

    
;

//
ASIGNACION
    : 'id' '='  EXPRE   { 
                                var nuevo = new Nodo("ASIGNACION", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $1);

                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA ASIGNACION ");
                            }
    | 'id' '='  CASTEO  { 
                                var nuevo = new Nodo("ASIGNACION", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $1);

                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA ASIGNACION ");
                            }

    | 'id' '='  OPTERNARIO { 
                                var nuevo = new Nodo("ASIGNACION", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $1);

                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA ASIGNACION ");
                            }
;
//
PRINT
    : 'tprint' '(' EXPRE ')' { 
                                var nuevo = new Nodo("PRINT", contador++);

                                var nuevo1 = new Nodo("print", contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN PRINT ");
                            } 
;
//
PRINTLN
    // tprint palabra reservada
    : 'tprintln' '(' EXPRE ')'  { 
                                var nuevo = new Nodo("PRINT", contador++);


                                var nuevo1 = new Nodo("println", contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN PRINTLN ");
                            } 
;

EXPRE                        // creamos un nodo de tipo aritmetic, que es una clase abstracta, y la retornamos
                            // izquierda, derecha, tipo(de nuestro enum), fila y columna
    
    : '(' EXPRE ')'          {$$=$2}
    | INDECREMENTO           {$$=$1}
    | EXPRE '+' EXPRE        { 
                                var nuevo = new Nodo("+", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA SUMA ");
                            }

    | EXPRE '-' EXPRE       { 
                                var nuevo = new Nodo("-", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA RESTA ");
                            }

    | EXPRE '*' EXPRE       { 
                                var nuevo = new Nodo("*", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA MULTIPLICACION ");
                            }

    | EXPRE '/' EXPRE        { 
                                var nuevo = new Nodo("/", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DIVISION ");
                            }
       
    | EXPRE '^' EXPRE        { 
                                var nuevo = new Nodo("^", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA POTENCIA ");
                            }
       
    | EXPRE '%' EXPRE        { 
                                var nuevo = new Nodo("%", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN MODULO ");
                            }
       
    | '-' EXPRE             { 
                                var nuevo = new Nodo("-" + $2 , contador++);
                                nuevo.addHijos($2);
                                $$ = nuevo; 
                            }


    | EXPRE '<' EXPRE        { 
                                var nuevo = new Nodo("<", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                               // console.log("SE ENCONTRÓ UN MODULO ");
                            }
    | EXPRE '>' EXPRE        { 
                                var nuevo = new Nodo(">", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                //console.log("SE ENCONTRÓ UN MODULO ");
                            }
    | EXPRE '<=' EXPRE       { 
                                var nuevo = new Nodo("<=", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                //console.log("SE ENCONTRÓ UN <= ");
                            }
    | EXPRE '>=' EXPRE       { 
                                var nuevo = new Nodo(">=", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                //console.log("SE ENCONTRÓ UN MODULO ");
                            }
    | EXPRE '==' EXPRE      { 
                                var nuevo = new Nodo("==", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                //console.log("SE ENCONTRÓ UN MODULO ");
                            }
    | EXPRE '!=' EXPRE       { 
                                var nuevo = new Nodo("!=", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                //console.log("SE ENCONTRÓ UN MODULO ");
                            }

    | EXPRE '&&' EXPRE       { 
                                var nuevo = new Nodo("&&", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                //console.log("SE ENCONTRÓ UN MODULO ");
                            }
    | EXPRE '||' EXPRE       { 
                                var nuevo = new Nodo("||", contador++);

                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                //console.log("SE ENCONTRÓ UN MODULO ");
                            }


    | '!' EXPRE              { 
                                var nuevo = new Nodo("!" + $2 , contador++);
                                nuevo.addHijos($2);
                                $$ = nuevo; 
                            }
    
    | 'id'                   {  console.log("se encontró un id");
                                $$ = new Nodo("ID", contador++, $1); }

    | LLAMADAS              {$$ = $1;}
    | ACCESO_VECTOR         {$$ = $1;}
    | FUNCIONES_NATIVAS      {$$ = $1;}
    | F                      {$$ = $1;} // como es solo una hoja, se lo retornamos al padre
;
//
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
//
CASTEO
    : '(' TIPOS ')' EXPRE    { 
                                var nuevo = new Nodo("CASTEO", contador++);

                                nuevo.addHijos($2);
                                nuevo.addHijos($4);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN CASTEO ");
                            }
;
//
TIPOS
    : tint      {   console.log("se encontró un tipo");
                    $$ = new Nodo("TIPO", contador++, "entero"); }
    | tdouble   {   console.log("se encontró un tipo");
                    $$ = new Nodo("TIPO", contador++, "double"); }
    | tstring   {   console.log("se encontró un tipo");
                    $$ = new Nodo("TIPO", contador++, "cadena"); }
    | tbool     {   console.log("se encontró un tipo");
                    $$ = new Nodo("TIPO", contador++, "boolean"); }
    | tchar     {   console.log("se encontró un tipo");
                    $$ = new Nodo("TIPO", contador++, "caracter"); }   
;
//
INDECREMENTO
    : 'id' '++' {   console.log("se encontró un incremento");
                    $$ = new Nodo("INCREMENTO", contador++, $1 + "++"); }
    | 'id' '--' {   console.log("se encontró un decremento");
                    $$ = new Nodo("DECREMENTO", contador++, $1 + "--"); }
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
//
LISTA_PARAMETROS
    : LISTA_PARAMETROS ',' TIPOS EXPRE { 
                                var nuevo = new Nodo("LISTA_PARAMETROS", contador++);
                                nuevo.addHijos($1);
                                nuevo.addHijos($3);
                                nuevo.addHijos($4);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA LISTA DE VALORES ");
                            }
    | TIPOS EXPRE           { 
                                var nuevo = new Nodo("LISTA_PARAMETROS", contador++);
                                nuevo.addHijos($1);
                                nuevo.addHijos($2);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA LISTA_PARAMETROS");
                            }
;
// 
RETURN_VALOR
    : 'treturn' EXPRE ';'   { 
                                var nuevo = new Nodo("RETURN", contador++);
                                var nuevo1 = new Nodo("return", contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($2);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN RETURN VALOR ");
                            }
;

//
RETURN_SOLO
    : 'treturn' ';'         {   $$ = new Nodo("RETURN", contador++); 
                                console.log("SE ENCONTRÓ UN RETURN ");                            }
;

//
SENTENCIAS_TRANSFERENCIA
    : 'tbreak' {
                                $$ = new Nodo("BREAK", contador++); 
                                console.log("SE ENCONTRÓ UN BREAK ");
                            }
    | 'tcontinue'{
                                $$ = new Nodo("CONTINUE", contador++); 
                                console.log("SE ENCONTRÓ UN CONTINUE ");
                            }
;
//
DECLARACION_VECTOR
    : TIPOS '['']' 'id' '=' 'tnew' TIPOS '[' EXPRE ']'  { 
                                var nuevo = new Nodo("DECLARACION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $4);
                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($7);
                                nuevo.addHijos($9);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION VECTOR ");
                            }

    | TIPOS '['']' '['']' 'id' '=' 'tnew' TIPOS '[' EXPRE ']' '[' EXPRE ']'{ 
                                var nuevo = new Nodo("DECLARACION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $6);
                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($9);
                                nuevo.addHijos($11);
                                nuevo.addHijos($14);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION VECTOR ");
                            }

    | TIPOS '['']' 'id' '=' '{' LISTA_VALORES_1 '}'{ 
                                var nuevo = new Nodo("DECLARACION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $4);
                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($7);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION VECTOR ");
                            }

    | TIPOS '['']' '['']' 'id' '=' '{' LISTA_VALORES_2 '}'{ 

                                var nuevo = new Nodo("DECLARACION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $6);

                                nuevo.addHijos($1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($9);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA DECLARACION VECTOR ");
                            }
;
//
LISTA_VALORES_1
    : LISTA_VALORES_1 ',' EXPRE { 
                                var nuevo = new Nodo("LISTA_VALORES_1", contador++);
                                nuevo.addHijos($1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA LISTA DE VALORES ");
                            }

    | EXPRE  {$$=$1}
;
//
LISTA_VALORES_2
    : LISTA_VALORES_2 ',' '{' LISTA_VALORES_1 '}'{ 
                                var nuevo = new Nodo("LISTA_VALORES_2", contador++);
                                nuevo.addHijos($1);
                                nuevo.addHijos($4);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA LISTA DE VALORES2 ");
                            }
    | '{' LISTA_VALORES_1 '}' {$$=$1} 
;
//
ACCESO_VECTOR
    : 'id' '[' EXPRE ']' {                             
                                var nuevo = new Nodo("ACCESO_VECTOR", contador++);
                                
                                var nuevo1 = new Nodo("ID", contador++,$1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN ACCESO A VECTOR ");
                            }

    | 'id' '[' EXPRE ']' '[' EXPRE ']' {                             
                                var nuevo = new Nodo("ACCESO_VECTOR", contador++);
                                
                                var nuevo1 = new Nodo("ID", contador++,$1);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);
                                nuevo.addHijos($6);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UN ACCESO A VECTOR ");
                            }
;
//
MODIFICACION_VECTOR
    : 'id' '[' EXPRE ']' '=' EXPRE { 
                                var nuevo = new Nodo("MODIFICACION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $1);

                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);
                                nuevo.addHijos($6);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA MODIFICACION VECTOR ");
                                }   
    | 'id' '[' EXPRE ']' '[' EXPRE ']' '=' EXPRE 
    
                                { 
                                var nuevo = new Nodo("MODIFICACION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $1);

                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);
                                nuevo.addHijos($6);
                                nuevo.addHijos($9);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA MODIFICACION VECTOR ");
                                } 
;
//
FUNCIONES_NATIVAS
    : 'ttolower' '(' EXPRE ')' { 
                                var nuevo = new Nodo("FUNCION NATIVA", contador++);
                                var nuevo1 = new Nodo($1, contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA funcion nativa ");
                            } 
    | 'ttoupper' '(' EXPRE ')'{ 
                                var nuevo = new Nodo("FUNCION NATIVA", contador++);
                                var nuevo1 = new Nodo($1, contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA funcion nativa ");
                            } 
    | 'tround' '(' EXPRE ')' { 
                                var nuevo = new Nodo("FUNCION NATIVA", contador++);
                                var nuevo1 = new Nodo($1, contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA funcion nativa ");
                            } 
    | 'tlength' '(' EXPRE ')'{ 
                                var nuevo = new Nodo("FUNCION NATIVA", contador++);
                                var nuevo1 = new Nodo($1, contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA funcion nativa ");
                            } 
    | 'ttypeof' '(' EXPRE ')'{ 
                                var nuevo = new Nodo("FUNCION NATIVA", contador++);
                                var nuevo1 = new Nodo($1, contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA funcion nativa ");
                            } 
    | 'ttostring' '(' EXPRE ')'{ 
                                var nuevo = new Nodo("FUNCION NATIVA", contador++);
                                var nuevo1 = new Nodo($1, contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA funcion nativa ");
                            } 
    | 'ttochararray' '(' EXPRE ')'{ 
                                var nuevo = new Nodo("FUNCION NATIVA", contador++);
                                var nuevo1 = new Nodo($1, contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos($3);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA funcion nativa ");
                            } 
;
//
FUNCIONES_VECTORES
    : 'id' '.' 'tpush' '(' EXPRE ')'  { 
                                var nuevo = new Nodo("FUNCION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $1);
                                var nuevo2 = new Nodo("push", contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos(nuevo2);
                                nuevo.addHijos($5);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA FUNCION VECTOR ");
                                }   
    | 'id' '.' 'tpop' '(' ')'   { 
                                var nuevo = new Nodo("FUNCION VECTOR", contador++);
                                var nuevo1 = new Nodo("ID", contador++, $1);
                                var nuevo2 = new Nodo("pop", contador++);
                                nuevo.addHijos(nuevo1);
                                nuevo.addHijos(nuevo2);

                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA FUNCION VECTOR ");
                                } 
;
//
LLAMADAS 
    : 'id' '(' LISTA_VALORES_1 ') { 
                                var nuevo = new Nodo("LLAMADA FUNCION", contador++);
                                var nuevo_id = new Nodo("ID FUNCION", contador++, $1);                           
                                nuevo.addHijos(nuevo_id);
                                nuevo.addHijos($3);
                                $$ = nuevo; 
                                console.log("SE ENCONTRÓ UNA LISTA DE VALORES ");
                            }

    | 'id' '(' ')'          { 
                                var nuevo = new Nodo("LLAMADA FUNCION", contador++);
                                var nuevo_id = new Nodo("ID FUNCION", contador++, $1);                           
                                nuevo.addHijos(nuevo_id);
                                $$ = nuevo; 
                            }

;

RUN 
    : 'trun' 'id' '(' ')' 
    | 'trun' 'id' '(' LISTA_VALORES_1 ')' 
;

