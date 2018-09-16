# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com

from flask_script import Manager, Server
from common.models import MODELS
import main

manager = Manager(main.app)

manager.add_command(
    "runserver",
    Server(
        host=main.app.config['HOST'],
        port=main.app.config['PORT'],
        use_debugger=main.app.config['DEBUG']))


@manager.command
def db():
    '''
    create all models in the project
    '''
    print('creating modes')
    for model in MODELS:
        try:
            model.create_all()
        except:
            print('models failed to creat for some errors occured')
    return 'done'


@manager.shell
def make_shell_context():
    '''
    make sure Flask app object import，otherwise the  app object not in the started CLI
    '''
    return dict(app=main.app)


if __name__ == '__main__':
    manager.run()