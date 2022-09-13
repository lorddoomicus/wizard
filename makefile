#
# (c) 2015 Derrik Walker v2.0
# This is licensed for use under the GNU General Public License v2
#
# 2015-04-27	dwalker		Initial Version 
#

wizard: wizard.l wizard.y
	bison -d wizard.y
	flex wizard.l
	cc wizard.c wizard.tab.c lex.yy.c -lm -o wizard -O3

clean: 
	rm -f *.o core wizard lex.yy.c wizard.tab.c wizard.tab.h
