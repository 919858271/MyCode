#!/usr/bin/env python
# -*- coding: utf-8 -*-

import socket
from multiprocessing import Process


class BaseTaskHandler():

    def __init__(self, request, client_address, server):
        self.request = request
        self.client_address = client_address
        self.server = server
        self.setup()
        try:
            self.handle()
        finally:
            self.finish()

    def setup(self):
        pass

    def handle(self):
        pass

    def finish(self):
        pass


class BaseTaskServer():

    request_queue_size = 5

    __shutdown_server = False

    def __init__(self, server_address, TaskHandlerClass):
        self.TaskHandlerClass = TaskHandlerClass
        self.server_address = server_address
        self.socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_KEEPALIVE, 1)

        try:
            self.server_bind()
            self.server_activate()
        except:
            self.server_close()
            raise

    def server_bind(self):
        self.socket.bind(self.server_address)
        self.server_address = self.socket.getsockname()

    def server_activate(self):
        self.socket.listen(self.request_queue_size)

    def serve_forever(self):
        while not self.__shutdown_server:
            if self.__shutdown_server:
                break
            self.handle_request()

    def handle_request(self):
        try:
            request, client_address = self.get_request()
        except OSError:
            return
        try:
            self.process_request(request, client_address)
        except Except:
            self.handle_error(request, client_address)
            self.shutdown_request(request)
        except:
            self.shutdown_request(request)
            raise

    def verify_request(self, request, client_address):
        return True

    def process_request_fork(self, request, client_address):
        self.finish_request(request, client_address)

    def process_request(self, request, client_address):
        p = Process(target=self.process_request_fork,
                    args=(request, client_address))
        p.daemon = True
        p.start()

    def finish_request(self, request, client_address):
        self.TaskHandlerClass(request, client_address, self)

    def get_request(self):
        return self.socket.accept()

    def server_close(self):
        self.__shutdown_server = True
        self.socket.close()

    def is_runing(self):
        return not self.__shutdown_server

    def shutdown_request(self, request):
        try:
            request.shutdown(socket.SHUT_WR)
        except OSError:
            pass
        self.close_request(request)

    def close_request(self, request):
        request.close()

    def handle_error(self, request, client_address):
        print('-'*40, file=sys.stderr)
        print('Exception happened during processing of request from',
              client_address, file=sys.stderr)
        import traceback
        traceback.print_exc()
        print('-'*40, file=sys.stderr)
