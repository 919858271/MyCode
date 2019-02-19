import os
from django.shortcuts import render
from django.views.decorators.http import require_http_methods
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
# Create your views here.

save_path = 'C:/Users/jianwen/Desktop/app/'

@csrf_exempt
@require_http_methods(['POST'])
def upload_file(request):
    files = request.FILES
    for file in files.items():
        print('uploading file: %s' % file[1].name)
        with open(os.path.join(save_path, file[1].name), 'wb') as f:
            for chunk in file[1].chunks():
                f.write(chunk)
        print('uploading file: %s Done.' % file[1].name)
    return HttpResponse('ACK')