# -*- coding: utf-8 -*-
'''
only for temp test or study
'''
import re
import urllib2

def getHtml(url):
    page = urllib2.urlopen(url)
    html = page.read().decode("utf-8")
    return html

def getImg(html):
    reg = r'src="(.+?\.png)" alt='
    imgre = re.compile(reg)
    imglist = re.findall(imgre,html)
    return imglist      
   
html = getHtml("http://www.cnblogs.com/fnng/p/3576154.html")
print html
for im in getImg(html):
    print im