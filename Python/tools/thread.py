from threading import Thread
def function():
    for i in range(10):
        print("function called by thread %i\n" % i)
    return
    
def function1():
    for i in range(10):
        print("function1 called by thread %i\n" % i)
    return
t1 = Thread(target=function)
t2 = Thread(target=function1)
t1.start()
t2.start()
t1.join()
t2.join()
print(123)
print('done')