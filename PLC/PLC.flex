import java_cup.runtime.*;

%%

%cup
%line
Number = 0|[1-9][0-9]*
Identifier = [_a-z][_a-z0-9]*

%%

// KEYWORDS

"print"				{ return new Symbol(sym.PRINT); }


// PARENTHESIS

"("					{ return new Symbol(sym.OP); }
")"					{ return new Symbol(sym.CP); }


// OPERATORS

"+"                 { return new Symbol(sym.ADD); }
"-"                 { return new Symbol(sym.SUB); }
"*"                 { return new Symbol(sym.MUL); }                        
"/"                 { return new Symbol(sym.DIV); }

";"					{ return new Symbol(sym.SC); }


// TERMINALS

{Number}		    { return new Symbol(sym.NUM, yytext()); }
{Identifier}        { return new Symbol(sym.ID, yytext()); }

// MISC

[ \t\n\r]			{ ; }
[^]					{ System.err.println("Unknown character " + yytext() + " at line " + yyline); }
