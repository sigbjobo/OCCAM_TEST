import sys



lines=open(sys.argv[1]).readlines()
alpha=sys.argv[2]
sigma=sys.argv[3]


#NA
for i in range(len(lines)):
    l=lines[i].split()
    if(l[0]=='alpha:'):
        lines[i+1]='%s'%(alpha)
    if(l[0]=='sigma:'):
        lines[i+1]='%s'%(sigma)
    

fp=open(sys.argv[1],'w')
for li in lines:
    l=li.split()
    fp.write('%s\n'%(' '.join(l)))

fp.close()
