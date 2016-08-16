# -*- coding: utf-8 -*-
from selenium import webdriver
#使用selenium的匿名方式
#service_args = ['--proxy=localhost:9999', '--proxy-type=socks5', ]
driver =webdriver.PhantomJS(executable_path="phantomjs.exe")
url = "http://dynamic.12306.cn/otn/board/boardMore"
#使用浏览器请求页面
driver.get(url)
#获取页面html内容
#html = driver.page_source.encode('gbk','ignore')
f = open("leftTicket.txt", "w")
print driver.find_element_by_id('table_board_more').text
f.write(driver.find_element_by_id('table_board_more').text.encode("gbk", "replace"))
f.close()
driver.close()

