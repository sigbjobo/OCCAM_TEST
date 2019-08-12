import matplotlib.pylab as plt
import glob
import numpy as np

fn1= glob.glob("error*.dat")
min_alpha=[]
min_val=[]
m=[]

for f in fn1:
    print f
    dat=np.loadtxt(f)
    alpha=dat[::2]
    print alpha
    a=dat[1::2]
    try:
        m.append(int(f.strip('error').strip('.dat')))
        min_val.append(np.min(a)*100.)
        min_alpha.append(alpha[np.argmin(a)])
    except:
        pass
plt.subplot(121)
plt.scatter(20./np.array(m,dtype=float),min_alpha)
plt.subplot(122)
plt.scatter(20./np.array(m,dtype=float),min_val)
plt.show()    
