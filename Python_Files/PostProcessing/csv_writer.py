# -*- coding: utf-8 -*-
''' Created on Sat Mar 13 23:18:53 2021
@author: Ayrton M and jmatailov11 '''

import numpy as np

# This function writes a index matrix in a .csv file

def csv_wr(name, matrix):
    index_matrix = np.savetxt(name+'.csv', matrix, delimiter=',', fmt='%i')
    return index_matrix
    
