#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2018-12-29 20:17:40

@author: jianwen

'''

from django.urls import path,include

urlpatterns = [
    path('', include('pms.home.urls')),
    path('admin/', include('pms.admin.urls')),
]