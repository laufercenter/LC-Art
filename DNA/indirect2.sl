surface indirect2(float Ka = 0.8, Kd = 1, Ks = 0.3, roughness = 0.1;)
{
  normal Ns = faceforward( normalize(N), I );
  vector V = normalize(-I);

  float occ = occlusion(P, Ns, 256);

  Ci = ( Ka * (1 - occ) + ambient() + Kd * diffuse(Ns) + Ks * specular(Ns, V, roughness)) * Cs;
}
