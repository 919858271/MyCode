# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com

from flask import Blueprint
main = Blueprint('main', __name__)
from .views import index
