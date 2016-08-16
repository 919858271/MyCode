# -*- coding: utf-8 -*-
import urllib
import urllib2
import re
import os

def Download(url,output):
        print "downloading..."+url
        response = urllib2.urlopen(url)
        resourceFile = open(output,"wb")
        resourceFile.write(response.read())
        resourceFile.close()
        print "downloaded"

def Action(url,ext = "whl",output = "."):
        #1.domain
        index = url.rfind("/");
        domain = url[0:index+1];
        print domain
        headers = {"User-Agent": "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6"}
        request = urllib2.Request(url,headers=headers)
        response = urllib2.urlopen(request)
        #2.content
        content = response.read()
        #3.resource
        mode = '\"([^\"]+'+ext+')\"'
        pattern = re.compile(mode)
        strMatch = pattern.findall(content)
        size = len(strMatch)
        print "file num: "+str(size)
        for i in range(0,size,1):
                one = strMatch[i]
                partIndex = one.rfind('/')
                if not one.startswith('http://'):
                        if -1!=partIndex:
                                directDir = one[0:partIndex+1]
                        else:
                                directDir = ""
                        try:
                                os.makedirs(output+"/"+directDir)
                        except Exception,e:
                                pass
                        fileUrl = domain+one
                        fileOutput = output+"/"+one
                        print fileUrl
                        print fileOutput
                        Download(fileUrl,fileOutput)
                else:
                        print one
                        print "........."
                        print one[partIndex:]
                        fileOutput = output+"/"+one[partIndex:]
                        print fileOutput
                        Download(one,fileOutput)
if __name__=='__main__':
        print "download"
        url = "http://www.lfd.uci.edu/~gohlke/pythonlibs/zpcorkgj/";
        Action(url,"whl");

    
    