%{
#include <iostream>
#include <vector>

using namespace std;

int yylex();
int yyerror(const char* s);
extern "C" FILE* yyin;

vector<int> line_errors;
int numLinea = 1;
%}

%token CREATE DROP
%token PARABRE PARCIERR COMA PUNTCOMA
%token SELECT WHERE GROUP_BY ORDER_BY
%token NUMENTERO
%token NUMDECIMAL
%token AND OR
%token INSERT DELETE UPDATE
%token MAX MIN AVG COUNT
%token INTO VALUES FROM SET ASC DESC
%token INTEGER DECIMAL VARCHAR
%token ERROR
%token ASIGN DIFERENTQ MAYORIGUALQ MENORIGUALQ MAYORQ MENORQ IGUALQ MAS MENOS SLASH ASTERISCO
%token IDENTIFIER CADENA
%%

start: comandos start_
start_: | comandos start
comandos: creacion_tabla { numLinea++; }
        | eliminacion_tabla { numLinea++; }
        | insercion_dato { numLinea++; }
        | eliminacion_dato { numLinea++; }
        | actualizacion { numLinea++; }
        | seleccion { numLinea++; }
        | error PUNTCOMA { line_errors.push_back(numLinea++); }

creacion_tabla: CREATE IDENTIFIER PARABRE campos PARCIERR PUNTCOMA;
campos: campo campos_
campos_: | COMA campos
campo: IDENTIFIER tipoDato dato | IDENTIFIER tipoDato;
tipoDato: INTEGER | DECIMAL | VARCHAR
dato: PARABRE NUMENTERO PARCIERR;

eliminacion_tabla: DROP IDENTIFIER PUNTCOMA;

insercion_dato: INSERT INTO IDENTIFIER VALUES PARABRE valores PARCIERR PUNTCOMA;
valores: valor valores_
valores_: | COMA valores
valor: NUMENTERO | NUMDECIMAL | CADENA

eliminacion_dato: DELETE FROM IDENTIFIER WHERE condiciones PUNTCOMA;
condiciones: condicion condiciones_
condiciones_: | AND condiciones | OR condiciones 
condicion: IDENTIFIER operador_ar valor | valor operador_ar IDENTIFIER;
operador_ar: ASIGN | DIFERENTQ | MAYORIGUALQ | MENORIGUALQ | MAYORQ | MENORQ | IGUALQ

actualizacion: UPDATE IDENTIFIER SET IDENTIFIER IGUALQ option WHERE condiciones PUNTCOMA;
option: IDENTIFIER | condiciones;

seleccion: SELECT busqueda FROM IDENTIFIER condicionado agrupacion ordenacion PUNTCOMA;
busqueda: ASTERISCO | combinado;
combinado: IDENTIFIER | funcion | IDENTIFIER COMA combinado | funcion COMA combinado;
funcion: tipoFuncion PARABRE IDENTIFIER PARCIERR;
tipoFuncion: MAX | MIN | AVG | COUNT;
condicionado: | WHERE condiciones;
agrupacion: | GROUP_BY IDENTIFIER;
ordenacion: | ORDER_BY IDENTIFIERes orden;
orden: ASC | DESC;
IDENTIFIERes: IDENTIFIER | IDENTIFIER COMA IDENTIFIERes;

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr<<"Uso: "<<argv[0]<<" archivo.txt\n";
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        cerr<<"No se pudo abrir el archivo "<<argv[1]<<endl;
        return 1;
    }

    yyparse();
    fclose(yyin);

    if (line_errors.size() > 0) {
        cout<<"\n\nIncorrecto\n\n";
        for (int linea : line_errors) {
            cout<<"Error en la linea "<<linea<<endl;
        }
        line_errors.clear();
    } else {
        cout<<"\n\nCorrecto\n";
    }

    return 0;
}

int yyerror(const char* mensaje) {
    return 1;
}