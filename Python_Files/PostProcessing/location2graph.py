# -*- coding: utf-8 -*-
''' Created on Sun Mar 14 00:09:39 2021
@author: Ayrton M and jmatailov11

This function returns the indices
where the '1' values are found. '''

import numpy as np

def location(loc_matrix):
    location = np.where(loc_matrix == 1)           # return indices of the values that are '1'
    location = np.transpose(np.array(location))    # reverse the axes of an matrix
    return location
