/*
 * (c) 2015 Derrik Walker v2.0
 * This is licensed for use under the GNU General Pulbic License v2
 *
 * 2015-04-27	dwalker		Initial Version 
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "wizard.h"

extern double prev;
%}

%union {
        double  number;
	int	function;
	char*	string;
}

%token	<number>	NUMBER
%token	<function>	FUNCTION
%token 	<string>	STRING
%token			EOL
%token			QUIT

%type 	<number>	expr
%type 	<string>	str

%left	'+' '-'
%left	'*' '/'
%left	FUNCTION
%right	'^'
%left	NEGATE

%%

list:
	| list EOL 
	| list str EOL		{ prtstr( $2 ); }
	| list expr EOL		{ prtdbl( $2); }
	| list error EOL	{ yyerrok; }
	;

str:	STRING

expr:	NUMBER			{ $$ = $1; }
	| expr '+' expr		{ $$ = $1 + $3; }
	| expr '-' expr		{ $$ = $1 - $3; }
	| expr '*' expr		{ $$ = $1 * $3; }
	| expr '/' expr		{ $$ = divide( $1, $3 ); }
	| FUNCTION expr		{ $$ = function( $1, $2 ); }
	| '(' expr ')'		{ $$ = $2; }
	| expr '^' expr 	{ $$ = pow( $1, $3 ); }
	| '-' expr %prec NEGATE { $$ = -$2; }

	| QUIT			{ exit( 0 ); }
	;
	
%%
