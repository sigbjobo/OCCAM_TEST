import sys
import numpy as np
L=20.


lines=open(sys.argv[1]).readlines()
dz=float(sys.argv[2])
b=L/float(sys.argv[3])

#change start
r0x=(int(0.5*L//b)+0.5)*b+ np.random.rand()
r0y=(int(0.5*L//b)+0.5)*b + np.random.rand()
r0z=(int(0.5*L//b))*b +np.random.rand()
# r0x=(int(0.5*float(sys.argv[3]))+0.5)*b+0.000001
# r0y=(int(0.5*float(sys.argv[3]))+0.5)*b+0.000001
# int(L//b)*b
# r0z=(int(0.5*float(sys.argv[3]))+0.5)*b+0.000001
#r0x=(int(0.5*float(sys.argv[3])/3.)+0.5)*b+0.000001
#r0y=(int(0.5*float(sys.argv[3])/3.)+0.5)*b+0.000001
#r0z=(int(0.5*float(sys.argv[3]))+0.5)*b+0.000001
#NA

l=lines[7].split()
l[4]= "%f" % (r0x) 
l[5]= "%f" % (r0y) 
l[6]= "%f" % (r0z-0.5*dz) 
lines[7]=' '.join(l)


#CL
l=lines[10].split()
l[4]= "%f" % (r0x) 
l[5]= "%f" % (r0y) 
l[6]= "%f" % (r0z+0.5*dz)

lines[10]=' '.join(l)

fp=open(sys.argv[1],'w')
for li in lines:
    l=li.split()
    fp.write('%s\n'%(' '.join(l)))

fp.close()
