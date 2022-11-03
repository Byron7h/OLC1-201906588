"use strict";
exports.__esModule = true;
exports.Nodo = void 0;
//creamos una clase
var Nodo = /** @class */ (function () {
    // constructor 1
    function Nodo(etiqueta_, id_, valor_) {
        this.etiqueta_ = etiqueta_;
        this.id_ = id_;
        this.valor_ = valor_;
        //atributos
        this.etiqueta = "";
        this.valor = "";
        this.cadena = false;
        this.aux = "";
        this.hijos = []

    }
    Nodo.prototype.addHijos = function (nuevo) {
        var hijosv = this.hijos.push(nuevo);

        //console.log(this.hijos);
        //console.log(hijosv);
    };
    Nodo.prototype.setEtiqueta = function (eti) {
        this.etiqueta = eti;
    };
    Nodo.prototype.setValor = function (val) {
        this.valor = val;
    };
    Nodo.prototype.setId = function (identificador) {
        this.id = identificador;
    };
    Nodo.prototype.getHijos = function () {
        return this.hijos;
    };
    Nodo.prototype.getEtiqueta = function () {
        return this.etiqueta_;
    };
    Nodo.prototype.getValor = function () {
        return this.valor_;
    };
    Nodo.prototype.getId = function () {
        return this.id_;
    };
    return Nodo;
}());
exports.Nodo = Nodo;
