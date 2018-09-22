# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from home.views.index import home_index
from admin.views.index import admin_index

blueprints = [{
    'url': home_index,
    'url_prefix': '/'
}, {
    'url': admin_index,
    'url_prefix': '/admin/'
}]
