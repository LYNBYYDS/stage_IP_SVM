#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void component_top(FILE * fp)
{
    fprintf(fp, "component TOP is \n\tport (\t");
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
    fprintf(fp,"end component;\n");

}

void connect_top(FILE * fp)
{
    fprintf(fp, "\tTOP_0 : TOP\n\t\tport map(\t");
    int i, j;
    // 71 SV vector 8 dim (28 bits)
    for (i = 0; i <= 70 ; i++)
    {
        for(j = 0; j <= 7; j++)
        {
            fprintf(fp,"\t\t\t\t\tSV%d_dim%d => SV%d_dim%d,\n", i, j, i, j);
        }
    }

    // Test Data 8 dim (28 bits)
    for(j = 0; j <= 7; j++)
    {
        fprintf(fp,"\t\t\t\t\ttest_data_dim%d => test_data_dim%d, \n", j, j);
    }
    
    // index of SV alpha * Y (12 bits)
    for (i = 0; i <= 70 ; i++)
    {
        fprintf(fp,"\t\t\t\t\tSV%d_alphaY => SV%d_alphaY, \n", i, i);
    }
    
    // gamma (12 bits)
    fprintf(fp,"\t\t\t\t\tgamma => gamma, \n");
    
    // b constant 
    fprintf(fp,"\t\t\t\t\tb => b, \n");

    // output
    fprintf(fp,"\t\t\t\t\toutput => output \n");


    fprintf(fp,"\t\t\t\t\t);\n");

}

/*---------------------------------------------------------------------------------------------------------------------*/
/*                                            void print_dec2bin_28bits(double a)                                      */ 
/*---------------------------------------------------------------------------------------------------------------------*/
// The function dec2bin_11bits is to convert a decimal number to binary number
// The decimal number is without sign
// The binary number is 11 bit 1bits for integer part and 10 bits for the fractional part
void print_dec2bin_28bits(double a, FILE * fp)
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
    
    // Pass the value 28 times to convert it to a 28 bit binary number
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



int main(void)
{      
    // Result of the python training model 
        double SV[568];
        SV[0]=25683.43;
        SV[1]=31.27;
        SV[2]=821.33;
        SV[3]=584.77;
        SV[4]=202.78;
        SV[5]=-0.67;
        SV[6]=1.45;
        SV[7]=41.06;
        SV[8]=26731.1;
        SV[9]=50.29;
        SV[10]=531.56;
        SV[11]=513.3;
        SV[12]=1990.43;
        SV[13]=-1.06;
        SV[14]=2.11;
        SV[15]=11.51;
        SV[16]=34780.09;
        SV[17]=30.6;
        SV[18]=1136.67;
        SV[19]=578.46;
        SV[20]=184.47;
        SV[21]=-0.95;
        SV[22]=1.9;
        SV[23]=42.59;
        SV[24]=44635.45;
        SV[25]=50.72;
        SV[26]=880.0;
        SV[27]=533.27;
        SV[28]=1992.64;
        SV[29]=-1.06;
        SV[30]=2.11;
        SV[31]=11.95;
        SV[32]=20806.86;
        SV[33]=30.6;
        SV[34]=680.0;
        SV[35]=590.49;
        SV[36]=196.43;
        SV[37]=-0.78;
        SV[38]=1.61;
        SV[39]=42.13;
        SV[40]=26328.79;
        SV[41]=50.29;
        SV[42]=523.56;
        SV[43]=532.3;
        SV[44]=1990.43;
        SV[45]=-1.06;
        SV[46]=2.11;
        SV[47]=11.93;
        SV[48]=45228.5;
        SV[49]=40.38;
        SV[50]=1120.0;
        SV[51]=578.23;
        SV[52]=1156.32;
        SV[53]=0.74;
        SV[54]=1.67;
        SV[55]=17.0;
        SV[56]=43477.29;
        SV[57]=31.51;
        SV[58]=1380.0;
        SV[59]=460.22;
        SV[60]=697.59;
        SV[61]=1.29;
        SV[62]=2.67;
        SV[63]=17.42;
        SV[64]=21705.1;
        SV[65]=40.8;
        SV[66]=532.0;
        SV[67]=453.35;
        SV[68]=362.16;
        SV[69]=0.71;
        SV[70]=1.5;
        SV[71]=23.82;
        SV[72]=3811.99;
        SV[73]=15.18;
        SV[74]=251.18;
        SV[75]=441.04;
        SV[76]=0.08;
        SV[77]=-0.05;
        SV[78]=1.89;
        SV[79]=1540.03;
        SV[80]=20066.67;
        SV[81]=50.0;
        SV[82]=401.33;
        SV[83]=525.71;
        SV[84]=428.57;
        SV[85]=1.39;
        SV[86]=2.94;
        SV[87]=25.39;
        SV[88]=20437.25;
        SV[89]=31.03;
        SV[90]=658.67;
        SV[91]=596.52;
        SV[92]=195.06;
        SV[93]=-0.79;
        SV[94]=1.63;
        SV[95]=42.71;
        SV[96]=23800.0;
        SV[97]=50.0;
        SV[98]=476.0;
        SV[99]=569.07;
        SV[100]=465.82;
        SV[101]=1.21;
        SV[102]=2.46;
        SV[103]=26.37;
        SV[104]=27759.22;
        SV[105]=50.29;
        SV[106]=552.0;
        SV[107]=484.3;
        SV[108]=1990.43;
        SV[109]=-1.06;
        SV[110]=2.11;
        SV[111]=10.86;
        SV[112]=34339.27;
        SV[113]=15.73;
        SV[114]=2183.43;
        SV[115]=476.81;
        SV[116]=22.84;
        SV[117]=-0.02;
        SV[118]=1.55;
        SV[119]=99.76;
        SV[120]=18293.33;
        SV[121]=30.0;
        SV[122]=609.78;
        SV[123]=525.52;
        SV[124]=670.78;
        SV[125]=-1.21;
        SV[126]=2.46;
        SV[127]=20.29;
        SV[128]=15080.84;
        SV[129]=30.74;
        SV[130]=490.67;
        SV[131]=555.03;
        SV[132]=163.3;
        SV[133]=1.25;
        SV[134]=2.57;
        SV[135]=43.43;
        SV[136]=46000.0;
        SV[137]=50.0;
        SV[138]=920.0;
        SV[139]=552.07;
        SV[140]=465.82;
        SV[141]=1.21;
        SV[142]=2.46;
        SV[143]=25.58;
        SV[144]=13646.52;
        SV[145]=30.74;
        SV[146]=444.0;
        SV[147]=589.03;
        SV[148]=163.3;
        SV[149]=1.25;
        SV[150]=2.57;
        SV[151]=46.09;
        SV[152]=43400.0;
        SV[153]=50.0;
        SV[154]=868.0;
        SV[155]=525.07;
        SV[156]=465.82;
        SV[157]=1.21;
        SV[158]=2.46;
        SV[159]=24.33;
        SV[160]=23200.0;
        SV[161]=20.0;
        SV[162]=1160.0;
        SV[163]=582.26;
        SV[164]=14.95;
        SV[165]=1.25;
        SV[166]=4.21;
        SV[167]=150.6;
        SV[168]=24480.0;
        SV[169]=30.0;
        SV[170]=816.0;
        SV[171]=543.52;
        SV[172]=670.78;
        SV[173]=-1.21;
        SV[174]=2.46;
        SV[175]=20.99;
        SV[176]=30000.0;
        SV[177]=50.0;
        SV[178]=600.0;
        SV[179]=565.71;
        SV[180]=428.57;
        SV[181]=1.39;
        SV[182]=2.94;
        SV[183]=27.33;
        SV[184]=18333.33;
        SV[185]=20.0;
        SV[186]=916.67;
        SV[187]=584.27;
        SV[188]=19.81;
        SV[189]=0.22;
        SV[190]=2.87;
        SV[191]=131.26;
        SV[192]=2875.89;
        SV[193]=15.42;
        SV[194]=186.47;
        SV[195]=455.02;
        SV[196]=0.09;
        SV[197]=0.11;
        SV[198]=3.09;
        SV[199]=1486.83;
        SV[200]=2936.5;
        SV[201]=15.71;
        SV[202]=186.93;
        SV[203]=477.08;
        SV[204]=0.07;
        SV[205]=-0.12;
        SV[206]=2.56;
        SV[207]=1781.42;
        SV[208]=21166.63;
        SV[209]=40.38;
        SV[210]=522.67;
        SV[211]=540.23;
        SV[212]=1156.32;
        SV[213]=0.74;
        SV[214]=1.67;
        SV[215]=15.89;
        SV[216]=16971.87;
        SV[217]=30.6;
        SV[218]=554.67;
        SV[219]=591.46;
        SV[220]=184.47;
        SV[221]=-0.95;
        SV[222]=1.9;
        SV[223]=43.55;
        SV[224]=1749.15;
        SV[225]=15.96;
        SV[226]=109.6;
        SV[227]=491.12;
        SV[228]=0.05;
        SV[229]=0.38;
        SV[230]=3.09;
        SV[231]=2134.25;
        SV[232]=1449.34;
        SV[233]=15.68;
        SV[234]=92.46;
        SV[235]=466.05;
        SV[236]=0.03;
        SV[237]=-0.06;
        SV[238]=2.3;
        SV[239]=2773.93;
        SV[240]=27100.62;
        SV[241]=34.22;
        SV[242]=792.0;
        SV[243]=491.0;
        SV[244]=175.92;
        SV[245]=1.28;
        SV[246]=2.67;
        SV[247]=37.02;
        SV[248]=20541.67;
        SV[249]=30.6;
        SV[250]=671.33;
        SV[251]=576.49;
        SV[252]=196.43;
        SV[253]=-0.78;
        SV[254]=1.61;
        SV[255]=41.13;
        SV[256]=42326.32;
        SV[257]=31.49;
        SV[258]=1344.0;
        SV[259]=478.15;
        SV[260]=173.15;
        SV[261]=1.29;
        SV[262]=2.67;
        SV[263]=36.34;
        SV[264]=29826.68;
        SV[265]=20.49;
        SV[266]=1456.0;
        SV[267]=584.26;
        SV[268]=20.01;
        SV[269]=0.2;
        SV[270]=2.92;
        SV[271]=130.61;
        SV[272]=16217.11;
        SV[273]=30.6;
        SV[274]=530.0;
        SV[275]=602.46;
        SV[276]=184.47;
        SV[277]=-0.95;
        SV[278]=1.9;
        SV[279]=44.36;
        SV[280]=20965.14;
        SV[281]=50.72;
        SV[282]=413.33;
        SV[283]=513.27;
        SV[284]=1992.64;
        SV[285]=-1.06;
        SV[286]=2.11;
        SV[287]=11.5;
        SV[288]=32462.15;
        SV[289]=50.72;
        SV[290]=640.0;
        SV[291]=483.27;
        SV[292]=1992.64;
        SV[293]=-1.06;
        SV[294]=2.11;
        SV[295]=10.83;
        SV[296]=22434.81;
        SV[297]=50.99;
        SV[298]=440.0;
        SV[299]=513.24;
        SV[300]=1986.32;
        SV[301]=-1.06;
        SV[302]=2.11;
        SV[303]=11.52;
        SV[304]=16711.11;
        SV[305]=50.0;
        SV[306]=334.22;
        SV[307]=550.71;
        SV[308]=428.57;
        SV[309]=1.39;
        SV[310]=2.94;
        SV[311]=26.6;
        SV[312]=2538.25;
        SV[313]=15.02;
        SV[314]=168.97;
        SV[315]=493.09;
        SV[316]=0.06;
        SV[317]=-0.19;
        SV[318]=2.16;
        SV[319]=2032.22;
        SV[320]=36586.67;
        SV[321]=40.0;
        SV[322]=914.67;
        SV[323]=556.74;
        SV[324]=1071.63;
        SV[325]=1.43;
        SV[326]=3.04;
        SV[327]=17.01;
        SV[328]=27579.16;
        SV[329]=15.15;
        SV[330]=1820.51;
        SV[331]=464.67;
        SV[332]=23.63;
        SV[333]=0.02;
        SV[334]=1.5;
        SV[335]=95.59;
        SV[336]=20444.44;
        SV[337]=40.0;
        SV[338]=511.11;
        SV[339]=533.74;
        SV[340]=1071.63;
        SV[341]=1.43;
        SV[342]=3.04;
        SV[343]=16.3;
        SV[344]=25210.46;
        SV[345]=50.75;
        SV[346]=496.74;
        SV[347]=499.15;
        SV[348]=104.97;
        SV[349]=0.11;
        SV[350]=2.79;
        SV[351]=48.72;
        SV[352]=27500.0;
        SV[353]=56.77;
        SV[354]=484.44;
        SV[355]=472.86;
        SV[356]=328.42;
        SV[357]=0.45;
        SV[358]=1.91;
        SV[359]=26.09;
        SV[360]=27550.0;
        SV[361]=57.52;
        SV[362]=478.97;
        SV[363]=444.92;
        SV[364]=70.86;
        SV[365]=-0.15;
        SV[366]=2.15;
        SV[367]=52.85;
        SV[368]=27267.78;
        SV[369]=60.06;
        SV[370]=454.03;
        SV[371]=452.86;
        SV[372]=328.42;
        SV[373]=0.45;
        SV[374]=1.91;
        SV[375]=24.99;
        SV[376]=47360.0;
        SV[377]=59.09;
        SV[378]=801.51;
        SV[379]=509.58;
        SV[380]=97.46;
        SV[381]=0.4;
        SV[382]=2.42;
        SV[383]=51.62;
        SV[384]=22364.44;
        SV[385]=60.34;
        SV[386]=370.64;
        SV[387]=547.58;
        SV[388]=97.46;
        SV[389]=0.4;
        SV[390]=2.42;
        SV[391]=55.47;
        SV[392]=30600.0;
        SV[393]=57.95;
        SV[394]=528.03;
        SV[395]=536.15;
        SV[396]=96.19;
        SV[397]=0.39;
        SV[398]=2.32;
        SV[399]=54.67;
        SV[400]=36153.33;
        SV[401]=63.54;
        SV[402]=569.01;
        SV[403]=478.48;
        SV[404]=68.62;
        SV[405]=-0.21;
        SV[406]=2.15;
        SV[407]=57.76;
        SV[408]=36480.0;
        SV[409]=63.47;
        SV[410]=574.77;
        SV[411]=500.15;
        SV[412]=96.19;
        SV[413]=0.39;
        SV[414]=2.32;
        SV[415]=51.0;
        SV[416]=49967.64;
        SV[417]=50.1;
        SV[418]=997.32;
        SV[419]=568.91;
        SV[420]=108.4;
        SV[421]=0.43;
        SV[422]=2.49;
        SV[423]=54.64;
        SV[424]=31920.0;
        SV[425]=57.31;
        SV[426]=556.93;
        SV[427]=498.26;
        SV[428]=97.27;
        SV[429]=0.27;
        SV[430]=2.32;
        SV[431]=50.52;
        SV[432]=39388.54;
        SV[433]=44.73;
        SV[434]=880.54;
        SV[435]=479.99;
        SV[436]=97.46;
        SV[437]=0.44;
        SV[438]=2.37;
        SV[439]=48.62;
        SV[440]=48720.0;
        SV[441]=62.57;
        SV[442]=778.6;
        SV[443]=478.92;
        SV[444]=70.86;
        SV[445]=-0.15;
        SV[446]=2.15;
        SV[447]=56.89;
        SV[448]=27216.0;
        SV[449]=57.56;
        SV[450]=472.83;
        SV[451]=511.26;
        SV[452]=97.27;
        SV[453]=0.27;
        SV[454]=2.32;
        SV[455]=51.84;
        SV[456]=45584.0;
        SV[457]=60.77;
        SV[458]=750.06;
        SV[459]=537.93;
        SV[460]=101.81;
        SV[461]=0.43;
        SV[462]=2.31;
        SV[463]=53.31;
        SV[464]=20890.01;
        SV[465]=45.38;
        SV[466]=460.32;
        SV[467]=425.4;
        SV[468]=77.27;
        SV[469]=-0.1;
        SV[470]=2.11;
        SV[471]=48.4;
        SV[472]=19671.41;
        SV[473]=45.92;
        SV[474]=428.39;
        SV[475]=438.43;
        SV[476]=104.95;
        SV[477]=-0.01;
        SV[478]=2.25;
        SV[479]=42.8;
        SV[480]=29370.0;
        SV[481]=61.42;
        SV[482]=478.15;
        SV[483]=492.86;
        SV[484]=328.42;
        SV[485]=0.45;
        SV[486]=1.91;
        SV[487]=27.2;
        SV[488]=35618.67;
        SV[489]=55.5;
        SV[490]=641.83;
        SV[491]=548.93;
        SV[492]=101.81;
        SV[493]=0.43;
        SV[494]=2.31;
        SV[495]=54.4;
        SV[496]=16830.89;
        SV[497]=57.53;
        SV[498]=292.58;
        SV[499]=489.23;
        SV[500]=97.96;
        SV[501]=0.26;
        SV[502]=2.24;
        SV[503]=49.43;
        SV[504]=19242.12;
        SV[505]=52.92;
        SV[506]=363.61;
        SV[507]=526.3;
        SV[508]=66.79;
        SV[509]=-0.16;
        SV[510]=2.18;
        SV[511]=64.4;
        SV[512]=22101.33;
        SV[513]=64.13;
        SV[514]=344.62;
        SV[515]=526.93;
        SV[516]=101.81;
        SV[517]=0.43;
        SV[518]=2.31;
        SV[519]=52.22;
        SV[520]=22568.0;
        SV[521]=56.49;
        SV[522]=399.48;
        SV[523]=448.81;
        SV[524]=99.56;
        SV[525]=0.0;
        SV[526]=2.35;
        SV[527]=44.98;
        SV[528]=18702.67;
        SV[529]=61.79;
        SV[530]=302.67;
        SV[531]=478.81;
        SV[532]=99.56;
        SV[533]=0.0;
        SV[534]=2.35;
        SV[535]=47.99;
        SV[536]=43222.17;
        SV[537]=50.77;
        SV[538]=851.42;
        SV[539]=531.18;
        SV[540]=101.6;
        SV[541]=0.25;
        SV[542]=2.29;
        SV[543]=52.7;
        SV[544]=37901.49;
        SV[545]=47.73;
        SV[546]=794.05;
        SV[547]=521.28;
        SV[548]=94.77;
        SV[549]=0.23;
        SV[550]=2.21;
        SV[551]=53.55;
        SV[552]=39516.0;
        SV[553]=61.69;
        SV[554]=640.54;
        SV[555]=477.23;
        SV[556]=97.96;
        SV[557]=0.26;
        SV[558]=2.24;
        SV[559]=48.22;
        SV[560]=25365.33;
        SV[561]=57.46;
        SV[562]=441.42;
        SV[563]=506.48;
        SV[564]=68.62;
        SV[565]=-0.21;
        SV[566]=2.15;
        SV[567]=61.14;


        double result_alphaY[71];
        result_alphaY[0]=-0.650390625;
        result_alphaY[1]=-0.650390625;
        result_alphaY[2]=-0.650390625;
        result_alphaY[3]=-0.650390625;
        result_alphaY[4]=-0.650390625;
        result_alphaY[5]=-0.650390625;
        result_alphaY[6]=-0.650390625;
        result_alphaY[7]=-0.6513671875;
        result_alphaY[8]=-0.6513671875;
        result_alphaY[9]=-0.6513671875;
        result_alphaY[10]=-0.6513671875;
        result_alphaY[11]=-0.6513671875;
        result_alphaY[12]=-0.6513671875;
        result_alphaY[13]=-0.6513671875;
        result_alphaY[14]=-0.6513671875;
        result_alphaY[15]=-0.6513671875;
        result_alphaY[16]=-0.6513671875;
        result_alphaY[17]=-0.6513671875;
        result_alphaY[18]=-0.6513671875;
        result_alphaY[19]=-0.6513671875;
        result_alphaY[20]=-0.6513671875;
        result_alphaY[21]=-0.6513671875;
        result_alphaY[22]=-0.650390625;
        result_alphaY[23]=-0.650390625;
        result_alphaY[24]=-0.6513671875;
        result_alphaY[25]=-0.6513671875;
        result_alphaY[26]=-0.6513671875;
        result_alphaY[27]=-0.6513671875;
        result_alphaY[28]=-0.6513671875;
        result_alphaY[29]=-0.6513671875;
        result_alphaY[30]=-0.6513671875;
        result_alphaY[31]=-0.6513671875;
        result_alphaY[32]=-0.6513671875;
        result_alphaY[33]=-0.6513671875;
        result_alphaY[34]=-0.6513671875;
        result_alphaY[35]=-0.6513671875;
        result_alphaY[36]=-0.6513671875;
        result_alphaY[37]=-0.6513671875;
        result_alphaY[38]=-0.6513671875;
        result_alphaY[39]=-0.6513671875;
        result_alphaY[40]=-0.6513671875;
        result_alphaY[41]=-0.6513671875;
        result_alphaY[42]=-0.6513671875;
        result_alphaY[43]=1.0;
        result_alphaY[44]=1.0;
        result_alphaY[45]=1.0;
        result_alphaY[46]=1.0;
        result_alphaY[47]=1.0;
        result_alphaY[48]=1.0;
        result_alphaY[49]=1.0;
        result_alphaY[50]=1.0;
        result_alphaY[51]=1.0;
        result_alphaY[52]=1.0;
        result_alphaY[53]=1.0;
        result_alphaY[54]=1.0;
        result_alphaY[55]=1.0;
        result_alphaY[56]=1.0;
        result_alphaY[57]=1.0;
        result_alphaY[58]=1.0;
        result_alphaY[59]=1.0;
        result_alphaY[60]=1.0;
        result_alphaY[61]=1.0;
        result_alphaY[62]=1.0;
        result_alphaY[63]=1.0;
        result_alphaY[64]=1.0;
        result_alphaY[65]=1.0;
        result_alphaY[66]=1.0;
        result_alphaY[67]=1.0;
        result_alphaY[68]=1.0;
        result_alphaY[69]=1.0;
        result_alphaY[70]=1.0;

        double X_test[144];
        X_test[0]=28127.86;
        X_test[1]=18.34;
        X_test[2]=1534.0;
        X_test[3]=469.42;
        X_test[4]=30.16;
        X_test[5]=-0.14;
        X_test[6]=1.99;
        X_test[7]=85.48;
        X_test[8]=41990.0;
        X_test[9]=61.48;
        X_test[10]=682.94;
        X_test[11]=490.03;
        X_test[12]=100.24;
        X_test[13]=0.1;
        X_test[14]=2.31;
        X_test[15]=48.94;
        X_test[16]=14320.02;
        X_test[17]=30.6;
        X_test[18]=468.0;
        X_test[19]=602.49;
        X_test[20]=196.43;
        X_test[21]=-0.78;
        X_test[22]=1.61;
        X_test[23]=42.99;
        X_test[24]=21670.42;
        X_test[25]=50.4;
        X_test[26]=430.0;
        X_test[27]=498.65;
        X_test[28]=606.88;
        X_test[29]=0.44;
        X_test[30]=1.19;
        X_test[31]=20.24;
        X_test[32]=40404.0;
        X_test[33]=64.84;
        X_test[34]=623.11;
        X_test[35]=501.26;
        X_test[36]=97.96;
        X_test[37]=0.26;
        X_test[38]=2.24;
        X_test[39]=50.64;
        X_test[40]=23922.87;
        X_test[41]=50.97;
        X_test[42]=469.33;
        X_test[43]=519.67;
        X_test[44]=605.21;
        X_test[45]=0.44;
        X_test[46]=1.19;
        X_test[47]=21.12;
        X_test[48]=22871.33;
        X_test[49]=60.51;
        X_test[50]=377.97;
        X_test[51]=458.03;
        X_test[52]=100.24;
        X_test[53]=0.1;
        X_test[54]=2.31;
        X_test[55]=45.75;
        X_test[56]=47520.0;
        X_test[57]=30.0;
        X_test[58]=1584.0;
        X_test[59]=497.52;
        X_test[60]=670.78;
        X_test[61]=-1.21;
        X_test[62]=2.46;
        X_test[63]=19.21;
        X_test[64]=33563.07;
        X_test[65]=30.74;
        X_test[66]=1092.0;
        X_test[67]=577.03;
        X_test[68]=163.3;
        X_test[69]=1.25;
        X_test[70]=2.57;
        X_test[71]=45.15;
        X_test[72]=26706.35;
        X_test[73]=40.38;
        X_test[74]=661.33;
        X_test[75]=564.23;
        X_test[76]=1156.32;
        X_test[77]=0.74;
        X_test[78]=1.67;
        X_test[79]=16.59;
        X_test[80]=30826.67;
        X_test[81]=40.0;
        X_test[82]=770.67;
        X_test[83]=569.74;
        X_test[84]=1071.63;
        X_test[85]=1.43;
        X_test[86]=3.04;
        X_test[87]=17.4;
        X_test[88]=21296.43;
        X_test[89]=30.6;
        X_test[90]=696.0;
        X_test[91]=590.52;
        X_test[92]=195.29;
        X_test[93]=-0.79;
        X_test[94]=1.62;
        X_test[95]=42.26;
        X_test[96]=19244.73;
        X_test[97]=34.37;
        X_test[98]=560.0;
        X_test[99]=471.0;
        X_test[100]=176.02;
        X_test[101]=1.28;
        X_test[102]=2.67;
        X_test[103]=35.5;
        X_test[104]=16206.4;
        X_test[105]=19.02;
        X_test[106]=852.0;
        X_test[107]=445.36;
        X_test[108]=30.92;
        X_test[109]=-0.14;
        X_test[110]=2.02;
        X_test[111]=80.09;
        X_test[112]=2190.38;
        X_test[113]=15.0;
        X_test[114]=145.99;
        X_test[115]=414.95;
        X_test[116]=0.09;
        X_test[117]=0.02;
        X_test[118]=2.7;
        X_test[119]=1363.0;
        X_test[120]=45046.51;
        X_test[121]=40.95;
        X_test[122]=1100.0;
        X_test[123]=525.08;
        X_test[124]=381.93;
        X_test[125]=0.5;
        X_test[126]=1.25;
        X_test[127]=26.87;
        X_test[128]=15914.42;
        X_test[129]=18.48;
        X_test[130]=861.33;
        X_test[131]=457.37;
        X_test[132]=30.67;
        X_test[133]=-0.14;
        X_test[134]=2.0;
        X_test[135]=82.59;
        X_test[136]=42840.0;
        X_test[137]=59.5;
        X_test[138]=720.02;
        X_test[139]=485.26;
        X_test[140]=97.27;
        X_test[141]=0.27;
        X_test[142]=2.32;
        X_test[143]=49.2;
    FILE *fp;                           // File pointer
    fp = fopen("TOPtbHELPER.txt", "w");       // Open the file
    if(fp == NULL)                      // Check open error
    {
        printf("Error!");
        exit(1);
    }
    int i, j;

    //component_top(fp);

    //print_dec2bin_28bits(-5, fp);         // Debug used

    /*  // declaire the signals
    for (i = 0; i <= 70; i++)
    {
        for (j = 0; j <= 7; j++)
        {
            fprintf(fp, "signal SV%d_dim%d : std_logic_vector(27 downto 0) := \"", i, j);
            print_dec2bin_28bits(SV[i*8+j], fp);
            fprintf(fp, "\";\n", i, j);
        }
        
    }
    
    for (i = 0; i <= 70; i++)
    {
        fprintf(fp, "signal SV%d_alphaY : std_logic_vector(11 downto 0) := \"", i);
        print_dec2bin_12bits(result_alphaY[i], fp);
        fprintf(fp, "\";\n", i, j);        
    }
    */
    

    //connect_top(fp);

    for (i = 0; i <= 7; i++)
    {
        fprintf(fp, "\ttest_data_dim%d <= \"", i);
        for (j = 0; j <= 17; j++)
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

    

    fclose(fp);
    return 0;
}