# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------

import unittest as ut
from Alpha import mathfun


class TestMathFun(ut.TestCase):
    '''Test mathfun.py'''

    # def setUp(self):
    #     print('Star test')

    # def tearDown(self):
    #     print('Test Done')

    @classmethod
    def setUpClass(cls):
        print('Star test 2')

    @classmethod
    def tearDownClass(cls):
        print('Test Done 2')

    def test_add(self):
        '''Test method add(a,b)'''
        print('Test_add')
        self.assertEqual(3, mathfun.add(1, 2))
        self.assertNotEqual(2, mathfun.add(1, 2))

    def test_minus(self):
        '''Test method minus(a,b)'''
        print('Test_minus')
        self.assertEqual(1, mathfun.minus(2, 1))
        self.assertNotEqual(2, mathfun.minus(2, 2))

    def test_multi(self):
        '''Test method multi(a,b)'''
        print('Test_multi')
        self.assertEqual(1, mathfun.multi(1, 1))
        self.assertNotEqual(2, mathfun.multi(1, 1))

    def test_divide(self):
        '''Test method divide(a,b)'''
        print('Test_divide')
        self.assertEqual(2.0, mathfun.divide(2, 1))
        self.assertNotEqual(2, mathfun.divide(2, 2))
