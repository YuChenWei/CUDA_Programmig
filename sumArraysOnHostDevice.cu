#include <stdio.h>
#include <string.h>
#include <time.h>
void sumArrayOnHost(float* A,float* B,float* C,const int nElem)
{
	for(int idx=0;idx<nElem;idx++)
	{
		C[idx]=A[idx]+B[idx];
	}
}
void initialData(float* ip,const int nElem)
{
	time_t t;
	srand((unsigned int)time(&t));
	for(int idx=0;idx<nElem;idx++)
	{
		ip[idx]=(float)(rand()&0xff)/10.0f;
	}
}
void printData(float* A,float* B,float* C,const int nElem)
{
	for(int idx=0;idx<nElem;idx++)
	{
		printf("%f %f %f\n",A[idx],B[idx],C[idx]);
	}
}

int main(int argc,char** argv)
{
	int nElem =1024;
	size_t nBytes=nElem*sizeof(float);
	float* h_A, *h_B, *h_C;
	h_A=(float *)malloc(nBytes);
	h_B=(float *)malloc(nBytes);
	h_C=(float *)malloc(nBytes);
	

	initialData(h_A,nElem);
	initialData(h_B,nElem);
	
	
	sumArrayOnHost(h_A,h_B,h_C,nElem);
	printData(h_A,h_B,h_C,nElem);
	
	free(h_A);
	free(h_B);
	free(h_C);
	return 0;
}
