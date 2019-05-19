from threading import Thread
from multiprocessing import Process
from multiprocessing import JoinableQueue as Queue

def writer_proc(q):
    for i in range(100):
        q.put(i)
        
def writer_proc2(q):
    for i in range(150):
        q.put('thread_2:'+str(i)) 
        
        
def reader_proc(q):
    while True:
        print(q.get())
        q.task_done()


class Task():
    def __init__(self):
        self.msgQueue = Queue()
        self.readMsgThread = Thread(target=self.getMsgtheard, args=())
        self.readMsgThread.start()
    
    def getMsgtheard(self):
        while True:
            print(self.msgQueue.get())
            self.msgQueue.task_done()
    
    def startTask(self):
        self.writer = Process(target=writer_proc, args=(self.msgQueue,))
        self.writer.start()
        
        
    def startTask2(self):
        self.writer2 = Process(target=writer_proc2, args=(self.msgQueue,))
        self.writer2.start()

if __name__ == "__main__":

    # q = JoinableQueue()
    
    # writer = Process(target=writer_proc, args=(q,))
    # writer.start()   

    # reader = Process(target=reader_proc, args=(q,))
    # reader.start()  

    # reader.join()  
    # writer.join()
    
    task = Task()
    task.startTask()
    task.startTask2()