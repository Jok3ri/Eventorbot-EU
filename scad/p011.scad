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

/// file p011.scad Spool holder

use <../lib/bom.scad>

module p011_a ()
{
    dia1=38.10;
    dia2=dia1-10;
    difference ()
    {
        translate ([0, 0, 0]) cylinder(d=dia1, h=83.2, $fn=24);
        translate ([0, 0, 7]) cylinder(d=dia2, h=80, $fn=24);
        translate ([-1 - dia1/2,-1-dia1/2,7])
            cube ([dia1+2, 1+dia1/2 , 80]);
        // TODO: create p011_a_mounting()
        translate ([0,7.05 - dia1/2,-1]) cylinder(d=5, h=9, $fn=24);
        translate ([0,26.05 - dia1/2,-1]) cylinder(d=5, h=9, $fn=24);
    }
    bom_fff();
}

module p011_b ()
{
    dia1 = 48.10;
    dia2 = 38.10;
    dia3 = dia2 - 10;

    difference ()
    {
        cylinder (d=dia1, h=5, $fn=24);

        translate ([0, 0, 3])
            difference ()
        {
            cylinder (d=dia2, h=10, $fn=24);
            translate ([0, 0, -1])
                cylinder (d=dia3, h=12, $fn=24);
        }
        translate ([0, -30, 0])
            cube (60,center=true);
    }
    bom_fff();
}

module p011 ()
{
    p011_a();
    translate ([48.10/2 + 38.10/2 - 4, -38.10/2, 0])
        p011_b();
}

/*
============== Size ==============
Min X =  14.660253, Max X =  52.760254
Min Y =  5.165156, Max Y =  43.265156
Min Z =  0.000000, Max Z =  83.199997
*/
//translate([-14.660253, -5.165156, 0])
//import("../original/spool holder P-011.stl");

/*
============== Size ==============
Min X =  7.213617, Max X =  55.313618
Min Y =  8.860742, Max Y =  32.910740
Min Z =  7.100000, Max Z =  12.100000
*/
//translate([30.886384, -8.860742, -7.100000])
//import("../original/spool holder 2 P-011.stl");
