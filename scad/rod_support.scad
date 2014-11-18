// -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-

/// \file rod_support.scad A rod support element with a cable holder on the left

use <../MCAD/nuts_and_bolts.scad>

/**
 * Mounting bolts for the rod supporting element with nuts.
 * This module can be used to visualise the screws and add them to
 * BOM, as well as to "drill" appropriate holes to mount the element.
 *
 * @param length Additional length of the screws required to hold
 * washers and the object the element is mounted at, e.g. some tin.
 *
 * @param side Choose whether to create the mounting for a left or
 * right-handed supporting element. Possible values: `left`, `right`.
 * Default value: `right`.
 *
 * @param bom Print the BOM information to the console. Possible
 * values: `true`, `false`. Default value: `true`.
 */
module rod_support_mounting (length = 0.0, side = "right", bom = true)
{
    side_trans = (side == "right") ? 0 : ((side == "left") ? 5 : 0);
    bolt_length = 5*ceil((14.75 + length + 1)/5);
    translate ([0, side_trans, 0])
        union ()
    {
        translate([-length, 24.95, 6.2025])
            rotate([0, 90, 0])
            boltHole(size=5, length=bolt_length, $fn=25);
        translate([10.750, 24.95, 6.2025])
            rotate([0, 90, 0])
            nutHole(5);
        translate([-length, 24.95, 20.2025])
            rotate([0, 90, 0])
            boltHole(size=5, length=bolt_length, $fn=25);
        translate([10.75, 24.95, 20.2025])
            rotate([0, 90, 0])
            nutHole(5);
    }
    if (bom) {
        echo("BOM: nut M5");
        echo("BOM: nut M5");
        echo(str("BOM: bolt M5x", bolt_length));
        echo(str("BOM: bolt M5x", bolt_length));
    }
}

/**
 * The rod supporting element with a handle.
 *
 * @param side The side on which the handle should be placed. The side
 * is determined by looking from the bottom. Possible values: `left`,
 * `right`. Default: `right`.
 *
 * Alternatively the module renders the first child (`child(0)`) as
 * the handle without any translations.
 */
module rod_support (side = "right")
{
    side_scale = (side == "right") ? 1 : ((side == "left") ? -1 : 0);
    side_trans = (side == "right") ? 0 : ((side == "left") ? 54.9 : 0);
    render ()
        difference ()
    {
        union()
        {
            // the rod holder
            translate ([0, side_trans, 0])
                scale ([1, side_scale, 1])

                linear_extrude (height=26.4, slices=1, convexity=5)
                union ()
            {
                hull()
                {
                    translate ([5, 5, 0])
                        circle(r=5, $fn=50);
                    translate ([9.7, 8.18, 0])
                        intersection()
                    {
                        translate ([0, 0, -1])
                            square([11, 11]);
                        circle(r=11, $fn=50);
                    }
                    translate([0, 18.18, 0]) square();
                    translate([19.7, 0, 0]) square();
                }

                hull() {
                    translate ([5, 49.9, 0])
                        circle(r=5, $fn=30);
                    translate ([9.7, 41.72, 0])
                        intersection()
                    {
                        translate([0, -11, -1])
                            square([11, 11]);
                        circle(r=11, $fn=50);
                    }
                    translate([0, 30.72, 0]) square();
                    translate([19.7, 53.9, 0]) square();
                }

                translate ([0, 15.95, 0]) square ([14.75, 18]);
            }
            if ($children == 1)
                child(0);
            else
            {
                if (side == "right")
                    translate ([20.2, 41.7, 0]) rod_support_handle ();
                if (side == "left")
                    translate ([20.2,  0.0, 0]) rod_support_handle ();
            }

        }

        // rod mounting holes
        translate ([0, side_trans, -1])
            scale ([1, side_scale, 1])
            linear_extrude(height=30, slices=1, convexity=5)
        {
            translate ([13.2, 8.2, 27.4])
                circle (r=4.2, $fn=24);
            translate ([13.2, 41.7, 27.4])
                circle (r=4.2, $fn=24);
            translate ([3.25, 17.5, 27.4])
                square ([3, 14.9]);
            translate ([3.25, 17.5, 27.4])
                rotate ([0, 0, -126])
                translate ([-2.2, 0, 0])
                square ([2.2, 15.03]);
            translate ([3.25, 32.4, 27.4])
                rotate ([0, 0, -54])
                square ([2.2, 15.03]);
        }

        // screw mounting holes
        scale ([1.001, 1, 1])
            rod_support_mounting(length=3, side = side, bom=false);
    }
}

/**
 * The default handle attached to rod support elements.
 */
module rod_support_handle()
{
    difference() {
        // the handle
        cube([35, 13.2, 3.5]);

        // handle holes
        translate ([0, 0, -1])
            linear_extrude(height=30, slices=1, convexity=5)
        {
            translate ([17.1, 6.6, 0])
                hull ()
            {
                circle (r=3.5, $fn=50);
                translate ([11.3, 0, 0])
                    circle (r=3.5, $fn=50);
            }
            translate ([7, 6.6, 0])
                circle(r=3.5, $fn=50);
        }
    }
}


/*
  Min X =  15.726203, Max X =  70.926201
  Min Y =  15.718233, Max Y =  70.618233
  Min Z =  5.825073, Max Z =  32.225075
*/
/* translate ([55.199998, 54.9, 0]) */
/*     rotate([0, 0, 180]) */
/*     translate ([-15.726203, -15.718233, -5.825073]) */
/*     import ("rod support p1 P-016.stl"); */

