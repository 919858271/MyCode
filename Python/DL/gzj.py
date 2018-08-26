#!usr/bin/python3
# coding:utf-8

# BGD 批梯度下降代码实现
# SGD 随机梯度下降代码实现
import numpy as np

import random


def batchGradientDescent(x, y, theta, alpha, m, maxInteration):
    x_train = x.transpose()
    for i in range(0, maxInteration):
        hypothesis = np.dot(x, theta)
        # 损失函数
        loss = hypothesis - y
        # 下降梯度
        gradient = np.dot(x_train, loss)
        # 求导之后得到theta
        theta = theta - alpha * gradient
    return theta


def stochasticGradientDescent(x, y, theta, alpha, m, maxInteration):
    data = []
    for i in range(4):
        data.append(i)
    x_train = x.transpose()
    for i in range(0, maxInteration):
        hypothesis = np.dot(x, theta)
        # 损失函数
        loss = hypothesis - y
        # 选取一个随机数
        index = random.sample(data, 1)
        index1 = index[0]
        # 下降梯度
        gradient = loss[index1] * x[index1]
        # 求导之后得到theta
        theta = theta - alpha * gradient
    return theta


def main():
    trainData = np.array([[1, 4, 2], [2, 5, 3], [5, 1, 6], [4, 2, 8]])
    trainLabel = np.array([19, 26, 19, 20])

    m, n = np.shape(trainData)
    theta = np.ones(n)

    maxInteration = 50000
    alpha = 0.01
    theta1 = batchGradientDescent(trainData, trainLabel, theta, alpha, m,
                                  maxInteration)
    print(theta1)
    theta2 = stochasticGradientDescent(trainData, trainLabel, theta, alpha, m,
                                       maxInteration)
    print(theta2)
    return


if __name__ == "__main__":
    main()
