#!/usr/bin/env python

import sys



def group(iterator, count):
    itr = iter(iterator)
    while True:
        yield tuple([itr.next() for i in range(count)])



def convert_xy_to_st(x, y):
    s = (x + 11.) / 22.
    t = (y + 11.) / 22.
    return s,t



input_file = sys.argv[1]

lines = open(input_file).read().splitlines()

print lines[0]
print lines[1]
print lines[2]

cols = lines[2].split()
cols[1] = cols[1][1:]
cols[-1] = cols[-1][:-1]
print '     "st"    [',

for x,y,z in group(cols[1:], 3):
    s,t = convert_xy_to_st( float(x), float(y) )
    print '%f %f ' % (s, t),
print ']'

print lines[3]

