#include "fun.class.h"
vector<double> fun(vector<double> x,double t){
	int n=x.size();
	vector<double> y(n);
	y[0] = -10*x[0]+10*x[1];
	y[1] = -x[0]*x[2]+24.7*x[0]-x[1];
	y[2] = x[0]*x[1]-2.6666*x[2];
	return y;
}