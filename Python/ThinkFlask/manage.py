# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com

from flask_script import Manager, Server
import app

manager = Manager(app.app)

manager.add_command(
    "runserver",
    Server(
        host=app.app.config['HOST'],
        port=app.app.config['PORT'],
        use_debugger=app.app.config['DEBUG']))


@manager.shell
def make_shell_context():
    '''
    make sure Flask app object imported，otherwise the  app object not in the started CLI
    '''
    return dict(app=app.app, db=app.db)


if __name__ == '__main__':
    manager.run()