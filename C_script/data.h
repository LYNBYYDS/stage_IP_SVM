#include <stdio.h>
#include <stdlib.h>

void inport_value(double * SV, double * result_alphaY, double * X_test, double * gamma, double * b)
{
    // Result of the python training model 
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

        result_alphaY[0]=-0.650390625;
        result_alphaY[1]=-0.650390625;
        result_alphaY[2]=1;

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
        
        *gamma = 1.3888888888888888;
        *b = -0.650390625;
}