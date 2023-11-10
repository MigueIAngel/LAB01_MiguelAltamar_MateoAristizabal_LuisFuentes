%{
#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <map>
#include "LAB02.hpp"
using namespace std;
map<string, string> mapa;
%}
%option case-insensitive
%option noyywrap

ws              [ \t\n]  
digit           [0-9]  
letter          [a-zA-ZáéíóúÁÉÍÓÚ]  
ALFANUM   {letter}|{digit}
d_quote         ["]
s_quote         [']
c_quote         [`]
v1_quote        [‘]
v2_quote        [’]
menos           [-]
simbolosD        [^"\n]
simbolosS        [^'\n]
simbolosC        [^`\n]
simbolosV1        [^‘\n]
simbolosV2        [^’\n]
simbolos          [^’‘`'"\t\n]
slash             [_]
identifier       {letter}{ALFANUM}*
%option noyywrap

%x STRING
%x STRING2
%x STRING3

%%
"CREATE"                { printf("CREATE TABLE "); return (CREATE); }  
"DROP"                  { printf("DROP TABLE"); return DROP; }  
"DELETE"                { printf("DELETE "); return DELETE; }   
"TABLE"                 { /* Do nothing for "Table" */ }  
"BY"                    { /* Do nothing for "Table" */ }  
"ORDER BY"                 { printf("ORDER BY "); return ORDER_BY; }   
"GROUP BY"                 { printf("GROUP BY "); return GROUP_BY; }  
"("                     { printf("parabre=( "); return PARABRE; }  
")"                     { printf("parcierr=) "); return PARCIERR; }  
","                     { printf("coma=, "); return COMA; }  
"VARCHAR"               { printf("VARCHAR "); return VARCHAR; }  
"INTEGER"               { printf("INTEGER "); return INTEGER; }  
"DECIMAL"               { printf("DECIMAL "); return DECIMAL; }  
{digit}+                { printf("entero=%s ", yytext); return NUMENTERO; }
("-"{digit}+)           { printf("entero=%s ", yytext); return NUMENTERO; }
"INSERT"                { printf("INSERT "); return INSERT; }  
"INTO"                  { printf("INTO "); return INTO; } 
"VALUES"                { printf("VALUES "); return VALUES; }  
"SELECT"                { printf("SELECT "); return SELECT; }  
"COUNT"                 { printf("COUNT "); return COUNT; }  
"FROM"                  { printf("FROM "); return FROM; }  
"MAX"                   { printf("MAX "); return MAX; }  
"MIN"                   { printf("MIN "); return MIN; }  
"AVG"                   { printf("AVG "); return AVG; }  
"UPDATE"                { printf("UPDATE "); return UPDATE; }  
"SET"                   { printf("SET "); return SET; }  
"WHERE"                 { printf("WHERE "); return WHERE; }  
"ASC"                   { printf("ASC "); return ASC; }  
"DESC"                  { printf("DESC "); return DESC; }  
"AND"                   { printf("AND "); return AND; } 
"OR"                    { printf("OR "); return OR; } 
"="                     { printf("asign= = "); return ASIGN; }  
"=="                    { printf("igualq=%s ", yytext); return IGUALQ; }  
"<>"                    { printf("diferentq=%s ", yytext); return DIFERENTQ; }  
">"                     { printf("mayorq=%s ", yytext); return MAYORQ; }  
"<"                     { printf("menorq=%s ", yytext); return MENORQ; }  
">="                    { printf("mayorigualq=%s ", yytext); return MAYORIGUALQ; }  
"<="                    { printf("menorigualq=%s ", yytext); return MENORIGUALQ; }  
"+"                     { printf("mas=%s ", yytext); return MAS; }  
"-"                     { printf("menos=%s ", yytext); return MENOS; }  
"*"                     { printf("asterisco=%s ", yytext); return ASTERISCO; }  
"/"                     { printf("slash=%s ", yytext); return SLASH; }  
{digit}+"."{digit}+     { printf("decimal=%s ", yytext); return NUMDECIMAL; }  
("-"{digit}+"."{digit}+)    { printf("decimal=%s ", yytext); return NUMDECIMAL; }
'\''.*'\''              { printf("cadena=%s ", yytext); return CADENA; }
{s_quote}({ws}|{letter}|{simbolosS}|{digit})*{s_quote} { printf("cadena=%s ", yytext); return CADENA; }
{c_quote}({ws}|{letter}|{simbolosC}|{digit})*{c_quote} { printf("cadena=%s ", yytext); return CADENA; }
\‘[^\‘\\]*(\\.[^\‘\\]*)*\‘ { printf("cadena=%s ", yytext); return CADENA; }
\’[^\’\\]*(\\.[^\’\\]*)*\’ { printf("cadena=%s ", yytext); return CADENA; }
\`[^\`\\]*(\\.[^\`\\]*)*\` { printf("cadena=%s ", yytext); return CADENA; }

{identifier} { 
    if (mapa.find(yytext) == mapa.end()) {
        mapa[yytext] = "id" + to_string(mapa.size() + 1);
    }
    cout<<" "<<mapa[yytext]<<"="<<yytext; 
    return (IDENTIFIER); 
} 
";"                     { printf("puntcoma=; \n"); return PUNTCOMA; }  
{ws}+                   ;  
{digit}({letter}|{digit})* { printf("ERROR= %s ", yytext); return ERROR; }  

.                     { printf("ERROR=%s ", yytext); return ERROR; }  


%%

