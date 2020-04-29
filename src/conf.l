%{
    #include<iostream>
    #include<stdio.h>
    #include<vector>
    #include<string>
    using namespace std;
    bool declarationFlag=0;
    string saveDataType;
%}
variable [a-zA-Z][A-Za-z0-9]*
dataType "int"|"float"|"char"
colon ";"
integer [0-9]*
openSquareBracket "["
closeSquareBracket "]"
space " "
pointer "*"
%%
{dataType}{space} {
    cout<<yytext;
    declarationFlag=1;
    saveDataType=string(yytext);
};
{variable}{space}*{openSquareBracket}{space}*{integer}{space}*{closeSquareBracket} {
    if(declarationFlag){
        string s=string(yytext);
        int starting=s.find("[");
        int ending=s.find("]");
        string newString=s.substr(starting+1,ending-starting-1);
        int size=stoi(newString);
        string variableName=s.substr(0,starting);
        cout<<"*"<<variableName<<"=("<<saveDataType<<"*)malloc(sizeof("<<saveDataType<<")*"<<size<<")";
    }
    else{
        cout<<yytext;
    }
};
{colon} {
    cout<<yytext<<"\n";
    declarationFlag=0;
};
{space}* {
    cout<<" ";
};
. {
    cout<<yytext;
}
%%

int yywrap(){

}
int main(int argc,char **argv){
    yylex();
}