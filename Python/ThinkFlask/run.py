#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import Flask, render_template, url_for, redirect

app = Flask(__name__)
app.config.from_object('common.config.config')

for url in app.config['URL']:
    app.register_blueprint(url['url'], url_prefix=url['url_prefix'])


@app.route('/')
def index():

    welcome = 'Welcome to Flask!'
    #index_url = url_for('home_index.index')
    #return redirect(index_url)
    return render_template('index.html', welcome=welcome)


if __name__ == '__main__':
    app.run(debug=app.config['DEBUG'])
