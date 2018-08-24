#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
#-------------------------------------------------------------------------------
from flask import Flask, render_template, url_for, redirect
from home.views.index import home_index
from admin.views.index import admin_index

app = Flask(__name__)

app.register_blueprint(home_index, url_prefix='/home/')
app.register_blueprint(admin_index, url_prefix='/admin/')


@app.route('/')
def index():

    welcome = 'Welcome to Flask!'
    #index_url = url_for('home_index.index')
    #return redirect(index_url)
    return render_template('index.html', welcome=welcome)


if __name__ == '__main__':
    app.run(debug=True)
