class SinglePattern():
    def __new__(cls, *args, **kwargs):
        if not hasattr(cls, '_instance'):
            cls._instance = super(SinglePattern, cls).__new__(cls)
        return cls._instance
        
        
class Singleton(SinglePattern):
    def __init__(self, name==''):
        self.name = name
    
a = Singleton('a')
b = Singleton('b')
print(a==b)

