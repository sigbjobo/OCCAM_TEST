import numpy as np
import matplotlib.pylab as plt
import sys
a=np.loadtxt(sys.argv[1])
print a
alpha=a[0::2]
error=a[1::2]
plt.plot(alpha,error*100)

plt.show()
