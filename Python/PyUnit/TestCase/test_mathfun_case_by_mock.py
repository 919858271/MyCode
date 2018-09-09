# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
import unittest as ut
from unittest.mock import patch
from Alpha.mathfun_class import MathFunc


class TestMathFuncClassMock(ut.TestCase):
    @classmethod
    def setUpClass(cls):
        print('Test Mock in object')
        cls.MathFunc = MathFunc()

    @classmethod
    def tearDownClass(cls):
        print('Test Mock in object Done')

    @patch.object(MathFunc, 'add')
    def test_add(self, mock_add):
        '''Test method add(a,b) by Mock'''
        print('Test_add by mock')
        mock_add.side_effect = [1, 2, 3]
        self.assertEqual(self.MathFunc.add(8, 10), 1)
        self.assertEqual(self.MathFunc.add(8, 14), 2)
        self.assertEqual(self.MathFunc.add(8, 14), 3)
