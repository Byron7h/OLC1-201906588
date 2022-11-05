var express = require('express');
var morgan = require('morgan');
var cors = require("cors");
var Nodo = require('../nodo');
var app= express();
var corsOptions = { origin: true, optionsSuccessStatus: 200 };


app.use(morgan('dev')); // esto nos permite ver las solicitudes del servidor
app.use(express.json()) 
app.use(cors(corsOptions));
app.use(express.urlencoded({extended: true}));

var incremental= 0
var puerto = 8080 // puerto donde va a correr
var errores = {msg: "eroor",msg: "eroor",msgg: "eroor",msgg: "eroor"}


var fs = require("fs");
var gramatica = require("../grammar") //importamos el archivo que nos generó jison, nuestros analizadores, nuestro .js
var cache = "";


 


AST = function (nodo ) {
    this.cache  = "digraph structs {\n"+
                "    fontname=\"Helvetica,Arial,sans-serif\"\n"+
                "    node [shape=record, fontname=\"Helvetica,Arial,sans-serif\" ];\n ";

    AST2(nodo);
    console.log(nodo.getEtiqueta())
    this.cache += "}";
    console.log(this.cache);

};



AST2 = function (actual) {

    console.log("id " + actual.getId());
    console.log("etiqueta " + actual.getEtiqueta());
    console.log("valor "+actual.getValor());

    if (actual.getValor() == undefined){
        
        this.cache += "    "+actual.getId()+" [label=\""+actual.getEtiqueta()+"\"];\n";
        console.log("entro 1")
    }else{
        this.cache += "    "+actual.getId()+" [label=\""+actual.getEtiqueta()+ " : "+ actual.getValor()+"\"];\n";
        console.log("entro 2")
    }


    var hijos = actual.getHijos();
    if(hijos.length > 0 ){
        for(var i = 0; i < hijos.length; i++){
            this.cache += "    "+actual.getId()+" -> "+hijos[i].getId()+";\n";
            AST2(hijos[i]);
        }

    }
                
};





// a estas funciones las podemos dejar solo así, sin nombre
app.listen(puerto , function () {
    console.log(`app escuchando en el puerto ${puerto}!`);
})




// function (LO_QUE_RECIBIMOS, LO_QUE_RETORNAMOS)
// la cadena de entrada, el texto del grafo
app.post('/AST', function (req, res) {
    // le mandamos algo por medio del request, y nos va a responder

    //incremental= req.body.dato //así podemos modificar el contenido de una variable
    var texto= req.body.texto  // El dato que recibimos es de tipo jason, de nombre texto

    var ast = gramatica.parse(texto.toString()) // de lo contrario, nuestra var gramatica la convierta en un string
    console.log("++++++++++++++++++++++++++++++++++++")
    AST(ast)


    //codigo, que tenga algun algoritmo en especifico
    res.json({msg: this.cache})
})

app.get('/errores', function (req, res) {
    res.json(errores)
})