%{ 
  #include<stdio.h> 
  #include "y.tab.h" 
  extern int yylval; 
  void yyerror(char *);
%} 
  
/* Rule Section */
%% 
[0-9]+               { yylval=atoi(yytext); return NUMBER; } 
[-()+*/]             { return *yytext; }
[\t] ; 
[\n] return 0; 
.                yyerror("Unknown character");
  
%% 
  
int yywrap() { 
 return 1; 
} 