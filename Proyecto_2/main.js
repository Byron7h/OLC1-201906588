// Este ya es java script













//declarando variables, los require son como imports
var fs = require("fs");
var gramatica = require("./grammar") //importamos el archivo que nos generó jison, nuestros analizadores, nuestro .js

// usamos la función flecha, que es como un void pero sin nombre
fs.readFile("./entrada.txt", (err, data)=>{

    if(err) throw err; // si ocurre algún error, que nos lo muestre
    gramatica.parse(data.toString()) // de lo contrario, nuestra var gramatica la convierta en un string
    //y se la mandamos a la función parse, parse es una función que nos genera el .jison

});
