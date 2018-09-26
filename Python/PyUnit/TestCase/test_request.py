# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
import unittest as ut
from unittest import mock
from Alpha import client


class TestClient(ut.TestCase):
    @classmethod
    def setUpClass(cls):
        print('Test Mock request')

    @classmethod
    def tearDownClass(cls):
        print('Test Mock request Done')

    def test_success_request(self):
        '''Test request success'''
        print('Test request success')
        success_send = mock.Mock(return_value='200')
        client.send_request = success_send
        self.assertEqual(client.visit_ustack(), '200')

    def test_fail_request(self):
        '''Test request fail'''
        print('Test request fail')
        fail_send = mock.Mock(return_value='404')
        client.send_request = fail_send
        self.assertEqual(client.visit_ustack(), '404')