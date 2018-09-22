# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy()


class Model(object):
    @staticmethod
    def save(model):
        db.session.add(model)
        db.session.commit()

    @staticmethod
    def delete(model):
        db.session.delete(model)
        db.session.commit()