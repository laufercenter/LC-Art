#!/usr/bin/env python


import cStringIO

ifile = open('protein.rib')
ofile = open('protein_base_layer.rib', 'w')

non_intersected = cStringIO.StringIO()
intersected = cStringIO.StringIO()

lines = ifile.read().splitlines()

n_lines = len(lines)
n_atoms = n_lines / 4

assert not (n_lines % 4), 'The number of lines should be a multiple of 4.'


#print >>intersected, 'SolidBegin "intersection"'
#print >>intersected, '    SolidBegin "primitive"'
#print >>intersected, '        TransformBegin'
#print >>intersected, '            Scale 10 10 1 Translate -0.5 -0.5 -0.65'
#print >>intersected, '            Polygon "P" [ 0 0 0  0 0 1  0 1 1  0 1 0 ]   # left side'
#print >>intersected, '            Polygon "P" [ 1 1 0  1 1 1  1 0 1  1 0 0 ]   # right side'
#print >>intersected, '            Polygon "P" [ 0 1 0  1 1 0  1 0 0  0 0 0 ]   # front side'
#print >>intersected, '            Polygon "P" [ 0 0 1  1 0 1  1 1 1  0 1 1 ]   # back side'
#print >>intersected, '            Polygon "P" [ 0 1 1  1 1 1  1 1 0  0 1 0 ]   # top'
#print >>intersected, '            Polygon "P" [ 0 0 0  1 0 0  1 0 1  0 0 1 ]   # bottom'
#print >>intersected, '        TransformEnd'
#print >>intersected, '    SolidEnd'
#print >>intersected, '    SolidBegin "union"'

for atom_ind in range(n_atoms):
    TransformBegin = lines[4*atom_ind]
    Translate = lines[4*atom_ind + 1]
    Sphere = lines[4*atom_ind + 2]
    TransformEnd = lines[4*atom_ind + 3]

    cols = lines[4*atom_ind + 1].split()
    z = float( cols[3] )
    if z < .63:
        if z > -10.30:
            #print >>intersected, 'SolidBegin "primitive"'
            print >>intersected, TransformBegin
            print >>intersected, Translate
            print >>intersected, Sphere
            print >>intersected, TransformEnd
            #print >>intersected, 'SolidEnd'
        else:
            print >>non_intersected, TransformBegin
            print >>non_intersected, Translate
            print >>non_intersected, Sphere
            print >>non_intersected, TransformEnd

#print >>intersected, 'SolidEnd'
#print >>intersected, 'SolidEnd'

ofile.write( intersected.getvalue() )
ofile.write( non_intersected.getvalue() )
