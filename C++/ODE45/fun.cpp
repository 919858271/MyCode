/*!
 * \file fun.cpp
 * \date 2015/12/25 9:19
 *
 * \author jianwenxu
 * Contact: 919858271@qq.com
 *
 * \brief
 *
 *
 *
 * \note
 */
#include "fun.h"
void fun(double *x,double *result,double t){
	double temp=t*sqrt(2.0);
	result[0] = x[1];
	result[1] = -(pow(x[0],2)-1)*x[1]-x[0]+cos(temp);
}
