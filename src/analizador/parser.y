%{ 
   #include<stdio.h> 

   int yylex(void);
   void yyerror(char *s);
%} 
  
%token NUMBER 
  
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'
  
/* Rule Section */
%% 
  
Init
   : Expr
   { 
      printf("\nResult=%d\n", $$); 
      return 0; 
   }
;

Expr 
   : Expr '+' Expr 
   {
      $$ = $1 + $3; 
   } 
   | Expr '-' Expr 
   {
      $$ = $1 - $3;
   } 
   | Expr '*' Expr 
   {
      $$ = $1 * $3;
   } 
   | Expr '/' Expr 
   {
      $$ = $1/$3;
   } 
   |'(' Expr ')' 
   {
      $$ = $2;
   } 
   | NUMBER 
   {
      $$ = $1;
   } 
; 
  
%% 
  
//driver code 
void main() 
{ 
   printf("Ingrese una operacion: "); 
   yyparse(); 
} 
  
void yyerror(char *s) 
{ 
   printf("\nEntered arithmetic expression is Invalid\n\n"); 
} 