# -*- coding: utf-8 -*-
''' Created on Sat Mar 13 23:18:53 2021
@author: Ayrton M and jmatailov11

This funtion take a index matrix as input and
writes this matrix in a .csv file. '''

import numpy as np

def csv_wr(name, matrix):
    # Save index matrix using numpy library. Comma delimiter is used.
    index_matrix = np.savetxt(name+'.csv', matrix, delimiter=',', fmt='%i')
    return index_matrix          # Return the .csv document
