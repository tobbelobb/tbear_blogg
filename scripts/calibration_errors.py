#!/usr/bin/python3

#from __future__ import division # Always want 3/2 = 1.5
import numpy as np
import matplotlib
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider, Button, RadioButtons
plt.clf()
plt.gca().set_aspect('equal', adjustable='box')
first = True

B = np.array([-700., 700.])  # The actual position of the anchor B
e = np.array([50., 50.])        # The error we made when measuring out B

def lerror(P, B, e):
    return (np.linalg.norm(P-(B+e)) - np.linalg.norm(P-B)) - (np.linalg.norm(np.array([0,0])-(B+e)) - np.linalg.norm(np.array([0,0])-B))

pts_axis = 100
linspace_max = 1000
color_levels = 20
X, Y = np.meshgrid(np.linspace(-linspace_max, linspace_max, pts_axis), np.linspace(linspace_max, -linspace_max, pts_axis))
Z = np.zeros_like(X)

for i in np.arange(0, np.shape(X)[0]):
    for j in np.arange(0, np.shape(X)[1]):
        Z[i][j] = lerror(np.array([X[i][j], Y[i][j]]), B, e)

#axis_color = 'lightgoldenrodyellow'
# Add two sliders for tweaking the parameters
# Define an axes area and draw a slider in it

fig = plt.figure(1)
ax = fig.add_subplot(111)
fig.subplots_adjust(left=0., bottom=0.17, top=0.96, right=0.83)

plt.arrow(B[0], B[1], e[0], e[1], width=20., head_width=35.0, head_length=25.0, fc='k', ec='k', length_includes_head=True)
ex_slider_ax  = fig.add_axes([0.1, 0.1, 0.8, 0.03])
ex_slider = Slider(ex_slider_ax, 'Error X', -100., 100.0, valinit=e[0])
ey_slider_ax  = fig.add_axes([0.1, 0.05, 0.8, 0.03])
ey_slider = Slider(ey_slider_ax, 'Error Y', -100., 100.0, valinit=e[0])

def update(val):
    global first, ex_slider2, ey_slider2
    fig.clear()
    plt.gca().set_aspect('equal', adjustable='box')
    if first:
        e[0] = ex_slider.val
        first = False
        e[1] = ey_slider.val
    else:
        e[0] = ex_slider2.val
        e[1] = ey_slider2.val

    ax = fig.add_subplot(111)

    plt.arrow(B[0], B[1], e[0], e[1], width=20., head_width=35.0, head_length=25.0, fc='k', ec='k', length_includes_head=True)
    ex_slider_ax  = fig.add_axes([0.1, 0.1, 0.8, 0.03])
    ex_slider2 = Slider(ex_slider_ax, 'Error X', -100., 100.0, valinit=e[0])
    ex_slider2.on_changed(update)
    ey_slider_ax  = fig.add_axes([0.1, 0.05, 0.8, 0.03])
    ey_slider2 = Slider(ey_slider_ax, 'Error Y', -100., 100.0, valinit=e[1])
    ey_slider2.on_changed(update)

    for i in np.arange(0, np.shape(X)[0]):
        for j in np.arange(0, np.shape(X)[1]):
            Z[i][j] = lerror(np.array([X[i][j], Y[i][j]]), B, e)

    CS = ax.contourf(X, Y, Z, color_levels) # returns a QuadContourSet object
    CB = fig.colorbar(CS, ax=ax)
    plt.show()

ex_slider.on_changed(update)
ey_slider.on_changed(update)

CS = ax.contourf(X, Y, Z, color_levels) # returns a QuadContourSet object
CB = fig.colorbar(CS, ax=ax)

plt.show()
