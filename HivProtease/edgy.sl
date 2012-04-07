surface edgy()
{
    normal Nn = normalize(N);
    vector In = normalize(I);

    color middle = color(1, 1.0, 1.0);
    color edge = Cs;

    float angle = pow(abs(Nn.In), 1);

    Ci = Cs;
    Oi = (1 - 1.0 * angle) * Os;
    Ci = mix(edge, middle, angle) * Oi;
}


