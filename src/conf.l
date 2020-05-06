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
    // cout<<yytext;
    fprintf(yyout,"%s",yytext);
    declarationFlag=1;
    saveDataType=string(yytext);
};
{variable}{space}*{openSquareBracket}{space}*{integer}{space}*{closeSquareBracket} {
    if(declarationFlag){
        string s=string(yytext);
        int starting=s.find("[");
        int ending=s.find("]");
        string newString=s.substr(starting+1,ending-starting-1);
        // int size=stoi(newString);
        string variableName=s.substr(0,starting);
        string output_string="*"+variableName+"=("+saveDataType+"*)malloc(sizeof("+saveDataType+")*"+newString+")";
        fprintf(yyout,"%s",output_string.c_str());
    }
    else{
        // cout<<yytext;
        fprintf(yyout,"%s",yytext);
    }
};
{colon} {
    // cout<<yytext<<"\n";
    fprintf(yyout,"%s",yytext);
    declarationFlag=0;
};
{space}* {
    // cout<<" ";
    fprintf(yyout," ");
};
. {
    // cout<<yytext;
    fprintf(yyout,"%s",yytext);
}
%%

int yywrap(){

}
int main(int argc,char **argv){
    FILE *file1,*file2;
    file1=fopen(argv[1],"r");
    file2=fopen(argv[2],"w");
    if(!file1||!file2){
        cout<<"No file Found"<<endl;
    }
    else{
        yyin=file1;
        yyout=file2;
        yylex();
    }
}