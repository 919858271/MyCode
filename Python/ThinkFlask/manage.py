# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com

from flask_script import Manager, Server
import main

manager = Manager(main.app)

manager.add_command(
    "runserver",
    Server(
        host=main.app.config['HOST'],
        port=main.app.config['PORT'],
        use_debugger=main.app.config['DEBUG']))


@manager.shell
def make_shell_context():
    '''
    make sure Flask app object imported，otherwise the  app object not in the started CLI
    '''
    return dict(app=main.app, db=main.db)


if __name__ == '__main__':
    manager.run()