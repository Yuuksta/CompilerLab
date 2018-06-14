/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_GRAMMER_TAB_H_INCLUDED
# define YY_YY_GRAMMER_TAB_H_INCLUDED
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
    Tif = 258,
    Telse = 259,
    Twhile = 260,
    Treturn = 261,
    Tint = 262,
    Tfloat = 263,
    Tchar = 264,
    Tvoid = 265,
    Tidentifier = 266,
    TfloatVal = 267,
    TintVal = 268,
    Tassign = 269,
    TcmpEqual = 270,
    TcmpNotEqual = 271,
    TlessThan = 272,
    TlessThanEq = 273,
    TmoreThan = 274,
    TmoreThanEq = 275,
    TleftParen = 276,
    TrightParen = 277,
    TleftBrace = 278,
    Tsemi = 279,
    TrightBrace = 280,
    Tdot = 281,
    Tcomma = 282,
    Tplus = 283,
    Tminus = 284,
    Tmul = 285,
    Tdiv = 286,
    Tmod = 287,
    Tand = 288,
    Tor = 289,
    TselfMinus = 290,
    TselfInc = 291
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 8 "grammer.y" /* yacc.c:1909  */

    Node *node;

#line 95 "grammer.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_GRAMMER_TAB_H_INCLUDED  */
