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

/// file p020.scad Bed frame, part 1

include <config.scad>
use <../lib/bom.scad>
use <p021.scad>
use <p022.scad>

module p020()
{
    h = [16.5, 21.5];
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
                    cube ([135.4, 14, h[i]]);
                    translate ([10, 4, -1])
                        cube ([115.5,6,23.5]);
                }

            // end-stop pusher
            translate([4, 165-7-84.2, 0])
                union () {
                cube ([16, 7, 14.5]);
                translate ([0, 3.5, 14.5])
                    rotate ([0,90,0])
                    cylinder(d=7, h=16, $fn=24);
            }

            // belt holder
            difference(){
                translate([4,165-20-101.1,0])
                    cube ([16,20,21.5]);
                translate([4,165-20-101.1-1,6])
                    cube ([9,22,10]);
            }

            // joints
            for (i = [0, 1])
                translate([143.5,7+t[i],0])
                    rotate([0,0,180])
                    p021_joint(h[i], false);

            // rod holders
            for (t = r)
                translate ([4,165-t-9,0])
                {
                    cube([16,18,21.5-9]);
                    translate([0,9,21.5-9])
                        rotate([0,90,0])
                        cylinder(d=18,h=16);
                }
        }

        // bolts for belt clamp
        translate ([20, 165-7-121.10, 21.5])
            rotate ([90,90,180])
            p022_mounting(21, false);

        // bolts for glass bed
        translate ([0,165,0])
            scale([1,-1,1.001])
            p021_bed_mounting(false);

        // holes for rods
        for (t = r)
            translate ([10, 165-t, 12.5]) rotate ([0, 90, 0]) cylinder(d=8, h=12);
    }
    bom_fff();
}

/*
============== Size ==============
Min X =  9.562551, Max X =  153.062546
Min Y =  15.970103, Max Y =  181.070099
Min Z =  3.515523, Max Z =  25.015522
*/
//translate([-9.562551,-15.970103,-3.515523])
//import (file = "../original/bed p1 P-020.stl");
