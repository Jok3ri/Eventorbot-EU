/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * Bed carrige support
 * Copyright (C) 2014  Łukasz Stelmach
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/// \file p012.scad Bed carrige support

include <../lib/bom.scad>
include <../lib/metric_fasteners.scad>
include <vitamins.scad>
use <p013.scad>
use <p014.scad>
use <p015.scad>

/**
 * Screw set to mount p012(), p017() and p018() together.
 */
module p012_mounting (length = 0, bom = true)
{
    bolt_length = 5*ceil((15.0 + hex_nut_thickness(M5) + length + 1)/5);

    render (convexity = 6)
        translate ([51/2, 142, 13])
        for (t=[0,12])
            translate ([0, 0, t])
            {
                rotate ([0, 90, 90])
                {
                    hex_bolt (size=M5, length=bolt_length);
                    translate ([0, 0, 16+length]) hex_nut(M5);
		}

                if(bom) {
                    echo (str ("BOM: nut M5"));
                    echo (str ("BOM: bolt M5x", bolt_length));
                }
            }
}

module p012 ()
{
    difference()
    {
        union()
        {
            cube ([ 51.00, 146.00, 50.00 ]);
            translate ([(51/2)-(19.60/2),145,0])
                difference ()
            {
                cube ([19.60, 12.50, 38.00]);
                translate ([0, 12.50, 0])
                    rotate ([3.75, 0, 0])
                    translate ([-1, 0, -1])
                    cube (40);
            }
        }

        translate ([4, -4, 2])
            cube ([43.00, 146.00, 50.00]);

        translate ([-1, 0, 2])
            rotate ([-62.45, 0, 0])
            translate ([0, -110, -1])
            cube (110);

        translate ([0, -0.5, 0])
            p012_mounting (bom=false);

        translate ([51, 0, 0])
            rotate ([-90, 0, 90])
            p014_mounting (length=3, $fn=24);

        translate ([25.5, 68.5, 1])
            cylinder (d=10, h=4, center=true, $fn=24);

        translate ([2, 74.30, 16])
            rotate ([0, 90, 0])
            cylinder (d=8.6, h=6, center=true, $fn=24);

        translate ([51, 146, 0])
            rotate ([180, 0, -90])
            union()
        {
            translate ([71, 0, 27])
                rotate ([-90, 0, 90])
                p015_mounting (9);

            translate ([32, 25.5, 1.9-6])
                rotate ([180, 0, 0])
                nema17_mounting (7+2+4, false);

            translate ([32, 25.5, -4])
                cylinder (d=34, h=9);
        }
    }

    bom_fff ();
}

/*
============== Size ==============
Min X =  18.850830, Max X =  69.850830,  Width  =  51.0
Min Y =  10.201502, Max Y =  167.701508, Depth  = 157.5
Min Z =  3.587328, Max Z =  53.587330,   Height =  48.0
*/
//translate([-18.850830, -10.201502, -3.587328])import("../original/bed\ carriage\ p1\ P-012.stl");
