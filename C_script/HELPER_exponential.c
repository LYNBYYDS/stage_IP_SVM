#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

/*---------------------------------------------------------------------------------------------------------------------*/
/*                            void print_dec2bin_unsigned_44bits(double a, FILE * fp)                                  */ 
/*---------------------------------------------------------------------------------------------------------------------*/
// The function print_dec2bin_unsigned_44bits is to convert a decimal number to binary number and print the result to the pointer fp
// The input is a decimal number is without sign 
// The result is a 44 bits fixed point value(binary) without sign and 10 bits for the fraction part
void print_dec2bin_unsigned_44bits(double a, FILE * fp)
{
    // String where store the result and is initialized by 0
    char res[] = "00000000000000000000000000000000000000000000";
   
    // Declare the value we are going to use
    // i for iteration 
    int i;
    double a_fp;
    int a_fp_int, a_res, a_stock, a_check;
    int a_int = a;

    // printf("Value to Convert : %lf\n", a);   // Debug used 
    // Get the integer part of the value a*1024 which will be convert to the result binary value
    a_fp = a*1024;
    // printf("a_fp : %lf\n", a_fp);    // Debug used 
    a_fp_int = (int) a_fp;   // get the integer part of the value need to be convert
    if ((a_fp - a_fp_int) >= 0.5)   // when the rest parts is bigger or equal to 0.5 then increase one
        a_fp_int++;
    a_stock = a_fp_int;
    // printf("Integer part : %d\n", a_fp_int); // Debug used 

    // Devise the value by 2 28 times to convert it to a 28 bit binary number
    for(i = 0; i <= 43; i++)
    {
        a_res = a_fp_int%2;
        a_fp_int = a_fp_int/2;
        if (a_res)
        {
            res[43-i] = '1';
            // printf("%d : %.44s\n", a_res, res);  // Debug used 
            
        }else{
            // printf("%d : %.44s\n", a_res, res);  // Debug used 
        }
    }

    // Recheck part
    if (res[43] == '1')
    {
        a_check = 1;
    }else {
        a_check = 0;
    }
    // printf("%d : %d\n", 0 , a_check);     // Debug used 
    for(i = 1; i <= 43; i++)
    {
        if (res[43-i] == '1')
            a_check = a_check + (int)pow(2.0, i);
        // printf("%d : %d\n", i , a_check);    // Debug used 
    }

    // Print the result to the file with the pointer fp when the result is correct
    if (a_check == a_stock)
    {
        // printf("The result is correct"); // Debug used 
        fprintf(fp,"%.44s", res);
    }else{
        // printf("The result is uncorrect a_check : %d, a_fp_int : %d", a_check, a_fp_int);    // Debug used 
    }
}

/*---------------------------------------------------------------------------------------------------------------------*/
/*                            void print_dec2bin_unsigned_11bits(double a, FILE * fp)                                  */ 
/*---------------------------------------------------------------------------------------------------------------------*/
// The function print_dec2bin_unsigned_11bits is to convert a decimal number to binary number and print the result to the pointer fp
// The input is a decimal number is without sign 
// The result is a 11 bits fixed point value(binary) without sign and 10 bits for the fraction part
void print_dec2bin_unsigned_11bits(double a, FILE * fp)
{
    // String where store the result and is initialized by 0
    char res[] = "00000000000";
   
    // Declare the value we are going to use
    // i for iteration 
    int i;
    double a_fp;
    int a_fp_int, a_res, a_stock, a_check;
    int a_int = a;

    // Get the integer part of the value a*1024 which will be convert to the result binary value
    a_fp = a*1024;
    a_fp_int = (int) a_fp;   // get the integer part of the value need to be convert
    if ((a_fp - a_fp_int) >= 0.5)   // when the rest parts is bigger or equal to 0.5 then increase one
        a_fp_int++;
    a_stock = a_fp_int;

    // Devise the value by 2 11 times to convert it to a 11 bit binary number
    for(i = 0; i <= 10; i++)
    {
        a_res = a_fp_int%2;
        a_fp_int = a_fp_int/2;
        if (a_res)
        {
            res[10-i] = '1'; 
        }
    }

    // Recheck part
    if (res[10] == '1')
    {
        a_check = 1;
    }else {
        a_check = 0;
    }
    
    for(i = 1; i <= 10; i++)
    {
        if (res[10-i] == '1')
        {
            a_check = a_check + (int)pow(2.0, i);
        }
    }

    // Print the result to the file with the pointer fp when the result is correct
    if (a_check == a_stock)
    {
        fprintf(fp,"%.11s", res);
        // printf("The result is  a : %lf a_check : %d, a_fp_int : %d",a , a_check, a_fp_int);    // Debug used 
    }else{
            printf("%d, %d", a_check, a_stock);
    }
}

/*---------------------------------------------------------------------------------------------------------------------*/
/*                            void print_result_exp(double a, int * tab, FILE * fp)                                    */ 
/*---------------------------------------------------------------------------------------------------------------------*/
// The function print_result_exp is to write the reult of the exp(-a/1024) to the pointer fp
// The input is a decimal number is without sign (always positive)
// The result is a 11 bits fixed point value(binary) without sign and 10 bits for the fraction part
void print_result_exp(int a, int * tab, FILE * fp)
{
    int i, res_t;
    double res;
    res_t = 0;
    for (i = 0; i <= 1000; i++)
    {
        if(tab[i] >= a)
        {
            res_t = i;
        }
    }
    res = res_t * 0.001;
    // printf("The result of exp(-%d/1024) = %lf : compare %lf\n", a, res, exp(-1.0*a/1024));   // Debug used
    print_dec2bin_unsigned_11bits(res, fp);
}

int main(void)
{
    /* Intializes random number generator */
    time_t t;
    srand((unsigned) time(&t));

    /* Variables */ 
    int i;  // For iteration


    /*---------------------------------------------------------------------------------------------------------------------*/
    /*                                             Create table with the critical values                                   */ 
    /*---------------------------------------------------------------------------------------------------------------------*/
    
    double j = 0.0;                     
    int tab[1001] = {0};                // The table that store all the last value belong to 
    double value[1000] = {0.0};         // The table store the value of exp()
    int k = 0;                          // Table index

    for(i = 8000; i >= 0 ; i--)
    {       
        if (exp(-1.0*i/1024) >= (j +0.0005))// Then means that the value passed 0.50.001 so the result is j+0.001
        {
            //printf("a_exp : %lf, compare : %lf\n", a_exp, j+0.0005);
            tab[k] = i + 1;
            value[k] = exp(-1.0*(i+1)/1024);
            k++;
            j+=0.001;
        }
    }

    /* Debug use*/
    /*
    for (i = 0; i <= 1000 ; i++){
        printf("tab[%d] : %d\n", i, tab[i]);
    }

    for(i = 0; i <= 999; i++)
    {
        printf("table[%d] : %d  value[%d] : %lf\n", i, tab[i], i, value[i]);
    }*/


    /*---------------------------------------------------------------------------------------------------------------------*/
    /*                                                     File manager                                                    */
    /*---------------------------------------------------------------------------------------------------------------------*/
    
    FILE *fp;                                   // File pointer
    fp = fopen("exponential.txt", "w");         // Open the file
    if(fp == NULL)                              // Check open error
    {
        printf("Error!");
        exit(1);
    }
    
    /* Debug used*/
    // print_dec2bin_unsigned_44bits((double)(rand() % 17592186044415)/1024, fp);    // Debug used 
    // print_dec2bin_unsigned_11bits((double)(rand() % 2047)/1024, fp); // Debug used 
    // print_result_exp(1374, tab, fp);

    fprintf(fp, "entity Exponential is\n");
    fprintf(fp, "\tport(\tinput : in std_logic_vector(43 downto 0);\n");
    fprintf(fp, "\t\t\toutput : out std_logic_vector(10 downto 0)\n");
    fprintf(fp, "\t\t\t);\n");
    fprintf(fp, "end Exponential;\n\n");
    fprintf(fp, "architecture Behavioral of Exponential is\n\n");
    fprintf(fp, "begin\n\n");
    fprintf(fp, "\toutput <= \t");
    for (i = 7783; i >= 0 ; i--)
    {
        if (i != 7783)
            fprintf(fp,"\t\t\t\t");
        fprintf(fp,"\"");
        print_result_exp(i, tab, fp);
        fprintf(fp,"\" when input = ");
        fprintf(fp,"\"");
        print_dec2bin_unsigned_44bits((double)1.0*i/1024, fp);
        fprintf(fp,"\" else");
        fprintf(fp,"\t--exp(-%d/1024) = exp (%.3lf) = %.3lf\n", -1*i, -1.0*i/1024, exp(-1.0*i/1024));
    }
    fprintf(fp, "\t\t\t\t\"00000000000\";\n\n");
    fprintf(fp, "end Behavioral;\n");
    
    /*
    for (i = 7783; i >= 0 ; i--)
    {
        fprintf(fp,"\"");
        print2bin_11bits ((double)(i/1024.0), tab, fp);
        fprintf(fp,"\" when input = ");
        fprintf(fp,"\"");
        print2bin_44bits(i, fp);
        fprintf(fp,"\" else");
        fprintf(fp,"\n");
    }*/
    fclose(fp);
    return 0;
}