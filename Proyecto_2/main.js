// Este ya es java script
var Nodo = require('./nodo');



//declarando variables, los require son como imports
var fs = require("fs");
var gramatica = require("./grammar") //importamos el archivo que nos generó jison, nuestros analizadores, nuestro .js
var cache = "";

// usamos la función flecha, que es como un void pero sin nombre
fs.readFile("./entrada.txt", (err, data)=>{

    if(err) throw err; // si ocurre algún error, que nos lo muestre
    var ast = gramatica.parse(data.toString()) // de lo contrario, nuestra var gramatica la convierta en un string
    console.log("++++++++++++++++++++++++++++++++++++")
    AST(ast)
    //getNodo();
    //y se la mandamos a la función parse, parse es una función que nos genera el .jison

});


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

