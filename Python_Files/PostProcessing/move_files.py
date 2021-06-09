# -*- coding: utf-8 -*-
''' Created on Sat May 29 23:49:41 2021
@author: Ayrton M and jcmatailo

Move .csv files to a new directory to sort the documents. '''

import shutil
import os

def move_file(file, folder):

    file = file + '.csv'                         # add ".csv" to the file name
    current_path = os.getcwd() + os.sep          # add the current working diretory and path name separator ("/")

    status_folder = os.path.exists(folder)       # check whether the path exists or not
    if (status_folder != True):
        os.makedirs(current_path+folder)         # make the directory specified if the file does not exist

    source = current_path + file                 # from this path will be copied the file
    destination = current_path + folder + os.sep + file     # destination path

    old_file = os.path.exists(destination)       # destination path is assigned to other variable
    if (old_file == True):
        os.remove(destination)                   # verify that does not exists similar files

    shutil.move(source, destination)             # move the file from source path to destination path
