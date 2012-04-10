/******************************************************************************/
/*                                                                            */
/*    Copyright (c)The 3Delight Team.                                         */
/*    All Rights Reserved.                                                    */
/*                                                                            */
/******************************************************************************/

light
jm_spot(
        float intensity = 1;
        color lightcolor = 1;
        uniform string shadowmap = "";
        uniform float blur = 0;
        point from = point "shader" (0,0,0);
        point to = point "shader" (0,0,1);
        float coneangle = radians(30);
        float conedeltaangle = radians(5);
        float beamdistribution = 2;
        float decay = 2.0; 
        float __nondiffuse = 0, __nonspecular = 0;
        string __category = "";
        float samples = 1)
{
        uniform vector A = (to - from) / length(to - from);

        illuminate( from, A, coneangle ) 
        {
                color shad = shadow( shadowmap, Ps, "blur", blur, "samples", samples );

                float distance_squared = L.L;
                float distance = sqrt( distance_squared );

                float cosangle = L.A / distance;

                float atten = pow(cosangle, beamdistribution);
                
                if( decay == 0.0 )
                        /* do nothing */ ;
                else if( decay == 2.0 )
                        atten /= distance_squared;
                else if( decay == 1.0 )
                        atten /= distance;
                else
                        atten /= pow(distance, decay);

                atten *=
                        smoothstep( cos(coneangle),
                                cos(coneangle - conedeltaangle), cosangle );

                Cl = atten * (1-shad) * intensity * lightcolor;
        }
}

