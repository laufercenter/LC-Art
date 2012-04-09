#!/usr/bin/env python

from random import uniform, gauss

of = open('particles.rib', 'w')

for i in range(1000000):

    x = uniform(-3.8, 1.5)
    y = uniform(-.8, 2.5)
    z = uniform(-7, 1)

    x_rot = gauss(-1, 1)
    y_rot = gauss(-1, 1)
    z_rot = gauss(-1, 1)
    angle = uniform(0, 360)
    scale = gauss(0.003, 0.0015)

    print >>of, 'TransformBegin'
    print >>of, '   Translate %f %f %f' % (x, y, z)
    print >>of, '   Rotate %f %f %f %f' % (angle, x_rot, y_rot, z_rot)
    print >>of, '   Scale %f %f %f' % (scale, scale, scale)
    print >>of, '   Polygon "P" [-0.5 0.5 0  0.5 0.5 0  0.5 -0.5 0  -0.5 -0.5 0]'
    print >>of, 'TransformEnd'


