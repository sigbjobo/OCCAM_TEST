import sys



lines=open(sys.argv[1]).readlines()
m=float(sys.argv[2])
lines[-7]='%d %d %d'%(m,m,m)

fp=open(sys.argv[1],'w')
for li in lines:
    l=li.split()
    fp.write('%s\n'%(' '.join(l)))

fp.close()
