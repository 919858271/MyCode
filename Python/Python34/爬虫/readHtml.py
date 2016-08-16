# -*- coding: utf-8 -*-

import re
import urllib
import urllib2
'''
getHtml(url)
抓取网页并返回所有信息
'''
def getHtml(url):
    headers = {"User-Agent": "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6"}
    request = urllib2.Request(url,headers=headers)
    
    page = urllib2.urlopen(request)
    html = page.read().decode("utf-8")
    return html

'''
getImg(htmlInfo)
从获取的页面信息中利用
正则表达式获取图片链接
'''
def getImg(htmlInfo):
    reg = r'href="(.+?.)"'
    imgre = re.compile(reg)
    imglist = re.findall(imgre,htmlInfo)
    return imglist

def downLoadImg(htmlInfo):
    imglist = getImg(htmlInfo)
    x = 0
    for imgurl in imglist:
        urllib.urlretrieve(imgurl,'%s.png' % x)
        x+=1
        
def getAllURL(url):
    htmlInfo = getHtml(url)
    reg = r'href="(http:.+?.)"'
    urlre = re.compile(reg)
    urlList = re.findall(urlre,htmlInfo)
    return urlList
        
URL = "http://www.zhihu.com/question/20899988"      
html = getHtml("http://tieba.baidu.com/p/2460150866")
 
print getHtml(URL).encode("gbk", "replace")
