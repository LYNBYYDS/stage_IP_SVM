#include <stdio.h>
#include <stdlib.h>


void Kernel_rbf_signal(FILE * fp, int SV_number)
{
    int i;
    fprintf(fp,"-- Kernel_rbf output Signal\n");
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"signal Kernel_rbf_output_s%d : std_logic_vector(10 downto 0); \n",i);
    }
    fprintf(fp,"\n");
}

void multiplier_signal(FILE * fp, int SV_number)
{
    int i;
    fprintf(fp,"-- Multiplier output Signal\n");
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"signal multi_s%d : std_logic_vector(12 downto 0);\n", i);
    }
    fprintf(fp,"\n");
}

void convertor_signal(FILE * fp, int SV_number)
{
    int i;
    fprintf(fp,"-- Convertor output Signal\n");
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"signal conv_s%d : std_logic_vector(19 downto 0);\n", i);
    }
    fprintf(fp,"\n");
}

void adder_signal(FILE * fp, int SV_number)
{
    int i;
    fprintf(fp,"-- Adder output Signal\n");
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"signal add_output_s%d : std_logic_vector(19 downto 0);\n", i);
    }
    fprintf(fp,"\n");
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"signal add_overflow_s%d : std_logic;\n", i);
    }
    fprintf(fp,"\n");
}




void connection_Kernel_rbf(FILE * fp, int SV_number)
{
    int i, j;
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"\tKernel_rbf_%d : Kernel_rbf\n\tport map(\t", i);
        for (j = 0; j <= 7; j++)
        {
            fprintf(fp,"SV_dim%d => SV%d_dim%d,\n\t\t\t\t", j, i, j);
        }
        for (j = 0; j <= 7; j++)
        {
            fprintf(fp,"test_data_dim%d => test_data_dim%d,\n\t\t\t\t", j, j);
        }
        fprintf(fp,"gamma => gamma,\n\t\t\t\t");
        fprintf(fp,"output => Kernel_rbf_output_s%d\n\t\t\t\t",i);
        fprintf(fp,");\n\n");
    }
}

void connection_multiplier(FILE * fp, int SV_number)
{
    int i;
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"\tMultiplier_Signed_12bits_%d : Multiplier_Signed_12bits\n\tport map(\t", i);
        fprintf(fp,"input_a => SV%d_alphaY,\n\t\t\t\t", i);
        fprintf(fp,"input_b(11) => '0',\n\t\t\t\t");
        fprintf(fp,"input_b(10 downto 0) => Kernel_rbf_output_s%d,\n\t\t\t\t", i);
        fprintf(fp,"output => multi_s%d\n\t\t\t\t", i);
        fprintf(fp,");\n\n");
    }
}

void connection_convertor(FILE * fp, int SV_number)
{
    int i;
    for (i = 0; i <= SV_number-1; i++)
    {
        fprintf(fp,"\tConvertor_Signed_13to20bits_%d : Convertor_Signed_13to20bits\n\tport map(\t", i);
        fprintf(fp,"input => multi_s%d,\n\t\t\t\t", i);
        fprintf(fp,"output => conv_s%d\n\t\t\t\t", i);
        fprintf(fp,");\n\n");
    }
}

void connection_adder(FILE * fp, int SV_number)
{
    int i;
    fprintf(fp,"\tAdder_Signed_20bits_0 : Adder_Signed_20bits\n\tport map(\t");
        
        fprintf(fp,"input_a => b,\n\t\t\t\t");
        fprintf(fp,"input_b => conv_s0,\n\t\t\t\t");
        fprintf(fp,"output => add_output_s0,\n\t\t\t\t");
        fprintf(fp,"overflow => add_overflow_s0\n\t\t\t\t");
        fprintf(fp,");\n\n");
    for (i = 1; i <= SV_number-1; i++)
    {
        fprintf(fp,"\tAdder_Signed_20bits_%d : Adder_Signed_20bits\n\tport map(\t", i);
        
        fprintf(fp,"input_a => add_output_s%d,\n\t\t\t\t", i-1);
        fprintf(fp,"input_b => conv_s%d,\n\t\t\t\t", i);
        fprintf(fp,"output => add_output_s%d,\n\t\t\t\t", i);
        fprintf(fp,"overflow => add_overflow_s%d\n\t\t\t\t", i);
        fprintf(fp,");\n\n");
    }
}




void entitytop(FILE * fp, int SV_number)
{
    fprintf(fp,"entity TOP is \n\tport(\t");
    
    int i, j;
    
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
    fprintf(fp,"end TOP;");
}

void architecture(FILE * fp, int SV_number)
{
    int i;

    // Architecture Start
    fprintf(fp, "architecture Behavioral of TOP is\n\n");
    

    // component Kernel_rbf
    fprintf(fp, "component Kernel_rbf is\n");
    fprintf(fp, "\tPort (\t");

    fprintf(fp, "SV_dim0 : in std_logic_vector(27 downto 0);\n");
    for(i = 1; i <= 7; i++)
    {
        fprintf(fp, "\t\t\tSV_dim%d : in std_logic_vector(27 downto 0);\n", i);
    }
    
    for(i = 0; i <= 7; i++)
    {
        fprintf(fp, "\t\t\ttest_data_dim%d : in std_logic_vector(27 downto 0);\n", i);
    }
    
    fprintf(fp, "\t\t\tgamma : in std_logic_vector(11 downto 0);\n");
    fprintf(fp, "\t\t\toutput : out std_logic_vector(10 downto 0)\n");
    fprintf(fp, "\t\t\t);\n");
    fprintf(fp, "end component;\n\n");


    // component Multiplier_Signed_12bits
    fprintf(fp, "component Multiplier_Signed_12bits is\n");
    fprintf(fp, "\tPort (\tinput_a : in std_logic_vector(11 downto 0);\n");
    fprintf(fp, "\t\t\tinput_b : in std_logic_vector(11 downto 0);\n");
    fprintf(fp, "\t\t\toutput : out std_logic_vector(12 downto 0)\n");
    fprintf(fp, "\t\t\t);\n");
    fprintf(fp, "end component;\n\n");


    // component Adder_Signed_20bits
    fprintf(fp, "component Adder_Signed_20bits is\n");
    fprintf(fp, "\tPort (\tinput_a : in std_logic_vector(19 downto 0);\n");
    fprintf(fp, "\t\t\tinput_b : in std_logic_vector(19 downto 0);\n");
    fprintf(fp, "\t\t\toutput : out std_logic_vector(19 downto 0);\n");
    fprintf(fp, "\t\t\toverflow : out std_logic\n");
    fprintf(fp, "\t\t\t);\n");
    fprintf(fp, "end component;\n\n");


    // component Convertor_Signed_13to20bits
    fprintf(fp, "component Convertor_Signed_13to20bits is\n");
    fprintf(fp, "\tPort (\tinput : in std_logic_vector(12 downto 0);\n");
    fprintf(fp, "\t\t\toutput : out std_logic_vector(19 downto 0)\n");
    fprintf(fp, "\t\t\t);\n");
    fprintf(fp, "end component;\n\n");
    
    // kernal_rbf output signals => Multiplier input value 
    Kernel_rbf_signal(fp, SV_number);

    // Multiplier output signals => convertor input value
    multiplier_signal(fp, SV_number);

    // convertor output signals => Adder input value
    convertor_signal(fp, SV_number);

    // Adder output signals             (last value)=> Compare Value
    adder_signal(fp, SV_number);

    fprintf(fp, "begin\n\n");

    // Connect signals to Kernel_rbf modules
    connection_Kernel_rbf(fp, SV_number);

    // Connect signals to multiplier modules
    connection_multiplier(fp, SV_number);

    // Connect signals to Convertor modules
    connection_convertor(fp, SV_number);

    // Connect signals to Adder modules
    connection_adder(fp, SV_number);

    // link the inverse of the MSB of the last output of the adder to output
    fprintf(fp, "\toutput <= not(add_output_s%d(19));\n\n", SV_number-1);


    fprintf(fp, "end Behavioral;\n");
}   
            
        

int main(void)
{    
    int SV_NUM;
    printf("This script simplifies the process of coding the TOP.vhd file.\n");
    printf("Please enter the number of support vectors: ");
    scanf("%d", &SV_NUM);
    

    FILE *fp;                           // File pointer
    fp = fopen("TOP.txt", "w");       // Open the file
    if(fp == NULL)                      // Check open error
    {
        printf("Error!");
        exit(1);
    }

    entitytop(fp, SV_NUM);
    architecture(fp, SV_NUM);
    fclose(fp);
    return 0;
}


/*
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
        
        fprintf(fp,"input_a => multi_20bits_s%d,\n\t\t\t\t", 2*i);
        fprintf(fp,"input_b => multi_20bits_s%d,\n\t\t\t\t", 2*i+1);
        fprintf(fp,"output => add_output_s0%d,\n\t\t\t\t", i);
        fprintf(fp,"overflow => add_overflow_s0%d\n\t\t\t\t", i);
        fprintf(fp,");\n");
    }
    fprintf(fp,"\n\tAdder_Signed_20bits_035 : Adder_Signed_20bits\n\tport map(\t");
        
    fprintf(fp,"input_a => multi_20bits_s70,\n\t\t\t\t");
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

*/

    //Kernel_rbf_signal(fp);
    //adder_signal(fp);
    //multiplier_signal(fp);
    
    //connection_Kernel_rbf(fp);
    //connection_multiplier(fp);
    //connection_convertor(fp);
    //connection_adder_0(fp);
    //connection_adder_1(fp);
    //connection_adder_2(fp);
    //connection_adder_3plus(fp);





