/*
 * (c) 2015 Derrik Walker v2.0
 * This is licensed for use under the GNU General Public License v2
 *
 * 2015-04-27	dwalker		Initial version 
 * 2022-09-13	dwalker		Updated for c99 compliance
 */                                                      
 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <setjmp.h>
#include <time.h>
#include "wizard.h"

jmp_buf here;
double prev;

int main( int argc, char **argv ) {

	extern FILE* yyin;

	if( argc > 1 ) 

		if( !( yyin = fopen( argv[1], "r")) ) {
			perror( argv[1] );
			return( 1 );
		}
	
	setjmp( here );
	yyparse();
}

void yyerror( char *msg ) {

	extern int line;

	fprintf( stderr, "ERRR!!! %s on line %d\n", msg, line );
}

void bounce( char *msg ) {

	yyerror( msg );
	longjmp( here, 0 );
}

void prtstr ( char* string ) {

	char *printable;

	printable = strtok( string, "\"" );

	if( printable == NULL ) 
		printf( "\n" );

	else
		printf( "%s", printable ); 

	free( string );
}
void prtdbl( double number ) {

	prev = number;

	printf( "%.16g\n", prev );
}

double function( int func, double number ) {

	double ans;

	switch( func ) {

		case SQRT:
			ans = sqrt( number );
			break;

		case CBRT:
			ans = cbrt( number );
			break;

		case LOG:
			ans = log( number );
			break;

		case EXP:
			ans = exp( number );
			break;

		case COS:
			ans = cos( number );
			break;

		case SIN:
			ans = sin( number );
			break;

		case TAN:
			ans = tan( number );
			break;

		case ACOS:
			ans = acos( number );
			break;

		case ASIN:
			ans = asin( number );
			break;

		case ATAN:
			ans = atan( number );
			break;

		case RAD:
			ans = rad( number );
			break;

		case DEG:
			ans = deg( number );
			break;

		case RND:
			ans = rnd( number );
			break;

		default:
			yyerror( "function error" );
	}
	
	return ans;

}

double divide( double dividend, double divisor ) {

	if ( divisor == 0.0 ) bounce( "division by zero" );

	return( dividend / divisor );

}

double rad ( double number ) { return (( M_PI / 180 ) * number ); }

double deg ( double number ) { return (( 180 / M_PI ) * number ); }

double rnd ( double number ) {
	srand( time( NULL ));
	return rand() % (int) number;
}
