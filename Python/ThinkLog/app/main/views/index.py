#-------------------------------------------------------------------------------
# !/usr/bin/env python
# -*- coding: utf-8 -*-
# Author:      jianwen
# Email:       npujianwenxu@163.com
# main index
#-------------------------------------------------------------------------------
import os
from flask import render_template, request, jsonify
from werkzeug.utils import secure_filename
from app.config.config import MONGODB, UPLOAD_PATH, LOG_TYPE
from ..common.public import has_log_for_current_ip, get_log_tables_type, file_is_allowed, save_data_to_db
from .. import main


@main.route('/')
def index():
    db_name = 'log_' + str(request.remote_addr).replace('.', '_')
    tables = MONGODB.client[db_name].list_collection_names()
    log = get_log_tables_type(tables)
    return render_template(
        'main/index.html',
        user_ip=request.remote_addr,
        log_type=LOG_TYPE,
        log=log,
        user_has_logs=has_log_for_current_ip(db_name))


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
    mdb = MONGODB.client[db_name]
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
    return jsonify(datas)
