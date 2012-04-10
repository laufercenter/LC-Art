surface smutz()
{
    normal Ns = faceforward( normalize(N), I);
    color direct = ambient() + diffuse(Ns);
    float dist = sqrt( s*s + t*t );
    Oi = Os * (1 - 2 * clamp(dist, 0, 0.500) );
    Ci = Cs * direct * Oi;
}
