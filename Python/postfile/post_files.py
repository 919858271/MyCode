import requests
file_path = u"E:/GitHub/MyCode/Python/Python.7z"
data = {"ID" : "10240447",'version':'V37'}
file = {
    "field1" : ("postgresql11.1.7z", open(file_path, "rb")),
    "field2" : ("Tpostgresql11.1.7z", open(file_path, "rb")),
}


r = requests.post("http://127.0.0.1:8000/upload/", data=data, files=file)
print(r.text)