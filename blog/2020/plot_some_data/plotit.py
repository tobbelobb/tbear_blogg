import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pylab

#F = pylab.gcf()
F, ax = plt.subplots()
DPI = F.get_dpi()
print("DPI:", DPI)
DefaultSize = F.get_size_inches()
print("Default size in Inches", DefaultSize)
print("Which should result in a %i x %i Image"%(DPI*DefaultSize[0], DPI*DefaultSize[1]))
F.set_size_inches( (DefaultSize[0]*5.0/DefaultSize[0], DefaultSize[1]*5.0/DefaultSize[0]) )
Size = F.get_size_inches()
print("Size in Inches", Size)
print("Which should result in a %i x %i Image"%(DPI*Size[0], DPI*Size[1]))

res = np.array([2560,
                5120,
                10240])

center_err = np.array([4.1,
                       2.0,
                       0.6])

edge_err = np.array([10.8,
                      8.2,
                      7.1])

ax.plot(res, center_err)
#plt.annotate('center marker', (5120, 2.1))
ax.plot(res, edge_err)
#plt.annotate('edge marker', (5120, 9.4))
ax.set(xlabel='image resolution', ylabel='error [mm]')
#plt.semilogy()

plt.annotate('center marker', (5120, 2.1))
plt.annotate('edge marker', (5120, 9.4))

F.savefig("linear_errs.png")
plt.show()
