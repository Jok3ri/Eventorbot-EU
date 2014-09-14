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

include <../lib/metric_fasteners.scad>
use <p008.scad>

/// \file p007.scad X carriage

module p007 ()
{
    difference ()
    {
        union ()
        {
            linear_extrude (48)
                hull ()
            {
                for (i = [0:1])
                    translate ([0, 50.5*i])
                    {
                        translate ([6.50, 0.00])
                            square (5);
                        translate ([26, 2.5])
                            circle (d=5, $fn=24);
                    }
            }
            translate ([ 27.50, 17.75, 5.00 ])
                cube ([ 8, 20, 38]);
            translate ([ 0.00, 47.60, -0.00 ])
                cube ([ 7.50,  7.90,  3.00]);
        }

        translate([17.5, 11.0, -1])
            render(convexity = 6)
            linear_extrude(50)
        {
            for(i=[0:1])
                translate([0, 33.5*i])
                    circle(d = 15, $fn = 24);
            translate([-0.7, 0])
                square([1.4, 33.5]);
        }

        translate ([34.5, 27.75, 35])
            rotate ([0, 90, 0])
            p008_mounting (29, false);
    }
}

/*
============== Size ==============
Min X =  20.735315, Max X =  56.235313
Min Y =  57.056049, Max Y =  112.556053
Min Z =  15.156099, Max Z =  63.156101
*/
//translate ([-20.735315,-57.056049,-15.156099])
//import (file = "../original/x carriage P-007.stl");
