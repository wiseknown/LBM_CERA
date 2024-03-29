# -*- coding: utf-8 -*-
''' Created on Sun Mar 14 01:36:54 2021
@author: Ayrton M and jmatailov11 '''

import PorousMediaGenerationExample.SOFC_generate_threephase as sofc 
import PostProcessing.location2graph as lct
import PostProcessing.boundaries as bd
import PostProcessing.csv_writer as write
import PostProcessing.move_files as mv

pores, nickel, YSZ, nck_ysz = sofc.alpha_func(6)        # Define the alpha value

nck_loc      = lct.location(nickel)         # Generates nickel indices
ysz_loc      = lct.location(YSZ)            # Generates ysz indices
nck_ysz_loc  = lct.location(nck_ysz)        # Generates media (nickel & ysz) indices

bdrs = bd.boundaries(nck_ysz)               # Find the boundaries of the media (nickel & ysz) matriz
bdrs = bdrs - nck_ysz
bdrs_loc = lct.location(bdrs)               # Generates media boundaries indices

write.csv_wr('nickel', nck_loc)             # Write a .csv file, where are the nickel indices.
write.csv_wr('ysz', ysz_loc)                # Write a .csv file, where are the ysz indices.
write.csv_wr('media', nck_ysz_loc)          # Write a .csv file, where are the media indices.
write.csv_wr('boundaries', bdrs_loc)        # Write the boundaries indices in a .csv file

new_dir = 'Media_Matrices'
mv.move_file('nickel',new_dir)
mv.move_file('ysz',new_dir)
mv.move_file('media',new_dir)
mv.move_file('boundaries',new_dir)