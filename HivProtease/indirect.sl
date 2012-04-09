surface indirect(float Kd = 1, samples = 256)
    {
      normal Ns = faceforward( normalize(N), I );

      color direct = diffuse(Ns) + 0 * ambient();

      float occlusion;
      color indirect = indirectdiffuse(P, Ns, 0, 
        "occlusion", occlusion,
        "filename", "baked_lighting.ptc",
        "pointbased", 1,
        "maxsolidangle", 0.5,
        "clamp", 1,
        "sortbleeding", 1,
        "maxdist", 0.15);

      // Set Ci and Oi
      Ci = (0.45 * (1 - occlusion) + indirect + direct) * Cs * Os;
      Oi = Os;
}
