surface indirect(float Ks = 0.7, Kd=0.6, Ka=.1, roughness=0.04)
{
    normal Ns = faceforward( normalize(N), I );
    vector V = normalize(-I);

    uniform string raytype = "unknown";
    rayinfo("type", raytype);

    if( raytype == "subsurface" )
    {
        Ci = ( Ka * ambient() + Kd * diffuse(Ns) ) * Cs;
    } else
    {
        Ci = subsurface(P) + Ks * specular(Ns, V, roughness);
    }
}
