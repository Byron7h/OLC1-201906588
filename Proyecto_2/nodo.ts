//creamos una clase
export class Nodo{

    //atributos
    private etiqueta: string=""
    private hijos: Array<Nodo>
    private valor: string=""
    private cadena: boolean = false
    private aux: string=""
    private id: number


    // constructor 1
    private constructor(         
        private etiqueta_: string,
        private id_: number,
        private valor_: string


    ){ 
        this.etiqueta = etiqueta_
        this.valor = valor_
        this.id = id_
    }

    public addHijos(nuevo: Nodo ):void{
       let hijosv =  this.hijos.push(nuevo)
       console.log(this.hijos)
       console.log(hijosv)
    }

    public setEtiqueta(eti: string):void{
        this.etiqueta = eti      
    }

    public setValor(val: string):void{
        this.valor = val      
    }

    public setId(identificador: number):void{
        this.id = identificador     
    }


    public getHijos():Array<Nodo>{
        return this.hijos
    }


    public getEtiqueta():string{
        return this.etiqueta
    }

    public getValor():string{
        return this.valor
    }

    public getId():number{
        return this.id
    }

}