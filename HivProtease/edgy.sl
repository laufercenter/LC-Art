surface edgy()
{
    normal Nn = normalize(N);
    vector In = normalize(I);

    color middle = color(1, 1.0, 0.6);
    color edge = color(1.0, 0.7, 0.2);

    float angle = pow(abs(Nn.In), 1);

    Ci = mix(edge, middle, angle);
    Oi = (1 - 0.5 * angle) * Os;
}


