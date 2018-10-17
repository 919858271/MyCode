#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
# main index
#-------------------------------------------------------------------------------
import os
import time
import csv
import json
from flask import render_template, request, jsonify
from werkzeug.utils import secure_filename
from app.models import MongoDB
from app.config import DefaultConfig, MongoDBConfig, UPLOAD_PATH, LOG_TYPE
from .. import main

mongoDB = MongoDB(MongoDBConfig.DB_CONFIG)


def has_log_for_current_ip(db_name):
    dblist = mongoDB.client.list_database_names()
    if db_name in dblist:
        mdb = mongoDB.client[db_name]
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


@main.route('/')
def index():
    db_name = 'log_' + str(request.remote_addr).replace('.', '_')
    tables = mongoDB.client[db_name].list_collection_names()
    log = get_log_tables_type(tables)
    return render_template(
        'main/index.html',
        user_ip=request.remote_addr,
        log_type=LOG_TYPE,
        log=log,
        user_has_logs=has_log_for_current_ip(db_name))


def file_is_allowed(filename):
    return '.' in filename and filename.rsplit(
        '.', 1)[1].lower() in DefaultConfig.ALLOWED_EXTENSIONS


def get_data_from_csv(file_path):
    csv_reader = csv.reader(open(file_path, 'r'))
    data = [row for row in csv_reader]
    return data


def save_data_to_db(log_file_path, log_type, db_name):

    table_name = log_type + '_' + str(int(time.time()))
    mdb = mongoDB.client[db_name]
    table = mdb[table_name]
    data = get_data_from_csv(log_file_path)
    items = data[0]
    data4db = []
    for dic in data[1:]:
        data4db.append(dict(zip(items, dic)))
    table.insert_many(data4db)


@main.route('/upload/', methods=['POST'])
def upload_file():
    db_name = 'log_' + str(request.remote_addr).replace('.', '_')
    if request.method == 'POST':
        if 'file' not in request.files:
            return 'No file part'
        file = request.files['file']
        log_type = request.form['log_type']

        if file.filename == '':
            return 'No selected file'
        if file_is_allowed(file.filename):
            if file:
                save_floder = UPLOAD_PATH + '/' + str(
                    request.remote_addr) + '/' + str(log_type) + '/'
                if not os.path.exists(save_floder):
                    os.makedirs(save_floder)
                save_path = save_floder + secure_filename(file.filename)
                try:
                    file.save(save_path)
                    save_data_to_db(save_path, log_type, db_name)
                except:
                    return 'file is upload but error occure when saving file for unknow reason'
                return 'file upload successed'
        else:
            return 'file type is not support'
    return 'file upload fialed'


@main.route('/show/<db_table>')
def show(db_table):
    datas = {}
    db_name = 'log_' + str(request.remote_addr).replace('.', '_')
    mdb = mongoDB.client[db_name]
    log = mdb[db_table]

    cursor = log.find({}, {'_id': 0})  #.limit(50)

    datas['total'] = cursor.count()
    datas['rows'] = list(cursor)
    items = list(datas['rows'][0].keys())
    titles = []
    selections = []
    for item in items:
        titles.append({'field': item, 'title': item, 'width': 100})
        selections.append({'id': item, 'text': item})
    datas['title'] = titles
    datas['selections'] = selections
    return json.dumps(datas)


@main.route('/show2/<db_table>')
def show_log(db_table):
    db_name = 'log_' + str(request.remote_addr).replace('.', '_')
    mdb = mongoDB.client[db_name]
    log = mdb[db_table]
    dateset = log.find()
    itmes = list(dateset[0].keys())
    itmes.pop(0)
    return '1'


@main.route('/test2/')
def test2():
    return render_template('main/test.html', )


@main.route('/test/')
def test():
    datas = {}
    db_name = 'log_' + str(request.remote_addr).replace('.', '_')
    mdb = mongoDB.client[db_name]
    log = mdb['autolog_1539522298']

    cursor = log.find({}, {'_id': 0}).limit(50)

    datas['total'] = cursor.count()
    datas['rows'] = list(cursor)
    items = list(datas['rows'][0].keys())
    titles = []
    for item in items:
        titles.append({'field': item, 'title': item})
    datas['title'] = titles
    return json.dumps(datas)
