#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "data.h"

#define SV_NUMBER 2
#define TEST_NUMBER 3

/*---------------------------------------------------------------------------------------------------------------------*/
/*                                            void print_dec2bin_28bits(double a)                                      */ 
/*---------------------------------------------------------------------------------------------------------------------*/
// The function dec2bin_11bits is to convert a decimal number to binary number
// The decimal number is without sign
// The binary number is 11 bit 1bits for integer part and 10 bits for the fractional part
void print_dec2bin_28bits(double a, FILE * fp)
{
    int sign;
    // Because the value binary with 10 bits for the fractional part
    // So i multiplier the value by 1024 for make the double to x*2¹⁰
    double a_vector;
    if (a >= 0)
    {
        a_vector = a*1024;
        sign = 0;
    }else{
        a_vector = pow(2, 28)+a*1024;
        sign = 1;
    }
    // Declare the value we are going to use i for iteration a_res for the inter_value
    int i, a_res;
    
    // We only have the precision of 10 bits so we ignore the value under the precision
    // if the rest part is smaller than 0.5 which is 1/2¹
    int a_int = (int)a_vector;
    double a_fractional = a_vector - a_int;
    if (a_fractional >= 0.5)
        a_int++;
        
    // String where store the result and is initialized by 0
    char res[28] = "0000000000000000000000000000";
    //printf("res : %s", res); // Debug use
    
    // Pass the value 28 times to convert it to a 28 bit binary number
    for(i = 0; i <= 27; i++)
    {
        a_res = a_int%2;
        a_int = a_int/2;
        if (a_res)
        {
            res[27-i] = '1';
        }
        //printf("Value %d : (a_res)%d, (a_int)%d\n", i, a_res, a_int);   // Debug use
    }
    // Print the result
    //printf("The value converted : %s\n", res);
    fprintf(fp,"%.28s", res);
}

void print_dec2bin_12bits(double a, FILE * fp)
{
    // Because the value binary with 10 bits for the fractional part
    // So i multiplier the value by 1024 for make the double to x*2¹⁰
    double a_vector;
    int sign;
    if (a >= 0)
    {
        a_vector = a*1024;
        sign = 0;
    }else{
        a_vector = pow(2, 12)+a*1024;
        sign = 1;
    }
    // Declare the value we are going to use i for iteration a_res for the inter_value
    int i, a_res;
    
    // We only have the precision of 10 bits so we ignore the value under the precision
    // if the rest part is smaller than 0.5 which is 1/2¹
    int a_int = (int)a_vector;
    double a_fractional = a_vector - a_int;
    if (a_fractional >= 0.5)
        a_int++;
        
    // String where store the result and is initialized by 0
    char res[12] = "000000000000";
    //printf("res : %s", res); // Debug use
    
    // Pass the value 12 times to convert it to a 12 bit binary number
    for(i = 0; i <= 11; i++)
    {
        a_res = a_int%2;
        a_int = a_int/2;
        if (a_res)
        {
            res[11-i] = '1';
        }
        //printf("Value %d : (a_res)%d, (a_int)%d\n", i, a_res, a_int);   // Debug use
    }
    // Print the result
    //printf("The value converted : %s\n", res);
    fprintf(fp,"%.12s", res);
}

void print_dec2bin_20bits(double a, FILE * fp)
{
    // Because the value binary with 10 bits for the fractional part
    // So i multiplier the value by 1024 for make the double to x*2¹⁰
    double a_vector;
    int sign;
    if (a >= 0)
    {
        a_vector = a*1024;
        sign = 0;
    }else{
        a_vector = pow(2, 20)+a*1024;
        sign = 1;
    }
    // Declare the value we are going to use i for iteration a_res for the inter_value
    int i, a_res;
    
    // We only have the precision of 10 bits so we ignore the value under the precision
    // if the rest part is smaller than 0.5 which is 1/2¹
    int a_int = (int)a_vector;
    double a_fractional = a_vector - a_int;
    if (a_fractional >= 0.5)
        a_int++;
        
    // String where store the result and is initialized by 0
    char res[20] = "00000000000000000000";
    //printf("res : %s", res); // Debug use
    
    // Pass the value 20 times to convert it to a 20 bit binary number
    for(i = 0; i <= 19; i++)
    {
        a_res = a_int%2;
        a_int = a_int/2;
        if (a_res)
        {
            res[19-i] = '1';
        }
        //printf("Value %d : (a_res)%d, (a_int)%d\n", i, a_res, a_int);   // Debug use
    }
    // Print the result
    //printf("The value converted : %s\n", res);
    fprintf(fp,"%.20s", res);
}

void entity(FILE * fp)
{
    fprintf(fp, "entity TOP_tb is\n--\tPort();\nend TOP_tb;\n\n");
}

void component_TOP(FILE * fp, int SV_number)
{
    int i, j;
    fprintf(fp,"architecture Behavioral of TOP_tb is\n\n");
    fprintf(fp,"component TOP is \n\tport(\t");
    
    // x SV vector 8 dim (28 bits)
    fprintf(fp,"-- SV\n");
    for (i = 0; i <= SV_number-1 ; i++)
    {
        for(j = 0; j <= 7; j++)
        {
            fprintf(fp,"\t\t\tSV%d_dim%d : in std_logic_vector(27 downto 0); \n", i, j);
        }
    }

    // Test Data 8 dim (28 bits)
    fprintf(fp,"\n\t\t\t-- Test Data\n");
    for(j = 0; j <= 7; j++)
    {
        fprintf(fp,"\t\t\ttest_data_dim%d : in std_logic_vector(27 downto 0); \n", j);
    }
    
    // index of SV alpha * Y (12 bits)
    fprintf(fp,"\n\t\t\t-- alpha * Y\n");
    for (i = 0; i <= SV_number-1 ; i++)
    {
        fprintf(fp,"\t\t\tSV%d_alphaY : in std_logic_vector(11 downto 0); \n", i);
    }
    
    // gamma (12 bits)
    fprintf(fp,"\n\t\t\t-- gamma\n");
    fprintf(fp,"\t\t\tgamma : in std_logic_vector(11 downto 0); \n");
    
    // b constant (about 12 bits but we have adder with 20 bits)
    fprintf(fp,"\n\t\t\t-- b\n");
    fprintf(fp,"\t\t\tb : in std_logic_vector(19 downto 0); \n");

    // output
    fprintf(fp,"\n\t\t\t-- output\n");
    fprintf(fp,"\t\t\toutput : out std_logic \n");


    fprintf(fp,"\t\t\t);\n\n");
    fprintf(fp,"end component;\n\n");
}

void signal_SV(FILE * fp, int SV_number, double * SV)
{
    int i, j;
    for (i = 0; i <= SV_number-1; i++)
    {
        for (j = 0; j <= 7; j++)
        {
            fprintf(fp, "signal SV%d_dim%d : std_logic_vector(27 downto 0) := \"", i, j);
            print_dec2bin_28bits(SV[i*8+j], fp);
            fprintf(fp, "\";\n");
        }
    }
    fprintf(fp, "\n");
}

void signal_test_data(FILE * fp, int TEST_number)
{
    int i;
    for (i = 0; i <= TEST_number-1; i++)
    {
    fprintf(fp, "test_data_dim%d : in std_logic_vector(27 downto 0) => (others => '0'); \n", i);
    }
    fprintf(fp, "\n");
}

void signal_SV_alphaY(FILE * fp, int SV_number, double * result_alphaY, double * X_test)  
{
    int i;
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp, "signal SV%d_alphaY : std_logic_vector(11 downto 0) := \"", i);
        print_dec2bin_12bits(result_alphaY[i], fp);
        fprintf(fp, "\";\n");        
    }
    fprintf(fp, "\n");
}

void signal_gamma(FILE * fp, double gamma)
{
    fprintf(fp, "signal gamma : std_logic_vector(11 downto 0) := \"");
    print_dec2bin_12bits(gamma, fp);
    fprintf(fp, "\";\n");
    fprintf(fp, "\n");
}

void signal_b(FILE * fp, double b)
{
    fprintf(fp, "signal b : std_logic_vector(19 downto 0) := \"");
    print_dec2bin_20bits(b, fp);
    fprintf(fp, "\";\n");
    fprintf(fp, "\n");
}

void signal_output(FILE * fp)
{
    fprintf(fp, "signal output : std_logic;\n");
    fprintf(fp, "\n");
}

void connect_top(FILE * fp, int SV_number)
{
    fprintf(fp, "\tTOP_0 : TOP\n\t\tport map(\t");
    int i, j;

    // SV vector 8 dim (28 bits)
    for (i = 0; i <= SV_number-1 ; i++)
    {
        for(j = 0; j <= 7; j++)
        {
            if(i != 0 || j != 0)
            {
                fprintf(fp,"\t\t\t\t\t");
            }
            fprintf(fp,"SV%d_dim%d => SV%d_dim%d,\n", i, j, i, j);
        }
    }

    // Test Data 8 dim (28 bits)
    for(j = 0; j <= 7; j++)
    {
        fprintf(fp,"\t\t\t\t\ttest_data_dim%d => test_data_dim%d, \n", j, j);
    }
    
    // index of SV alpha * Y (12 bits)
    for (i = 0; i <= SV_number-1 ; i++)
    {
        fprintf(fp,"\t\t\t\t\tSV%d_alphaY => SV%d_alphaY, \n", i, i);
    }
    
    // gamma (12 bits)
    fprintf(fp,"\t\t\t\t\tgamma => gamma, \n");
    
    // b constant 
    fprintf(fp,"\t\t\t\t\tb => b, \n");

    // output
    fprintf(fp,"\t\t\t\t\toutput => output \n");


    fprintf(fp,"\t\t\t\t\t);\n\n");

}

void connect_test_data(FILE * fp, int TEST_number, double * X_test)
{
    int i, j;
    for (i = 0; i <= 7; i++)
    {
        fprintf(fp, "\ttest_data_dim%d <= \"", i);
        for (j = 0; j <= TEST_number-1; j++)
        {
            print_dec2bin_28bits(X_test[j*8+i], fp);
            if (j != 17)
            {
                fprintf(fp, "\" after %d ns, \"", (j+1)*10);
            }else{
                fprintf(fp, "\" after %d ns;", (j+1)*10);
            }
        }      
        fprintf(fp, "\n");
    }
}

void architecture(FILE * fp, int SV_number, int TEST_number, double * SV, double * result_alphaY, double * X_test, double gamma, double b)
{
    component_TOP(fp, SV_number);

    signal_SV(fp, SV_number, SV);
    signal_test_data(fp, TEST_number);
    signal_SV_alphaY(fp, SV_number, result_alphaY, X_test);
    signal_gamma(fp, gamma);
    signal_b(fp, b);

    fprintf(fp, "begin\n\n");

    connect_top(fp, SV_number);
    
    connect_test_data(fp, TEST_number, X_test);

    
    fprintf(fp, "end Behavioral;\n\n");
}




int main(void)
{      
    // Result of the python training model 
        double SV[SV_NUMBER*8];
        double result_alphaY[SV_NUMBER];
        double X_test[TEST_NUMBER*8];
        double gamma, b;

    FILE *fp;                           // File pointer
    fp = fopen("TOP_tb.txt", "w");       // Open the file
    if(fp == NULL)                      // Check open error
    {
        printf("Error!");
        exit(1);
    }
    
    inport_value(SV, result_alphaY, X_test, &gamma, &b);    // Get the data from the python training model
    entity(fp);                         // Print the entity
    architecture(fp, SV_NUMBER, TEST_NUMBER, SV, result_alphaY, X_test, gamma, b); // Print the architecture


    fclose(fp);
    return 0;
}