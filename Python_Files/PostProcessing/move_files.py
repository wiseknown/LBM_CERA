# -*- coding: utf-8 -*-
""" Created on Sat May 29 23:49:41 2021
@author: Ayrton M and jcmatailo"""

import shutil
import os 

def move_file(file, folder):
    
    file = file + '.csv'
    current_path = os.getcwd() + os.sep
    
    status_folder = os.path.exists(folder)
    if (status_folder != True):    
        os.makedirs(current_path+folder)
    
    source = current_path + file
    destination = current_path + folder + os.sep + file
    
    old_file = os.path.exists(destination) 
    if (old_file == True):
        os.remove(destination)        
   
    shutil.move(source, destination)