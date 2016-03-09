/*!
 * \file ode45.cpp
 * \date 2015/12/25 9:18
 *
 * \author jianwenxu
 * Contact: 919858271@qq.com
 *
 * \brief
 *
 * TODO: 
 *
 * \note
 */
#include "ode45.h"

void ode45(int iterTimes,int dimension,double *initValue,double tPace,double **result){
	
	double t;
	
	double *x=new double[dimension];
	
	double *K1=new double[dimension];
	double *K2=new double[dimension];
	double *K3=new double[dimension];
	double *K4=new double[dimension];
	
	for(int i=0;i<dimension;i++){
		result[0][i]=initValue[i];
	}

	for(int i=0;i<iterTimes-1;i++){
		
		t=(i+1)*tPace;
		for(int j=0;j<dimension;j++){
			x[j]=result[i][j];
		}
		fun(x,K1,t);
		
		t=(i+1)*tPace+0.5*tPace;
		for(int j=0;j<dimension;j++){
			x[j]=result[i][j]+(double)(tPace*K1[j])/2;
		}
		fun(x,K2,t);
		
		for(int j=0;j<dimension;j++){
			x[j]=result[i][j]+(double)(tPace*K2[j])/2;
		}
		fun(x,K3,t);
		
		t=(i+1)*tPace+tPace;
		for(int j=0;j<dimension;j++){
			x[j]=result[i][j]+tPace*K3[j];
		}
		fun(x,K4,t);
		
		for(int j=0;j<dimension;j++){
			double sum=0.0;
			sum=K1[j]+2*(K2[j]+K3[j])+K4[j];
			result[i+1][j]=result[i][j]+(double(tPace/6))*sum;
		}
	}

	delete[] K1,K2,K3,K4,x;
	K1=0,K2=0,K3=0,K4=0,x=0;

}
