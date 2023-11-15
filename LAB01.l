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
"CREATE"                {  return (CREATE); }  
"DROP"                  {  return DROP; }  
"DELETE"                {  return DELETE; }   
"TABLE"                 { /* Do nothing for "Table" */ }  
"BY"                    { /* Do nothing for "Table" */ }  
"ORDER BY"                 {  return ORDER_BY; }   
"GROUP BY"                 {  return GROUP_BY; }  
"("                     {  return PARABRE; }  
")"                     {  return PARCIERR; }  
","                     {  return COMA; }  
"VARCHAR"               {  return VARCHAR; }  
"INTEGER"               {  return INTEGER; }  
"DECIMAL"               {  return DECIMAL; }  
{digit}+                {  return NUMENTERO; }
("-"{digit}+)           {  return NUMENTERO; }
"INSERT"                {  return INSERT; }  
"INTO"                  {  return INTO; } 
"VALUES"                {  return VALUES; }  
"SELECT"                {  return SELECT; }  
"COUNT"                 {  return COUNT; }  
"FROM"                  {  return FROM; }  
"MAX"                   {  return MAX; }  
"MIN"                   {  return MIN; }  
"AVG"                   {  return AVG; }  
"UPDATE"                {  return UPDATE; }  
"SET"                   {  return SET; }  
"WHERE"                 {  return WHERE; }  
"ASC"                   {  return ASC; }  
"DESC"                  {  return DESC; }  
"AND"                   {  return AND; } 
"OR"                    {  return OR; } 
"="                     {  return ASIGN; }  
"=="                    {  return IGUALQ; }  
"<>"                    {  return DIFERENTQ; }  
">"                     {  return MAYORQ; }  
"<"                     {  return MENORQ; }  
">="                    {  return MAYORIGUALQ; }  
"<="                    {  return MENORIGUALQ; }  
"+"                     {  return MAS; }  
"-"                     {  return MENOS; }  
"*"                     {  return ASTERISCO; }  
"/"                     {  return SLASH; }  
{digit}+"."{digit}+     {  return NUMDECIMAL; }  
("-"{digit}+"."{digit}+)    {  return NUMDECIMAL; }
'\''.*'\''              {  return CADENA; }
{s_quote}({ws}|{letter}|{simbolosS}|{digit})*{s_quote} {  return CADENA; }
{c_quote}({ws}|{letter}|{simbolosC}|{digit})*{c_quote} {  return CADENA; }
{d_quote}({ws}|{letter}|{simbolosD}|{digit})*{d_quote} {  return CADENA; }
\‘[^\‘\\]*(\\.[^\‘\\]*)*\‘ {  return CADENA; }
\’[^\’\\]*(\\.[^\’\\]*)*\’ {  return CADENA; }
\`[^\`\\]*(\\.[^\`\\]*)*\` {  return CADENA; }

{identifier} { 
    if (mapa.find(yytext) == mapa.end()) {
        mapa[yytext] = "id" + to_string(mapa.size() + 1);
    } 
    return (IDENTIFIER); 
} 
";"                     {  return PUNTCOMA; }  
{ws}+                   ;  
{digit}({letter}|{digit})* {  return ERROR; }  

.                     { return ERROR; }  


%%

