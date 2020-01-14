import numpy as np


A=np.loadtxt('forces_new.dat')[3:]
B=np.loadtxt('forces_old.dat')[3:]

print("max difference in force: %.8f"% np.max(np.absolute(A-B)))
