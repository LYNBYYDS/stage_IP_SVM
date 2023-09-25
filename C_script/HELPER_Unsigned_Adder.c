#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define BIT_WIDTH 2

int main(void)
{   
    /*
    int bit_width;
    printf("Enter the bits of the Adder: ");
    scanf("%d", &bit_width);
    */

    FILE *fp;                               // File pointer
    fp = fopen("Adder_Unsigned.txt", "w");  // Open the file
    if(fp == NULL)                          // Check open error                
    {
        printf("Error!");
        exit(1);
    }

    entity(fp, BIT_WIDTH);
    architecture(fp, BIT_WIDTH);

    fclose(fp);
    return 0;
}

void entity(FILE * fp, int bit_width)
{
    if(bit_width > 1)
    {
        fprintf(fp,"entity Adder_Unsigned_%dbits is\n", bit_width);
    }else if (bit_width == 1)
    {
        fprintf(fp,"entity Adder_Unsigned_1bit is\n");
    }

    fprintf(fp,"\tPort (\tcarry_in : in std_logic;\n");
    if(bit_width > 1)
    {
        fprintf(fp,"\t\t\tinput_a : in std_logic_vector(%d downto 0);\n", bit_width-1);
        fprintf(fp,"\t\t\tinput_b : in std_logic_vector(%d downto 0);\n", bit_width-1);
        fprintf(fp,"\t\t\toutput : out std_logic_vector(%d downto 0);\n", bit_width-1);
    }else if (bit_width == 1)
    {
        fprintf(fp,"\t\t\tinput_a : in std_logic;\n");
        fprintf(fp,"\t\t\tinput_b : in std_logic;\n");
        fprintf(fp,"\t\t\toutput : out std_logic;\n");
    }

    fprintf(fp,"\t\t\tcarry_out : out std_logic\n");
    fprintf(fp,"\t\t\t);\n");
            
    if(bit_width > 1)
    {
        fprintf(fp,"end Adder_Unsigned_%dbits;\n\n", bit_width);
    }else if (bit_width == 1)
    {
        fprintf(fp,"end Adder_Unsigned_1bit;\n\n");
    }
}

void architecture(FILE * fp, int bit_width)
{
    if(bit_width > 1)
    {
        fprintf(fp,"architecture Behavioral of Adder_Unsigned_%dbits is\n\n", bit_width);
        
        int component_bit = 0;
        int bit_width_res = bit_width;
        int if_component = 0;
        int component_nb = 0;

        if (bit_width_res > 0)
        {
            if (bit_width_res%2)
            {
                if (component_bit == 0)
                {
                    fprintf(fp,"component Adder_Unsigned_1bit is\n");
                    fprintf(fp,"\tPort (\tcarry_in : in std_logic;\n");
                    fprintf(fp,"\t\t\tinput_a : in std_logic;\n");
                    fprintf(fp,"\t\t\tinput_b : in std_logic;\n");
                    fprintf(fp,"\t\t\toutput : out std_logic;\n");
                    fprintf(fp,"\t\t\tcarry_out : out std_logic\n");
                    fprintf(fp,"\t\t\t);\n");
                    fprintf(fp,"end component;\n\n");

                    // Signals connect to component
                    fprintf(fp,"signal output_s0 :std_logic;\n");
                    fprintf(fp,"signal carry_out_s0 : std_logic;\n");
                }else
                {
                    fprintf(fp,"component Adder_Unsigned_%dbits is\n", (int)pow(2, component_bit));
                    fprintf(fp,"\tPort (\tcarry_in : in std_logic;\n");
                    fprintf(fp,"\t\t\tinput_a : in std_logic_vector(%d downto 0);\n", (int)pow(2, component_bit)-1);
                    fprintf(fp,"\t\t\tinput_b : in std_logic_vector(%d downto 0);\n", (int)pow(2, component_bit)-1);
                    fprintf(fp,"\t\t\toutput : out std_logic_vector(%d downto 0);\n", (int)pow(2, component_bit)-1);
                    fprintf(fp,"\t\t\tcarry_out : out std_logic\n");
                    fprintf(fp,"\t\t\t);\n");
                    fprintf(fp,"end component;\n\n");

                    // Signals connect to component
                    fprintf(fp,"signal output_s%d :std_logic_vector(%d downto 0);\n", component_nb, (int)pow(2, component_bit)-1);
                    fprintf(fp,"signal carry_out_s%d : std_logic_vector(%d downto 0);\n", component_nb, (int)pow(2, component_bit)-1);
                }
                component_nb++;
            }
            bit_width_res = bit_width_res/2;
            component_bit++;

            
        }

        fprintf(fp,"begin\n\n");

        // Connection
        bit_width_res = bit_width;
        component_nb = 0;
        int startbit = 0;
        if (bit_width_res > 0 && bit_width != 1)
        {
            if (bit_width_res%2)
            {
                if (component_nb == 0)
                {
                    fprintf(fp,"component Adder_Unsigned_%dbits is\n", (int)pow(2, component_bit));
                    fprintf(fp,"\tPort (\tcarry_in => tcarry_out_s%d;\n", component_nb-1);
                    fprintf(fp,"\t\t\tinput_a => input_a(%d downto %d);\n", (int)pow(2, component_bit)+startbit-1, startbit);
                    fprintf(fp,"\t\t\tinput_b => input_b(%d downto %d);\n", (int)pow(2, component_bit)+startbit-1, startbit);
                    fprintf(fp,"\t\t\toutput => output_s(%d downto %d);\n", (int)pow(2, component_bit)+startbit-1, startbit);
                    fprintf(fp,"\t\t\tcarry_out_s%d => out std_logic\n", component_nb);
                    fprintf(fp,"\t\t\t);\n");
                    fprintf(fp,"end component;\n\n");
                }else
                {
                    fprintf(fp,"component Adder_Unsigned_%dbits is\n", (int)pow(2, component_bit));
                    fprintf(fp,"\tPort (\tcarry_in => tcarry_out_s%d;\n", component_nb-1);
                    fprintf(fp,"\t\t\tinput_a => input_a(%d downto %d);\n", (int)pow(2, component_bit)+startbit-1, startbit);
                    fprintf(fp,"\t\t\tinput_b => input_b(%d downto %d);\n", (int)pow(2, component_bit)+startbit-1, startbit);
                    fprintf(fp,"\t\t\toutput => output_s(%d downto %d);\n", (int)pow(2, component_bit)+startbit-1, startbit);
                    fprintf(fp,"\t\t\tcarry_out_s%d => out std_logic\n", component_nb);
                    fprintf(fp,"\t\t\t);\n");
                    fprintf(fp,"end component;\n\n");
                }
            }
            bit_width_res = bit_width_res/2;
            component_bit++;
        }
    }else if (bit_width == 1)
    {
        fprintf(fp,"architecture Behavioral of Adder_Unsigned_1bit is\n\n");
        fprintf(fp,"begin\n\n");
        fprintf(fp,"\toutput <= input_a XOR input_b XOR carry_in;\n");
        fprintf(fp,"\tcarry_out <= (input_a AND input_b) OR (carry_in AND input_a) OR (carry_in AND input_b);\n\n");
        fprintf(fp,"end Behavioral;\n");
    }
    
}
/*

        fprintf(fp,"component Adder_Unsigned_%dbits is\n\n", bit_width);

component Adder_Unsigned_1bit is 
    Port (  carry_in : in std_logic;
            input_a : in std_logic;
            input_b : in std_logic;
            output : out std_logic;
            carry_out : out std_logic
            );
end component;

signal output_s0 : std_logic;
signal output_s1 : std_logic;
signal carry_out_s0 : std_logic;
signal carry_out_s1 : std_logic;

begin
    
    Adder_Unsigned_1bit_0 : Adder_Unsigned_1bit
        port map (  carry_in => carry_in,
                    input_a => input_a(0),
                    input_b => input_b(0),
                    output => output_s0,
                    carry_out => carry_out_s0
                    );
    
    Adder_Unsigned_1bit_1 : Adder_Unsigned_1bit
        port map (  carry_in => carry_out_s0,
                    input_a => input_a(1),
                    input_b => input_b(1),
                    output => output_s1,
                    carry_out => carry_out_s1
                    );       
                               
    output <=  output_s1 & output_s0;
    carry_out <= carry_out_s1;
    
end Behavioral;

*/