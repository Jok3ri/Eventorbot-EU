/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
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

/// \file p021.scad Bed frame, part 2

include <config.scad>
include <../lib/metric_fasteners_tab.scad>
use <../lib/metric_fasteners.scad>
use <../lib/bom.scad>
use <p022.scad>


/**
 * The joint that connects two pieces of the bed frame.
 *
 * @param size Height of the joint element.
 *
 * @param carve Add two cubes to make the module suitable for use as a
 * positive mold.
 */
module p021_joint(size, carve = false)
{
    scale ([1,1,size/10])
        intersection ()
    {
        union ()
        {
            intersection ()
            {
                translate ([2.1,0,-8.4])
                    rotate ([0,0,45])
                    cylinder (r1=0,r2=7.212489168102785,h=20.4, $fn=4);
                translate ([0,-5.5,-8.4])
                    cube ([4.2,11,20.4]);
            }
            translate ([0,-2.1,-8.4])
                cube ([11,4.2,20.4]);
        }
        if (!carve)
            translate([-1,-5,0])cube([11,10,10]);
    }
}

/**
 * Bolts holding a bed (glass) and p021 part together.
 *
 * @param bom Print bom information.
 */
module p021_bed_mounting(bom = true)
{
    union ()
    {
        translate ([5, 5, -40])
            hex_bolt (M3,65);
        translate ([5, 5, 21.5 - hex_nut_thickness(M3)])
            rotate ([0,0,45])
            hex_nut(M3);

        translate ([5, 114.2, -40])
            hex_bolt (M3,65);
        translate ([5, 114.2, 21.5 - hex_nut_thickness(M3)])
            rotate ([0,0,30])
            hex_nut(M3);
    }
}

module p021()
{
    h = [21.5, 16.5];
    t = [0, 151];
    r = [32.1, 32.1 + Y_rod_distance];
    render ()
        difference ()
    {
        union ()
        {

            // Y (165.10 mm originaly)
            cube([10, 165, 21.5]);
            // X
            for (i = [0, 1])
                translate ([0, t[i], 0])
                    difference()
                {
                    cube ([143.5, 14, h[i]]);
                    translate ([10, 4, -1])
                        cube ([115.5,6,23.5]);
                }

            // end-stop pusher
            translate([4, 84.2, 0])
                union () {
                cube ([16, 7, 14.5]);
                translate ([0, 3.5, 14.5])
                    rotate ([0,90,0])
                    cylinder(d=7, h=16, $fn=24);
            }

            // belt holder
            difference(){
                translate([4,101.1,0])
                    cube ([16,20,21.5]);
                translate([4,101.1-1,6])
                    cube ([9,22,10]);
            }
        }

        // bolts for belt clamp
        translate ([21-7.5, 7+121.10, 21.5])
            rotate ([90,90,0])
            p022_mounting(21, false);

        // bolts for glass bed
        scale([1,1,1.001])
            p021_bed_mounting(false);

        // joints
        for (i = [0, 1])
            translate([135.40,7+t[i],0])
		p021_joint(h[i], true);

        // holes for rods
        for (t = r)
            translate ([-1, t, 12.5]) rotate ([0, 90, 0]) cylinder(d=8, h=12);
    }
    bom_fff();
}

/*
============== Size ==============
Min X =  11.240063, Max X =  154.740067
Min Y =  11.784284, Max Y =  176.884277
Min Z = -0.000000, Max Z =  21.500000
*/
//translate([-11.240063,-11.784284,0])
//import (file = "../original/bed p2 P-021.stl");
