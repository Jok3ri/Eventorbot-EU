/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * Z-axis carrige
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

/// \file p018.scad Z-axis carrige
use <../MCAD/nuts_and_bolts.scad>
use <p012.scad>
/**
 * Z axis carrige holding linear bearings
 */
module p018()
{
    $fn = 48;
    render ()
        difference ()
    {
        union ()
        {
            linear_extrude(height=48,convexity=5) {
                hull()
                {
                    translate([ 3.5,  3.5]) circle(r=3.5);
                    translate([21.0,  0.0]) square();
                    translate([21.0, 18.0]) square();
                    translate([ 0.0, 21.0]) square();
                }

                hull()
                {
                    translate ([ 3.5, 52.0]) circle (r=3.5);
                    translate ([21.0, 54.5]) square ();
                    translate ([21.0, 36.5]) square ();
                    translate ([ 0.0, 33.5]) square ();
                }
                translate ([0, 20, 0]) square ([14.2, 15.5]);
            }
            translate ([22, 47.5, 0]) cube ([6.5, 8, 3]);
        }
        // A notch for the bed carrige (p012)
        translate([2.5, 17.75, 5])difference () {
            rotate ([0, -3.75, 0]) translate ([-3,0]) cube([3, 20, 45]);
            translate([0,0,-25])cube(50, center=true);
        }
        // Linear bearing holder
        translate([11,11,-1]) {
            cylinder(h=50, r1=7.5, r2=7.5);
            translate([0,55.5-22]) cylinder(h=50, r1=7.5, r2=7.5);
            translate([-0.7, 7]) cube([1.4, 20,50]);
        }
	//mounting holes
	translate([-13.10, 27.75, 18]) bed_carrige_to_z_axis_mounting(bom=false);

    }
}

/*
============== Size ==============
Min X =  19.087856, Max X =  47.587856, Width  = 28.5
Min Y =  9.828491, Max Y =  65.328491,  Depth  = 55.5
Min Z = -0.000000, Max Z =  48.000000,  Height = 48.0
*/
//translate ([19.087856+28.5, 9.828491+55.5, 0])
//rotate ([0,0,180])
//import("../z carriage P1-018.stl");
