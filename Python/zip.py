from os import rename
from os.path import basename
from os.path import dirname
from os.path import splitext
from time import localtime
from time import  strftime
from zipfile import ZipFile
from zipfile import ZIP_DEFLATED
from shutil import rmtree as rmfolder

#zipfile.namelist()获取压缩包内文件名
#zipfile.filename获取压缩后文件名
#解压文件 ZipFile(file_path).extractall(save_folder)
#文件(夹)重命名rename(src_path, target_path)

def zip(save_path, need_zip_files):
    target_zip = save_path + strftime("%Y-%m-%d-%H-%M-%S", localtime())+'.zip'
    with ZipFile(target_zip, "w", ZIP_DEFLATED) as zipfile:
        for file in need_zip_files:
             zipfile.write(file, basename(file))
    return zipfile

