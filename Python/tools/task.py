from threading import Thread
from multiprocessing import Manager
from server import BaseTaskServer
from server import BaseTaskHandler
from logger import logger


class TaskHandler(BaseTaskHandler):

    def setup(self):
        self.server.clients.update(
            {self.client_address[0]+str(self.client_address[1]): self.client_address[1]})
        logger.info('accept request from:%s, alloc:%s' % self.client_address)

    def handle(self):
        while True:
            try:
                msg = self.request.recv(1024).decode('utf8')
                print(msg)
            except:
                break

    def finish(self):
        self.server.clients.pop(
            self.client_address[0]+str(self.client_address[1]), None)


class TaskManager(BaseTaskServer):
    def __init__(self, server_address, TaskHandlerClass):
        super(TaskManager, self).__init__(server_address, TaskHandlerClass)
        manager = Manager()
        self.clients = manager.dict()
        self.resources = manager.list()
        self.runhelp = {
            'list': self.list_clients,
            'shutdown': self.server_close,
        }

    def help(self):
        cmd = input()
        self.runhelp.get(cmd, self.empty)()

    def list_clients(self):
        logger.info('total clients:%d' % len(self.clients))
        for ip, code in self.clients.items():
            logger.info('client:%s, alloc:%d' % (ip, code))

    def empty(self):
        pass


if __name__ == '__main__':
    task = TaskManager(('127.0.0.1', 12306), TaskHandler)
    task_thread = Thread(target=task.serve_forever)
    task_thread.daemon = True
    task_thread.start()
    logger.info('Listening on %s:%d' % task.server_address)
    while task.is_runing():
        task.help()
