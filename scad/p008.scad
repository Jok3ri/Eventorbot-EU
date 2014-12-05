/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * P008 - X carriage, timing belt clamp
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

include <../lib/metric_fasteners.scad>
include <../lib/bom.scad>

module p008 () {
    difference ()
    {
	union ()
	{
            for (i = [0:1])
                translate ([38*i, 1, 0])
                    mirror ([i, 0, 0])
                    rotate ([-90, 0, 0])
                    difference ()
                {
                    linear_extrude (height = 31)
                        hull ()
                    {
                        translate ([12, -5])
                            circle (r = 5, $fn = 25);
                        translate ([ 0, -5])
                            square ([12, 5]);
                        translate ([12, -17])
                            square ([5, 12]);
                    }
                    translate ([-3, -20, -1])
                        cube ([15, 15, 33]);
                    translate ([11, -20, -1])
                        cube ([7, 15, 7]);
                }
            cube ([38, 4, 24]);
        }
        p008_mounting(1, bom = false);
        translate ([11.5, 12.5, 11.0])
            rotate ([0, 90, 0])
            scale([1, 1, 1.1])
            p008_belt_clamping();
    }

    bom_fff ();
}

module p008_belt_clamping(length=0, bom=true){
    bolt_length = 5 * ceil((14 + hex_nut_thickness(M5) + length)/5);

    render (convexity = 4)
        for (i = [0:1])
            translate([0, 14*i, 0])
            {
                hex_bolt (M5, bolt_length);
                translate ([0, 0, 14])
                    hex_nut(M5);
            }

}

module p008_mounting(length=0, bom=true) {
    bolt_length = 5 * ceil((2 + hex_nut_thickness(M5) + length)/5);


    translate ([8, 0, 11])
        rotate ([-90, 0, 0])
    for (i=[0, 1])
	translate([22*i, 0, 0])
            render(convexity=4)
	{
            rotate([0,0,30])translate([0,0,2])hex_nut(M5);
            translate([0, 0, -length])hex_bolt(M5,bolt_length);
        }
    if (bom) {
	echo (str ("BOM: bolt M5x", bolt_length));
	echo (str ("BOM: bolt M5x", bolt_length));
	echo (str ("BOM: nut M5"));
	echo (str ("BOM: nut M5"));
    }
}

p008 ();

/*
============== Size ==============
Min X =  10.501077, Max X =  48.501076
Min Y =  8.978251, Max Y =  32.578251
Min Z =  6.378078, Max Z =  38.378078
*/
//rotate([-90,0,0])
//translate([-10.501077, -8.978251-23.6, -6.378078])
//import(file = "../original/x carriage part 2 P-008.stl");
