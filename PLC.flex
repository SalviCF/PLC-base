import java_cup.runtime.*;

%%

%cup
%line
Number = 0|[1-9][0-9]*
Identifier = [_a-z][_a-z0-9]*

%{
    public static int currentLabel = -1;
    public static String newLabel(){ return "L" + (++currentLabel); }
%}

%%

// KEYWORDS

"print"				{ return new Symbol(sym.PRINT); }
"if"                { return new Symbol(sym.IF, newLabel()); }
"else"              { return new Symbol(sym.ELSE); }
"while"             { return new Symbol(sym.WHILE, newLabel()); }
"do"                { return new Symbol(sym.DO, newLabel()); }
"for"               { return new Symbol(sym.FOR, newLabel()); }

// PARENTHESIS

"("					{ return new Symbol(sym.OP); }
")"					{ return new Symbol(sym.CP); }
"{"                 { return new Symbol(sym.OB); }
"}"                 { return new Symbol(sym.CB); }


// OPERATORS

"+"                 { return new Symbol(sym.ADD); }
"-"                 { return new Symbol(sym.SUB); }
"*"                 { return new Symbol(sym.MUL); }                        
"/"                 { return new Symbol(sym.DIV); }
"="                 { return new Symbol(sym.ASIG); }

";"					{ return new Symbol(sym.SC); }

// CONDITIONALS

"=="				{ return new Symbol(sym.DEQ); }
"<="                { return new Symbol(sym.LEQ); }
">="                { return new Symbol(sym.GEQ); }
"<"                 { return new Symbol(sym.LT); }
">"                 { return new Symbol(sym.GT); }
"!="                { return new Symbol(sym.NEQ); }

"&&"                { return new Symbol(sym.AND); }
"||"                { return new Symbol(sym.OR); }
"!"                 { return new Symbol(sym.NOT); }


// TERMINALS

{Number}		    { return new Symbol(sym.NUM, yytext()); }
{Identifier}        { return new Symbol(sym.ID, yytext()); }

// MISC

[ \t\n\r]			{ ; }
[^]					{ System.err.println("Unknown character " + yytext() + " at line " + yyline); }