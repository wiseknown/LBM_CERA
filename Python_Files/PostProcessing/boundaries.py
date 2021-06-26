# -*- coding: utf-8 -*-

''' Created on Sun Mar 14 00:09:39 2021
@author: Ayrton M and jcmatailo

This code take a media matrix (3D array) as input,
and return the boundaries of that media as matrix
using binary dilation.

Binary dilation method return "True" and "False" values,
so it is necessary to convert these values to "0" and "1",
this is achieved by multiplying  by 1. '''

import numpy as np
from scipy.ndimage.morphology import binary_dilation

def boundaries(media):
    k = np.ones(shape=(3,3,3))                          	    # Create a ones matrix (3x3x3)
    boundaries_media = binary_dilation(media, structure=k)    	# Binary dilation is applied to the input matrix
    boundaries_media = boundaries_media * 1			            # "True" values to "1"
    boundaries_media = boundaries_media - media             	# Boundaries matrix generated
    return boundaries_media
