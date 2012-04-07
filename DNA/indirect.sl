surface indirect()
{
    normal Ns = faceforward( normalize(N), I );
    vector V = normalize(-I);

    float occ = occlusion(P, Ns, 128);

    Ci = ( 1.0 * (1 - occ) + ambient() + diffuse(Ns) ) * Cs;
}
