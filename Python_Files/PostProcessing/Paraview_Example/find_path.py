# -*- coding: utf-8 -*-

''' Created on Mon May  3 11:14:37 2021
@author: Ayrton M and jcmatailo

The first function search between directories,
and returns the path of the first file matched.

A few times, the first file matched is not required (may be similar files),
so the second function (in this document) search between directories,
and return a list of all posible paths where can be the file.
In this case, we can look between the paths'''

import os	    # Import operating system module

def find_path(name_file):
    tar_file = name_file                       # Assign the name file to a variable
    init_dir = 'C:\\'                          # Indicate the initial directory
    paraview_path = ''
    # os.walk method generates file names in a directory tree
    # by walking the tree either top-down or bottom-up
    for root, _, files in os.walk(init_dir):
        if tar_file in files:
            # os.path.join method join one or more path components.
            # This method concatenates various paths components with exactly one directory separator ('/')
            # following each non-empty part except the last path component
            paraview_path = os.path.join(root, tar_file)
            break
    return paraview_path                      # Return the path

def find_paths(name_file):
    tar_file = name_file                      # Assign the name file to a variable
    init_dir = 'C:\\'                         # Indicate the initial directory
    path_lst= [os.path.join(root, tar_file)   # Start generating the paths list
    for root, _, files in os.walk(init_dir)
    if tar_file in files]
    return path_lst                           # Return the path
