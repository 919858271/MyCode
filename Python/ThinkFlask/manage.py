# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
from flask_script import Manager, Server
from flask_migrate import Migrate, MigrateCommand
from app import app, db

manager = Manager(app)
migrate = Migrate(app, db)

manager.add_command('db', MigrateCommand)
manager.add_command(
    "runserver",
    Server(
        host=app.config['HOST'],
        port=app.config['PORT'],
        use_debugger=app.config['DEBUG']))


@manager.shell
def make_shell_context():
    '''
    make sure Flask app object imported, otherwise the  app object not in the started CLI
    '''
    return dict(app=app, db=db)


if __name__ == '__main__':
    manager.run()