/******************************************************************************
 * wizard.h                                                                   *
 * (c) 2012 Derrik Walker v2.0                                                *
 *                                                                            * 
 * This is licensed for use under the GNU General Pulbic License v2           *
 *                                                                            *
 * This is the main header file.                                              *
 *                                                                            *
 * 2015-04-27	DW2	Initial Release                                       *
 *                                                                            *
 ******************************************************************************/

/*
 * error handling
 */
void yyerror( char *msg );
void bounce( char *msg );

/*
 * misc IO
 */
void prtdbl( double number );
void prtstr( char * string );

/*
 * math 
 */
double divide( double dividend, double divisor );

double rad( double number );
double deg( double number );

double rnd( double number );

double function( int func, double number );

#define SQRT	1
#define CBRT	2

#define LOG	3
#define	EXP	4	

#define COS	5
#define SIN	6
#define	TAN	7
#define ACOS	8
#define ASIN	9
#define	ATAN	10

#define	RAD	11
#define	DEG	12

#define RND	13
