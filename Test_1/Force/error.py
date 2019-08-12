import numpy as np
import sys

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
ke=138.93545528915712

def Coulomb_z(d,L,n):
    
    fz=0.0
    for ix in range(-n,n):
        for iy in range(-n,n):
            for iz in range(-n,n):
                n_vec=np.array([ix,iy,iz])
                fz = fz + (d+n_vec[2]*L)/(np.linalg.norm([d,0,0]+n_vec*L))**3
    return fz*138.93545528915712
         
def f(d,L,n):
    ke = 138.93542761173322
    F=1./d
    for i in range(1,n):
        F=F+1./np.abs(d-i*L)-1./np.abs(d+i*L)
    return F*ke
        

[r,f] = read_force(sys.argv[1])
print np.linalg.norm(1-f[:,2]/(f(r,20,200)))/len(r)

