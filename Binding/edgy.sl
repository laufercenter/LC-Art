surface edgy()
{
    normal Nn = normalize(N);
    vector In = normalize(I);

    color middle = color(1, 1.0, 1.0);
    color edge = color(0.5, 0.5, 0.5);

    float angle = pow(abs(Nn.In), 1);

    Ci = Cs;
    Oi = (1 - 1.0 * angle) * Os;
    Oi = Os;
    Ci = mix(edge, middle, angle) * Oi;
}


