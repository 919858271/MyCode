from flask import Flask
from app import config
from app.urls import blueprints
from app.models import db
from home.model import models as home
from admin.model import models as admin


class App():
    def __init__(self):
        self.app = Flask(__name__)
        self.app.config.from_object(config)
        self.db = db
        self.create_blueprints(blueprints)
        self.db.init_app(self.app)

    def create_blueprints(self, blueprints):
        for bp in blueprints:
            self.app.register_blueprint(bp['url'], url_prefix=bp['url_prefix'])
