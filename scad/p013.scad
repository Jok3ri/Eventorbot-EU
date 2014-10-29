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


/// file p013.scad Bed carriage, idler holder

include <../lib/bom.scad>
include <../lib/metric_fasteners.scad>
include <vitamins.scad>

module p013 ()
{
    render ()
        difference ()
    {
        union ()
        {
            cube ([84.00, 51.00, 7.00]);
            for (t = [11, 40])
                translate ([53, t, 6])
                {
                    cylinder (d=8, h=21);
                    cylinder (d=16, h=6);
                }
        }

        translate ([71.00, -1.00, -1.00])
            cube ([14.0, 4.00, 9.00]);

        translate ([77.5, 25.5, -1])
            cylinder (d=10, h=9, $fn=24);

        translate ([32, 25.5, 1.9])
            rotate ([180, 0, 0])
            nema17_mounting (7, false);

        translate ([32, 25.5, -1])
            cylinder (d=34, h=9, $fn=24);

        translate ([66.25, 25.5, -1])
            cylinder (d=3.5, h=9, $fn=24);

        for (t=[9.98, 41])
            translate ([47.52, t, 6.99])
                cylinder (d=6.5, h=25, $fn=16);
    }

    bom_fff ();
}

/*
============== Size ==============
Min X =  16.091822, Max X =  100.088898
Min Y =  1.158264,  Max Y =  52.158264
Min Z =  10.678481, Max Z =  37.678482
*/
//translate([-16.091822, -1.158264, -10.678481])
//import(file = "../original/bed carriage p2 P-013.stl");
