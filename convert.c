#include <stdio.h>
#include <math.h>

// The function dec2bin is to convert a decimal number to binary number
// The decimal number is without sign
// The binary number is 28 bit 18bits for integer part and 10 bits for the fractional part
char * dec2bin_28bits(double a)
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
    char res[29] = "00000000000000000000000000000";
    //printf("res : %s", res); // Debug use
    
    // Pass the value 28 times to convert it to a 28 bit binary number
    for(i = 0; i <= 28; i++)
    {
        a_res = a_int%2;
        a_int = a_int/2;
        if (a_res)
        {
            res[28-i] = '1';
        }
        //printf("Value %d : (a_res)%d, (a_int)%d\n", i, a_res, a_int);   // Debug use
    }
    // Print the result
    printf("The value converted : %s\n", res);
    return res;
}

// The function dec2bin_11bits is to convert a decimal number to binary number
// The decimal number is without sign
// The binary number is 11 bit 1bits for integer part and 10 bits for the fractional part
char * dec2bin_11bits(double a)
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
    
    // Pass the value 28 times to convert it to a 28 bit binary number
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
    printf("The value converted : %s\n", res);
    return res;
}

int main(void)
{
    // Debug use for dec2bin function
    /*double a;
    printf("Enter the number you want to convert : \n");
    scanf("%f", &a);
    dec2bin_11bits(a);
    */
    // File R/W
    /*
    char *filename = "vhdl_code.txt";
    
    // open the file for writing
    FILE *fp = fopen(filename, "w");
    if (fp == NULL)
    {
        printf("Error opening the file %s", filename);
        return -1;
    }
    
    // write to the text file
    for (int i = 0; i < 10; i++)
        fprintf(fp, "This is the line #%d\n", i + 1);

    // close the file
    fclose(fp);
    */
    
    

}
