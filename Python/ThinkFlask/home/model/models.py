# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from app import db


class User(db.Model):
    """Represents Proected users."""

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(
        db.String(255),
        unique=True,
        nullable=False,
    )
    password = db.Column(
        db.String(255),
        nullable=False,
    )

    # @property
    # def save(self):
    #     db.session.add(self.__class__.__name__)
    #     db.session.commit()