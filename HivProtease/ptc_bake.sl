surface ptc_bake()
{
    normal Nf = faceforward( normalize(N), I );
    color rad = ( ambient() + diffuse(Nf) );

    bake3d( "baked_lighting.ptc", "", P, N,
        "coordsystem", "world",
        "_radiosoty", rad,
        "interpolate", 1) ;
    Ci = rad;
}
