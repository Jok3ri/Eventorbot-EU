/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * Mounting bracket for NEMA17 motor
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

/** \file p005.scad Mounting bracket for NEMA17 motor. */

include <../lib/metric_fasteners.scad>
include <../lib/bom.scad>

/**
 * Mounting bracket for NEMA17 motor.
 */
module p005()
{
    render()
        difference ()
    {
	union()
        {
            difference()
            {
                cube([40.00, 49.20, 51.30]);
                translate([43.0443974630021144, -2, 0])
                    rotate([0, -37.27473995603108, 0])
                    cube([40, 55, 70]);
                translate ([4,3,4])
                    cube ([40, 43.2, 51]);
            }
            translate([13,49.20/2,2]) rotate([0,0,30]) cylinder(r=7, h=7, $fn=16);
            translate([31,49.20/2,2])	rotate([0,0,30]) cylinder(r=7, h=7, $fn=16);
        }

	translate([-2,49.20/2,30.2])
            rotate([0, 90, 0])
            union()
        {
            cylinder(r=11.5, h=10);
            translate([31/2, 31/2, 0])   cylinder(r=1.5, h=10, $fn=16);
            translate([31/2, -31/2, 0])  cylinder(r=1.5, h=10, $fn=16);
            translate([-31/2, 31/2, 0])  cylinder(r=1.5, h=10, $fn=16);
            translate([-31/2, -31/2, 0]) cylinder(r=1.5, h=10, $fn=16);
        }
	translate([13,49.20/2,4]) scale([1,1,1.2]) rotate([180, 0, 30]) hex_bolt(M5,20);
	translate([31,49.20/2,4]) scale([1,1,1.2]) rotate([180, 0, 30]) hex_bolt(M5,20);
    }

    bom_fff ();
}

p005 ();

/*
============== Size ==============
Min X =  20.559921, Max X =  60.559921
Min Y =  34.435806, Max Y =  83.635803
Min Z =   8.201880, Max Z =  59.501881
*/
//translate ([-20.559921, -34.435806, -8.201880])
//import (file = "../motor mount P-005.stl");
