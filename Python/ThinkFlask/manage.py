# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from flask_script import Manager, Server
from flask_migrate import Migrate, MigrateCommand
from app import App

think_flask = App()
manager = Manager(think_flask.app)
migrate = Migrate(think_flask.app, think_flask.db)

manager.add_command('db', MigrateCommand)
manager.add_command(
    "runserver",
    Server(
        host=think_flask.app.config['HOST'],
        port=think_flask.app.config['PORT'],
        use_debugger=think_flask.app.config['DEBUG']))


@manager.shell
def make_shell_context():
    '''
    make sure Flask app object imported, otherwise the  app object not in the started CLI
    '''
    return dict(app=think_flask.app, db=think_flask.db)


if __name__ == '__main__':
    manager.run()