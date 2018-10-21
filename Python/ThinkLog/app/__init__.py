# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
import os
from werkzeug.utils import import_string
from flask import Flask
ROOT_PATH = os.path.abspath(os.path.dirname(__file__))
from app.config.config import DB, BLUEPRINTS
import app.main


class App():
    def __init__(self):
        self.app = Flask(__name__)
        self.app.config.from_object(app.config.config)
        self.db = DB
        self.create_blueprints(BLUEPRINTS)
        self.db.init_app(self.app)

    def create_blueprints(self, blueprints):
        for bp in blueprints:
            self.app.register_blueprint(
                import_string(bp['url']), url_prefix=bp['url_prefix'])
