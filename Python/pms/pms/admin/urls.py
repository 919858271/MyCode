#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2018-12-29 20:28:07

@author: jianwen

'''



from django.urls import path

from .views import index

urlpatterns = [
    path('', index.index, name='index'),
]