#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2018-12-29 20:28:07

@author: jianwen

'''

from django.urls import path

from .views import index

app_name = 'home'
urlpatterns = [
    path(r'', index.index, name='index'),
    path(r'detial/<int:requirement_id>', index.detial, name='detial'),
]