/*
 * (c) 2015 Derrik Walker v2.0
 * This is licensed for use under the GNU General Public License v2
 *
 * 2015-04-27	dwalker		Initial Version 
 */

%option noyywrap nodefault

%{
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include "wizard.h"
#include "wizard.tab.h"

int line = 1;
extern double prev;
%}

/* exponent definition */
E	([Ee][-+]?[0-9]+)

%%

[0-9]+"."[0-9]*{E}?|"."?[0-9]+{E}? {

			yylval.number = atof( yytext );
			return NUMBER; 
		}

"+"|"-"|"*"|"/"|"^"|"("|")"	{ return yytext[0]; } 

\"		{ return yytext[0]; }

"pi"		{ yylval.number = M_PI;	return NUMBER; }
"e"		{ yylval.number = M_E;	return NUMBER; }

"."		{ yylval.number = prev;	return NUMBER; }

"sqrt"		{ yylval.function = SQRT; return FUNCTION; }
"cbrt"		{ yylval.function = CBRT; return FUNCTION; }

"log"		{ yylval.function = LOG; return FUNCTION; }
"exp"		{ yylval.function = EXP; return FUNCTION; }

"cos"		{ yylval.function = COS; return FUNCTION; }
"sin"		{ yylval.function = SIN; return FUNCTION; }
"tan"		{ yylval.function = TAN; return FUNCTION; }

"acos"		{ yylval.function = ACOS; return FUNCTION; }
"asin"		{ yylval.function = ASIN; return FUNCTION; }
"atan"		{ yylval.function = ATAN; return FUNCTION; }

"rad"		{ yylval.function = RAD; return FUNCTION; }
"deg"		{ yylval.function = DEG; return FUNCTION; }

"rnd"		{ yylval.function = RND; return FUNCTION; }

q		{ return QUIT; }

\n		{ line++; return EOL; }

#.*|[ \t]	{ ; }	/* ignore comments starting with # and white spaces */

\".*\"		{	
			yylval.string = malloc( strlen( yytext ) + 1 );
			strcpy( yylval.string, yytext );
			return STRING; 
		}

.		{ yyerror( "Syntax error" ); }

%%
