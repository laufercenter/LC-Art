surface diffuse()
{
    normal Ns = faceforward( normalize(N), I );

    Ci = ( ambient() + diffuse(Ns) ) * Cs * Os;
    Oi = Os;
}
