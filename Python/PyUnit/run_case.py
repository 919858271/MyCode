# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
import os
import sys
import time
import unittest as ut
from ThirdParty.HTMLTestRunner import HTMLTestRunner

TEST_CASE_PATH = '/TestCase/'
REPORT_PATH = '/TestCaseReport/'
FILE_PREFIX = 'TestCaseReport_'
FILE_SUFFIX = '.html'
TEST_CASE_PATTERN = 'test*.py'

main_path = os.path.split(os.path.abspath(sys.argv[0]))[0]
test_case_path = (main_path + TEST_CASE_PATH).replace('\\', '/')
report_path = (main_path + REPORT_PATH).replace('\\', '/')
current_time = time.strftime('%Y-%m-%d-%H-%M-%S', time.localtime(time.time()))
report_file_name = report_path + FILE_PREFIX + str(current_time) + FILE_SUFFIX


class RunTestCases(object):
    def __init__(self):
        self.creat_report_path()
        self.suite = self.get_all_test_cases()

    def creat_report_path(self):
        if not os.path.exists(report_path):
            os.makedirs(report_path)

    def get_all_test_cases(self):
        discover = ut.defaultTestLoader.discover(
            test_case_path, pattern=TEST_CASE_PATTERN)
        suite = ut.TestSuite()
        suite.addTests(discover)
        return suite

    def run(self):
        with open(report_file_name, 'w') as f:
            runner = HTMLTestRunner(
                stream=f, verbosity=2, title='Test for unittest')
            runner.run(self.suite)


if __name__ == '__main__':
    run = RunTestCases()
    run.run()
