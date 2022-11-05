export class Singleton {
    private static instance: Singleton
    private error: string = ""
    private ast: string = ""

    private constructor() { }

    public static getInstance(): Singleton {
        if (!Singleton.instance) {
            Singleton.instance = new Singleton();
        }
        return Singleton.instance;
    }


    public add_error(tipo: string, descripcion: string, fila: string, columna: string) {
        this.error +=
            "<tr>" +
            "<td>" + tipo + "</td>" +
            "<td>" + descripcion + "</td>" +
            "<td>" + fila + "</td>" +
            "<td>" + columna + "</td>" +
            "</tr>"
    }


    public get_error() {
        return `
        <table border=1 style="width: 75%;margin: 0 auto;" cellpadding ="5">
            <tr>
                <th>Tipo error</th>
                <th>Descripcion</th>
                <th>Linea</th>
                <th>Columna</th>
            </tr>${this.error}
        </table>`
    }

    public add_ast(data: string) {
        this.ast += data
    }
    public get_ast(): string {
        return this.ast
    }

}