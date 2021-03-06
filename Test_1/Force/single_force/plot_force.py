import matplotlib.pylab as plt
import numpy as np
import glob

def read_force(fn):
    lines=open(fn,'r').readlines()

    r=np.zeros(len(lines)//3)
    f=np.zeros((len(lines)//3,3))
    i=-1
    for li in lines:
        l=li.split()
        if(len(l)==1):
            i=i+1
            r[i]=float(l[0])
        else:
            for a in range(len(l)):
                f[i,a]=abs(float(l[a]))

    ind=np.argsort(r)
    r=r[ind]
    f=f[ind,:]
    return [r,f]

plt.figure(figsize=(6,3.33))
plt.subplot(121)
[r,f]=read_force("force30.dat")
plt.plot(r[r>=1],138.935/r[r>=1]**2,label=r'$F_{\rm{C}}$')
plt.plot(r,f[:,2],label=r'$F_z$')
plt.xlabel(r'$d/\rm{nm}$')
plt.ylabel(r'$F/\rm{kJ}~\rm{mol}^{-1}\rm{nm}^{-1}$')
plt.legend()
plt.subplot(122)
plt.plot(r[r>=1],100*np.abs(138.935/r[r>=1]**2-f[r>=1,2])/(138.935/r[r>=1]**2))
plt.xlabel(r'$d/\rm{nm}$')
plt.ylabel(r'$\varepsilon/\% $')
plt.tight_layout()
plt.savefig('two_fft.pdf')
plt.show()

