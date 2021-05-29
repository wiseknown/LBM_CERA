# -*- coding: utf-8 -*-
""" Created on Mon May  3 11:14:37 2021
@author: Ayrton M """

import os	# import operating system module

# The next function search between directories, 
# and return the path where is the file:

def find_path(name_file):
    tar_file = name_file
    init_dir = 'C:\\'
    paraview_path = ''   
    for root, _, files in os.walk(init_dir): 
        if tar_file in files:
            paraview_path = os.path.join(root, tar_file)          
	    # x = len(paraview_path)
            # y = len(name_file)
            # z = x-y
            # paraview_path = paraview_path[0:z]           
            break                
    return paraview_path


# The next function search between directories, 
# and return a list of all posible paths where can be the file:

def find_paths(name_file):
    tar_file = name_file
    init_dir = 'C:\\'
    path_lst= [os.path.join(root, tar_file) 
    for root, _, files in os.walk(init_dir) 
    if tar_file in files]
    return path_lst
