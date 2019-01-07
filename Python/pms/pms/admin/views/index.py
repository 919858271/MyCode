#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2018-12-29 20:25:50

@author: jianwen

'''

from django.http import HttpResponse

def index(request):
    return HttpResponse("Hello, world. You're at the admin index.")