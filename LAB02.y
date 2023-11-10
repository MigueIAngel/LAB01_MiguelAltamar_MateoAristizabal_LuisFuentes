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

start: stmts start_
start_: | stmts start
stmts: create_table { numLinea++; }
        | select { numLinea++; }
        | update { numLinea++; }
        | delete { numLinea++; }
        | drop_table { numLinea++; }
        | insert { numLinea++; }
        | error PUNTCOMA { line_errors.push_back(numLinea++); }

create_table: CREATE IDENTIFIER PARABRE campos PARCIERR PUNTCOMA;
campos: campo campos_
campos_: | COMA campos
campo: IDENTIFIER tipoDato dato | IDENTIFIER tipoDato;
tipoDato: INTEGER | DECIMAL | VARCHAR
dato: PARABRE NUMENTERO PARCIERR;
select: SELECT search FROM IDENTIFIER condition group order PUNTCOMA;
search: ASTERISCO | fields;
fields: IDENTIFIER | funcion | IDENTIFIER COMA fields | funcion COMA fields;
funcion: tipoFuncion PARABRE IDENTIFIER PARCIERR;
tipoFuncion: MAX | MIN | AVG | COUNT;
condition: | WHERE conditions;
group: | GROUP_BY IDENTIFIER;
order: | ORDER_BY IDENTIFIERes orden;
orden: ASC | DESC;
drop_table: DROP IDENTIFIER PUNTCOMA;
update: UPDATE IDENTIFIER SET IDENTIFIER IGUALQ option WHERE conditions PUNTCOMA;
option: IDENTIFIER | conditions;
insert: INSERT INTO IDENTIFIER VALUES PARABRE value PARCIERR PUNTCOMA;
value: valor value_
value_: | COMA value
valor: NUMENTERO | NUMDECIMAL | CADENA
delete: DELETE FROM IDENTIFIER WHERE conditions PUNTCOMA;
conditions: condicion conditions_
conditions_: | AND conditions | OR conditions 
condicion: IDENTIFIER op valor | valor op IDENTIFIER;
op: ASIGN | DIFERENTQ | MAYORIGUALQ | MENORIGUALQ | MAYORQ | MENORQ | IGUALQ




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
            cout<<"Error en la línea "<<linea<<endl;
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