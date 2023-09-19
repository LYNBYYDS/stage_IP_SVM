#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*---------------------------------------------------------------------------------------------------------------------*/
/*                                         void print2bin_44bits(int a, FILE * fp)                                     */ 
/*---------------------------------------------------------------------------------------------------------------------*/
// The function bin2dec_44bits is to convert a decimal number to binary number
// The decimal number is without sign
// The binary number is 44 bit 
void print2bin_44bits(int a, FILE * fp)
{
    // String where store the result and is initialized by 0
    char res[44] = "00000000000000000000000000000000000000000000";
   
    // Declare the value we are going to use i for iteration a_res for the inter_value
    int i, a_res;
    int a_int = a;

    // Pass the value 11 times to convert it to a 28 bit binary number
    for(i = 0; i <= 43; i++)
    {
        a_res = a_int%2;
        a_int = a_int/2;
        if (a_res)
        {
            res[43-i] = '1';
        }
        //printf("Value %d : (a_res)%d, (a_int)%d\n", i, a_res, a_int);   // Debug use
    }
    // Print the result
    //printf("The value converted : %s\n", res);
    fprintf(fp,"%s", res);
}



/*---------------------------------------------------------------------------------------------------------------------*/
/*                                            void dec2bin_11bits(double a)                                            */ 
/*---------------------------------------------------------------------------------------------------------------------*/
// The function dec2bin_11bits is to convert a decimal number to binary number
// The decimal number is without sign
// The binary number is 11 bit 1bits for integer part and 10 bits for the fractional part
void dec2bin_11bits(double a, FILE * fp)
{
    // Because the value binary with 10 bits for the fractional part
    // So i multiplier the value by 1024 for make the double to x*2¹⁰
    double a_vector = a*1024;
    
    // Declare the value we are going to use i for iteration a_res for the inter_value
    int i, a_res;
    
    // We only have the precision of 10 bits so we ignore the value under the precision
    // if the rest part is smaller than 0.5 which is 1/2¹
    int a_int = (int)a_vector;
    double a_fractional = a_vector - a_int;
    if (a_fractional >= 0.5)
        a_int++;
        
    // String where store the result and is initialized by 0
    char res[11] = "00000000000";
    //printf("res : %s", res); // Debug use
    
    // Pass the value 11 times to convert it to a 28 bit binary number
    for(i = 0; i <= 10; i++)
    {
        a_res = a_int%2;
        a_int = a_int/2;
        if (a_res)
        {
            res[10-i] = '1';
        }
        //printf("Value %d : (a_res)%d, (a_int)%d\n", i, a_res, a_int);   // Debug use
    }
    // Print the result
    //printf("The value converted : %s\n", res);
    fprintf(fp,"%s", res);
}


void print2bin_11bits (int a, int *  tab, FILE * fp)
{
    // print the result of exp(-a/1024) to the pointer fp
    double res = 0.0;
    // res used here to store the result of the value
    int print2bin_i;
    for(print2bin_i = 0; print2bin_i <= 999; print2bin_i++)
    {
        if (a <= tab[print2bin_i]) // Meabs the value is in the last range 
        {
            res = (print2bin_i+1)*0.001;
            // printf("res : %lf, tab[%d] : %d, res_bin : %s\n", res, i, tab[i], res_bin);      // Debug use
        }
    }
    //printf("a : %d, res : %lf\n", a, res);
    dec2bin_11bits(res, fp);
}


int main(void)
{
    int i;                              // For iteration


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
    /*for(i = 0; i <= 999; i++)
    {
        printf("table[%d] : %d  value[%d] : %lf\n", i, tab[i], i, value[i]);
    }*/


    /*---------------------------------------------------------------------------------------------------------------------*/
    /*                                                     File manager                                                    */
    /*---------------------------------------------------------------------------------------------------------------------*/
    
    FILE *fp;                           // File pointer
    fp = fopen("testc.txt", "w");       // Open the file
    if(fp == NULL)                      // Check open error
    {
        printf("Error!");
        exit(1);
    }
    
    
    for (i = 7783; i >= 0 ; i--)
    {
        fprintf(fp,"\"");
        print2bin_11bits (i, tab, fp);
        fprintf(fp,"\" when input = ");
        fprintf(fp,"\"");
        print2bin_44bits(i, fp);
        fprintf(fp,"\" else");
        fprintf(fp,"\n");
    }

    
    fclose(fp);
    return 0;
}