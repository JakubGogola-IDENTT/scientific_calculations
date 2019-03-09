%{
int yywrap();
int yylex();
%}

%x EXP
%x CHECK

%%


[0-9]e               {printf(" \\cdot 10^\{"); BEGIN(EXP);}
<EXP>{
    (\+)*       ;
    (\-)*       printf("-");
    [0-9]       ECHO;
    [^0-9]      printf("}$"); BEGIN(INITIAL);
}
%%

int yywrap() {
    return 1;
}

int main() {
    return yylex();
}