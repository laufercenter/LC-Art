surface xray(
    color inner_glow = color(1,1,1);
    color outer_glow = color(0,0,0);
    float rim_width=0.1)
{
    normal n = normalize(N);
    normal nf = faceforward(n, I, n);

    vector i = normalize(-I);
    float angle = pow(i.nf, 0.5);
    color rim = mix( color(0.1, 0.1, 1), color(0.9, 0.9, 1), angle);
    Ci = rim;
}


