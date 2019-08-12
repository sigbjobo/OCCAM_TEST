
import numpy as np
import sys

def fc(d,L,n):
    ke = 138.93542761173322
    F=1./d**2
    for i in range(1,n):
        F=F-1./np.abs(d-i*L)**2+1./np.abs(d+i*L)**2
    return F*ke

n=20
d=np.loadtxt(sys.argv[1])[:,0]
L=float(sys.argv[2])


fp=open('%s_exact.dat'%(sys.argv[1].split('.')[0]),'w')
for di in d:
    if(di>=1):
        fp.write('%f %f\n'%(di,fc(di,L,n)))
fp.close()
