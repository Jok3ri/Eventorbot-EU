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

use <../MCAD/nuts_and_bolts.scad>
/**
 * Screw set to mount p012(), p017() and p018() together.
 */

module bed_carrige_to_z_axis_mounting (length = 0, bom = true)
{
    bolt_length = 5*ceil((30.0 + length + 1)/5);
    for (t=[0,12])
        translate([0, 0, t]) {
            rotate([0, 90, 0])
                boltHole(size=5, length=bolt_length, $fn=20);
            translate ([31, 0, 0])
                rotate ([0, 90, 0]) nutHole(5);
            if(bom) {
                echo (str ("BOM: nut M5"));
                echo (str ("BOM: bolt M5x", bolt_length));
            }
        }
}

/*
============== Size ==============
Min X =  18.850830, Max X =  69.850830,  Width  =  51.0
Min Y =  10.201502, Max Y =  167.701508, Depth  = 157.5
Min Z =  3.587328, Max Z =  53.587330,   Height =  48.0
*/
translate([-18.850830, -10.201502, -3.587328])
import("../original/bed\ carriage\ p1\ P-012.stl");
