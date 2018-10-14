# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com

from werkzeug.utils import import_string
from flask import Flask
from app.config import DefaultConfig, URLConfig, MongoDBConfig
from app.models import db, MongoDB
import app.main

mongoDB = MongoDB(MongoDBConfig.DB_CONFIG)


class App():
    def __init__(self):
        self.app = Flask(__name__)
        self.app.config.from_object(DefaultConfig)
        self.db = db
        self.create_blueprints(URLConfig.blueprints)
        self.db.init_app(self.app)

    def create_blueprints(self, blueprints):
        for bp in blueprints:
            self.app.register_blueprint(
                import_string(bp['url']), url_prefix=bp['url_prefix'])
