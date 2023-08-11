#include <stdio.h>
#include <math.h>


int main(void)
{
  int i; // For iteration
  double j = 0.0;
  int tab[1001]; // the table that store all the last value belong to 
  int k = 0; // Table index
  
  for(i = 8000; i >= 7800 ; i--)
  {
    double a_exp = exp(-1.0*i/1024);
    if (a_exp >= (j +0.0005))// Then means that the value passed 0.5*0.001 so the result is j+0.001
    {
      tab[k] = i+1;
      k++;
      j+=0.001;
    }
  }

  
  while(1);
  return 0;

}
