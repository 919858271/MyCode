#include "ode.class.h"
vector< vector<double> > ode45(vector<double> tspan,vector<double> x){
	double t;
	int n=x.size();
	vector< vector<double> > y;
	y.push_back(x);
	vector<double> temp(n);
	vector<double> k1(n);vector<double> k2(n);
	vector<double> k3(n);vector<double> k4(n);
	int nit=int((tspan[2]-tspan[0])/tspan[1]);
	for(int k=0;k<nit;k++){

		t=(k+1)*tspan[1];
		for (int i=0;i<n;i++){
			temp[i]=x[i];
		}
		k1=fun(temp,t);

		t=t+0.5*tspan[1];
		for(int i=0;i<n;i++){
			temp[i]=x[i]+tspan[1]*k1[i]/2.0;
		}
		k2=fun(temp,t);
		for(int i=0;i<n;i++){
			temp[i]=x[i]+tspan[1]*k2[i]/2.0;
		}
		k3=fun(temp,t);

		t=t+0.5*tspan[1];
		for(int i=0;i<n;i++){
			temp[i]=x[i]+tspan[1]*k3[i];
		}
		k4=fun(temp,t);
		for(int i=0;i<n;i++){
			double sum=0.0;
			sum=k1[i]+2*(k2[i]+k3[i])+k4[i];
			x[i]=x[i]+tspan[1]*sum/6.0;
		}
		y.push_back(x);
		tspan[0]+=tspan[1];
	}
	return y;
}