/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_LAB02_HPP_INCLUDED
# define YY_YY_LAB02_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    CREATE = 258,
    DROP = 259,
    PARABRE = 260,
    PARCIERR = 261,
    COMA = 262,
    PUNTCOMA = 263,
    SELECT = 264,
    WHERE = 265,
    GROUP_BY = 266,
    ORDER_BY = 267,
    NUMENTERO = 268,
    NUMDECIMAL = 269,
    AND = 270,
    OR = 271,
    INSERT = 272,
    DELETE = 273,
    UPDATE = 274,
    MAX = 275,
    MIN = 276,
    AVG = 277,
    COUNT = 278,
    INTO = 279,
    VALUES = 280,
    FROM = 281,
    SET = 282,
    ASC = 283,
    DESC = 284,
    INTEGER = 285,
    DECIMAL = 286,
    VARCHAR = 287,
    ERROR = 288,
    ASIGN = 289,
    DIFERENTQ = 290,
    MAYORIGUALQ = 291,
    MENORIGUALQ = 292,
    MAYORQ = 293,
    MENORQ = 294,
    IGUALQ = 295,
    MAS = 296,
    MENOS = 297,
    SLASH = 298,
    ASTERISCO = 299,
    IDENTIFIER = 300,
    CADENA = 301
  };
#endif
/* Tokens.  */
#define CREATE 258
#define DROP 259
#define PARABRE 260
#define PARCIERR 261
#define COMA 262
#define PUNTCOMA 263
#define SELECT 264
#define WHERE 265
#define GROUP_BY 266
#define ORDER_BY 267
#define NUMENTERO 268
#define NUMDECIMAL 269
#define AND 270
#define OR 271
#define INSERT 272
#define DELETE 273
#define UPDATE 274
#define MAX 275
#define MIN 276
#define AVG 277
#define COUNT 278
#define INTO 279
#define VALUES 280
#define FROM 281
#define SET 282
#define ASC 283
#define DESC 284
#define INTEGER 285
#define DECIMAL 286
#define VARCHAR 287
#define ERROR 288
#define ASIGN 289
#define DIFERENTQ 290
#define MAYORIGUALQ 291
#define MENORIGUALQ 292
#define MAYORQ 293
#define MENORQ 294
#define IGUALQ 295
#define MAS 296
#define MENOS 297
#define SLASH 298
#define ASTERISCO 299
#define IDENTIFIER 300
#define CADENA 301

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LAB02_HPP_INCLUDED  */
