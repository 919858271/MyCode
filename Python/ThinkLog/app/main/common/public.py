# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
# public

import csv
import time
from app.config.config import MONGODB, LOG_TYPE, ALLOWED_EXTENSIONS


def has_log_for_current_ip(db_name):
    dblist = MONGODB.client.list_database_names()
    if db_name in dblist:
        mdb = MONGODB.client[db_name]
        if len(mdb.list_collection_names()) > 0:
            return True
        else:
            return False
    else:
        return False


def get_log_tables_type(tables):
    log = {}
    for tp in LOG_TYPE:
        log[tp['key']] = []
        for tb in tables:
            if tp['key'] in tb:
                log[tp['key']].append(tb)
    return log


def file_is_allowed(filename):
    return '.' in filename and filename.rsplit(
        '.', 1)[1].lower() in ALLOWED_EXTENSIONS


def get_data_from_csv(file_path):
    csv_reader = csv.reader(open(file_path, 'r'))
    data = [row for row in csv_reader]
    return data


def save_data_to_db(log_file_path, log_type, db_name):

    table_name = log_type + '_' + str(int(time.time()))
    mdb = MONGODB.client[db_name]
    table = mdb[table_name]
    data = get_data_from_csv(log_file_path)
    items = data[0]
    data4db = []
    for dic in data[1:]:
        data4db.append(dict(zip(items, dic)))
    table.insert_many(data4db)
