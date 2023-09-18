#include <stdio.h>
#include <stdlib.h>


void entitytop(FILE * fp)
{
    fprintf(fp,"entity TOP is \n\tPort(\t");
    
    int i, j;
    
    // 71 SV vector 8 dim (28 bits)
    fprintf(fp,"-- SV\n");
    for (i = 0; i <= 70 ; i++)
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
    for (i = 0; i <= 70 ; i++)
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


    fprintf(fp,"\t\t\t);\n");
}

void architecture(FILE * fp)
{
    fprintf(fp,"\n-- architecture Behavioral of TOP is\n\n");
}

void Kernel_rbf_signal(FILE * fp)
{
    fprintf(fp,"\n-- Kernel_rbf Signal\n");
    int i, j;
    for (i = 0; i <= 70; i++)
    {
        fprintf(fp,"signal Kernel_rbf_output_s%d : std_logic_vector(10 downto 0); \n",i);
    }
}

void connection_Kernel_rbf(FILE * fp)
{
    int i, j;
    for (i = 0; i <= 70; i++)
    {
        fprintf(fp,"\n\tKernel_rbf_%d : Kernel_rbf\n\tport map(\t", i);
        for (j = 0; j <= 7; j++)
        {
            fprintf(fp,"SV_dim%d => SV%d_dim%d,\n\t\t\t\t", j, i, j);
        }
        for (j = 0; j <= 7; j++)
        {
            fprintf(fp,"test_data_dim%d => test_data_dim0%d,\n\t\t\t\t", j, j);
        }
        fprintf(fp,"gamma => gamma,\n\t\t\t\t");
        fprintf(fp,"output => Kernel_rbf_output_s%d\n\t\t\t\t",i);
        fprintf(fp,");\n");
    }
}

void multiplier_signal(FILE * fp)
{
    int i, j;
    fprintf(fp,"\n-- Multiplier Signal\n");
    for (i = 0; i <= 70; i++)
    {
        fprintf(fp,"signal multi_s%d : std_logic_vector(12 downto 0);\n", i);
    }
}

void connection_multiplier(FILE * fp)
{
    int i, j;
    for (i = 0; i <= 70; i++)
    {
        fprintf(fp,"\n\tMultiplier_Signed_12bits_%d : Multiplier_Signed_12bits\n\tport map(\t", i);
        
        fprintf(fp,"input_a => SV%d_alphaY,\n\t\t\t\t", i);
        fprintf(fp,"input_b => '0' & Kernel_rbf_output_s%d,\n\t\t\t\t", i);
        fprintf(fp,"output => multi_s%d\n\t\t\t\t", i);
        fprintf(fp,");\n");
    }
}

void adder_signal(FILE * fp)
{
    int i, j;

    // Adder signal 
    fprintf(fp,"\n-- Adder Signal\n");
    for (i = 0; i <= 35; i++)
    {
        fprintf(fp,"signal add_output_s0%d : std_logic_vector(19 downto 0); \n", i);
    }
    for (i = 0; i <= 17; i++)
    {
        fprintf(fp,"signal add_output_s1%d : std_logic_vector(19 downto 0); \n", i);
    }
    for (i = 0; i <= 8; i++)
    {
        fprintf(fp,"signal add_output_s2%d : std_logic_vector(19 downto 0); \n", i);
    }
    for (i = 0; i <= 3; i++)
    {
        fprintf(fp,"signal add_output_s3%d : std_logic_vector(19 downto 0); \n", i);
    }
    fprintf(fp,"signal add_output_s40 : std_logic_vector(19 downto 0); \n");
    fprintf(fp,"signal add_output_s41 : std_logic_vector(19 downto 0); \n");
    fprintf(fp,"signal add_output_s50 : std_logic_vector(19 downto 0); \n");
    fprintf(fp,"signal add_output_s60 : std_logic_vector(19 downto 0); \n");
    for (i = 0; i <= 35; i++)
    {
        fprintf(fp,"signal add_overflow_s0%d : std_logic; \n", i);
    }
    for (i = 0; i <= 17; i++)
    {
        fprintf(fp,"signal add_overflow_s1%d : std_logic; \n", i);
    }
    for (i = 0; i <= 8; i++)
    {
        fprintf(fp,"signal add_overflow_s2%d : std_logic; \n", i);
    }
    for (i = 0; i <= 3; i++)
    {
        fprintf(fp,"signal add_overflow_s3%d : std_logic; \n", i);
    }
    fprintf(fp,"signal add_overflow_s40 : std_logic; \n");
    fprintf(fp,"signal add_overflow_s41 : std_logic; \n");
    fprintf(fp,"signal add_overflow_s50 : std_logic; \n");
    fprintf(fp,"signal add_overflow_s60 : std_logic; \n");
}

void connection_adder_0(FILE * fp)
{
    int i, j;
    for (i = 0; i <= 34; i++)
    {
        fprintf(fp,"\n\tAdder_Signed_20bits_0%d : Adder_Signed_20bits\n\tport map(\t", i);
        
        fprintf(fp,"input_a => multi_s%d,\n\t\t\t\t", 2*i);
        fprintf(fp,"input_b => multi_s%d,\n\t\t\t\t", 2*i+1);
        fprintf(fp,"output => add_output_s0%d,\n\t\t\t\t", i);
        fprintf(fp,"overflow => add_overflow_s0%d\n\t\t\t\t", i);
        fprintf(fp,");\n");
    }
    fprintf(fp,"\n\tAdder_Signed_20bits_035 : Adder_Signed_20bits\n\tport map(\t");
        
        fprintf(fp,"input_a => multi_s70,\n\t\t\t\t");
        fprintf(fp,"input_b => b,\n\t\t\t\t");
        fprintf(fp,"output => add_output_s035,\n\t\t\t\t");
        fprintf(fp,"overflow => add_overflow_s035\n\t\t\t\t");
        fprintf(fp,");\n");
}

void connection_adder_1(FILE * fp)
{
    int i, j;
    for (i = 0; i <= 17; i++)
    {
        fprintf(fp,"\n\tAdder_Signed_20bits_1%d : Adder_Signed_20bits\n\tport map(\t", i);
        
        fprintf(fp,"input_a => add_output_s0%d,\n\t\t\t\t", 2*i);
        fprintf(fp,"input_b => add_output_s0%d,\n\t\t\t\t", 2*i+1);
        fprintf(fp,"output => add_output_s1%d,\n\t\t\t\t", i);
        fprintf(fp,"overflow => add_overflow_s1%d\n\t\t\t\t", i);
        fprintf(fp,");\n");
    }
}

void connection_adder_2(FILE * fp)
{
    int i, j;
    for (i = 0; i <= 8; i++)
    {
        fprintf(fp,"\n\tAdder_Signed_20bits_2%d : Adder_Signed_20bits\n\tport map(\t", i);
        
        fprintf(fp,"input_a => add_output_s1%d,\n\t\t\t\t", 2*i);
        fprintf(fp,"input_b => add_output_s1%d,\n\t\t\t\t", 2*i+1);
        fprintf(fp,"output => add_output_s2%d,\n\t\t\t\t", i);
        fprintf(fp,"overflow => add_overflow_s2%d\n\t\t\t\t", i);
        fprintf(fp,");\n");
    }
}

void connection_adder_3plus(FILE * fp)
{
    int i, j;

    // 3
    for (i = 0; i <= 3; i++)
    {
        fprintf(fp,"\n\tAdder_Signed_20bits_3%d : Adder_Signed_20bits\n\tport map(\t", i);
        
        fprintf(fp,"input_a => add_output_s2%d,\n\t\t\t\t", 2*i);
        fprintf(fp,"input_b => add_output_s2%d,\n\t\t\t\t", 2*i+1);
        fprintf(fp,"output => add_output_s3%d,\n\t\t\t\t", i);
        fprintf(fp,"overflow => add_overflow_s3%d\n\t\t\t\t", i);
        fprintf(fp,");\n");
    }
    // 4
    for (i = 0; i <= 1; i++)
    {
        fprintf(fp,"\n\tAdder_Signed_20bits_4%d : Adder_Signed_20bits\n\tport map(\t", i);
        
        fprintf(fp,"input_a => add_output_s3%d,\n\t\t\t\t", 2*i);
        fprintf(fp,"input_b => add_output_s3%d,\n\t\t\t\t", 2*i+1);
        fprintf(fp,"output => add_output_s4%d,\n\t\t\t\t", i);
        fprintf(fp,"overflow => add_overflow_s4%d\n\t\t\t\t", i);
        fprintf(fp,");\n");
    }
    // 5
    fprintf(fp,"\n\tAdder_Signed_20bits_50 : Adder_Signed_20bits\n\tport map(\t");
    fprintf(fp,"input_a => add_output_s40,\n\t\t\t\t");
    fprintf(fp,"input_b => add_output_s41,\n\t\t\t\t");
    fprintf(fp,"output => add_output_s50,\n\t\t\t\t");
    fprintf(fp,"overflow => add_overflow_s50\n\t\t\t\t");
    fprintf(fp,");\n");
    // 6
    fprintf(fp,"\n\tAdder_Signed_20bits_60 : Adder_Signed_20bits\n\tport map(\t");
    fprintf(fp,"input_a => add_output_s50,\n\t\t\t\t");
    fprintf(fp,"input_b => add_output_s28,\n\t\t\t\t");
    fprintf(fp,"output => add_output_s60,\n\t\t\t\t");
    fprintf(fp,"overflow => add_overflow_s60\n\t\t\t\t");
    fprintf(fp,");\n");
}

int main(void)
{    
    FILE *fp;                           // File pointer
    fp = fopen("testtop.txt", "w");       // Open the file
    if(fp == NULL)                      // Check open error
    {
        printf("Error!");
        exit(1);
    }

    //entitytop(fp);
    //Kernel_rbf_signal(fp);
    //adder_signal(fp);
    //multiplier_signal(fp);
    
    //connection_Kernel_rbf(fp);
    //connection_multiplier(fp);
    //connection_adder_0(fp);
    //connection_adder_1(fp);
    //connection_adder_2(fp);
    //connection_adder_3plus(fp);





    fclose(fp);
    return 0;
}