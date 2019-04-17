import os
import sys
import django
os.environ['DJANGO_SETTINGS_MODULE'] = 'root.settings'
django.setup()
from pms.models import User
