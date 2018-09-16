# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from __future__ import unicode_literals
from threading import Timer
from wxpy import *
import requests

bot = Bot()

# linux执行登陆请调用下面的这句
#bot = Bot(console_qr=2,cache_path="botoo.pkl")


def get_news():
    """获取金山词霸每日一句，英文和翻译"""

    url = "http://open.iciba.com/dsapi/"
    r = requests.get(url)
    content = r.json()['content']
    note = r.json()['note']
    return content, note


def send_news():
    contents = get_news()
    # 你朋友的微信名称，不是备注，也不是微信帐号。
    my_friend = bot.friends().search(u'Favorite')[0]
    my_friend.send(contents[0])
    my_friend.send(contents[1])
    my_friend.send(u"又到周末了")
    #t = Timer(2, send_news)
    #t.start()


if __name__ == "__main__":
    send_news()