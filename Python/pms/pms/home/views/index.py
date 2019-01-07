#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''

Created on 2018-12-29 20:26:26

@author: jianwen

'''

from django.shortcuts import render


def index(request):
    return render(request, 'home/index.html')

def detial(request, requirement_id):
    return render(request, 'home/detial.html')
