# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com

from flask_script import Manager, Server
from flask_migrate import Migrate, MigrateCommand
from app import App

think_log = App()
manager = Manager(think_log.app)
migrate = Migrate(think_log.app, think_log.db)

manager.add_command('db', MigrateCommand)
manager.add_command(
    "runserver",
    Server(
        host=think_log.app.config['HOST'],
        port=think_log.app.config['PORT'],
        use_debugger=think_log.app.config['DEBUG']))


@manager.shell
def make_shell_context():
    '''
    make sure Flask app object imported, otherwise the  app object not in the started CLI
    '''
    return dict(app=think_log.app, db=think_log.db)


if __name__ == '__main__':
    manager.run()