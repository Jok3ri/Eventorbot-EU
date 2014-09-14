// -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-

/// \file p023.scad The clamp to hold the rods under the bed

use <../MCAD/nuts_and_bolts.scad>

/** The nut and the bolt to mount the clamp on the rod
 *
 * @param bom print the BOM information to the console. Possible
 * values: `true`, `false`. Default value: `false`.
 */
module p023_mounting (bom=false)
{
    bolt_length=20;
    bolt_size=3;

    translate ([0, 6.5, 5])
    {
        translate ([-6.4, 0, 0])
            rotate ([0, -90, 0])
            nutHole (size=bolt_size);
        translate ([8.8, 0, 0])
            rotate ([0, -90, 0])
            boltHole (size=bolt_size, length=bolt_length, $fn=25);
    }

    if (bom)
    {
        echo (str ("BOM: nut M", bolt_size));
        echo (str ("BOM: bolt M", bolt_size, "x", bolt_length));
    }
}

/** The clamp holding the rods under the bed
 *
 * @param bom print the BOM information to the console. Possible
 * values: `true`, `false`. Default value: `false`.
 */
module p023 ()
{
    difference ()
    {
        linear_extrude (height=10, convexity=5)
        {
            translate ([-8.8,0,2.02])
                square ([17.6, 11.5]);
            translate ([0,0,1.01])
                circle (r=8.8,center=true, $fn=25);
        }

        translate ([0, 0, -1])
            linear_extrude (height=12, convexity=5)
        {
            translate ([0, 0, 0])
                circle (r=4.1,$fn=25);
            translate ([-2, 0, 0])
                square ([4, 12]);
        }

        scale([1.001, 1, 1]) p023_mounting(bom=true);
    }
    bom_fff();
}

/*
============== Size ==============
Min X =  2.392153, Max X =  19.992153
Min Y =  2.273297, Max Y =  22.773298
Min Z =  2.600000, Max Z =  12.600000
*/
//translate([-2.392153-8.8, -2.273297-9, -2.600000])
//import("../original/bed A p2 P-023.stl");
