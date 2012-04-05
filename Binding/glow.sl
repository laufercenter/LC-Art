surface glow(
    color inner_glow = color(1,1,1);
    color outer_glow = color(0,0,0);
    float power = 1;
    float opac_scale = 1.0;
    float min_opc = 0.5)
{
    normal Nn = normalize(N);
    vector In = normalize(I);

    float angle = pow(abs(Nn.In), power);

    Oi = opac_scale * (1 - min_opc * angle) * Os;
    Ci = mix(outer_glow, inner_glow, angle) * Oi;
}


