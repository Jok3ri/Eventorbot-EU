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

/// file p015.scad Bed carriage, idler cap

module p015 ()
{
    difference ()
    {
        cube ([ 51.00, 20.00, 25.00 ]);
        translate ([ 25.5, -1.00, 4.75 ])
            rotate ([-90, 0, 0])
            cylinder (d=3.5, h=22, $fn=24);
        translate ([ 11, -1.00, 18 ])
            rotate([-90, 0, 0])
            cylinder(d=8, h=22, $fn=24);
        translate ([ 40, -1.00, 18 ])
            rotate ([-90, 0, 0])
            cylinder (d=8, h=22, $fn=24);
        difference(){
            translate ([-1, 5, 3.5])
                cube ([ 53.00, 10.00, 25.00 ]);
            intersection ()
            {
                translate ([ 21.25, 3, 1 ])
                    cube ([ 8.5, 14.00, 10 ]);
                translate ([ 25.5, 4, 1])
                    rotate ([0, 45, 0])
                    translate ([-6, 0, -6])
                    cube (12);
            }

        }
        translate ([ -1.00, 14.00, 9 ])
            cube ([ 21.50, 7.00, 10 ]);
        translate ([ 30.50, 14.00, 9 ])
            cube ([ 21.50, 7.00, 10 ]);
        translate ([ -1.00, 14.00, 18 ])
            cube([ 53.0, 7.00, 10 ]);
    }
}

/*
============== Size ==============
Min X =  6.452737, Max X =  57.450367
Min Y =  27.237885, Max Y =  47.237885
Min Z =  6.799819, Max Z =  31.800112
*/
//translate([-6.452737,-27.237885,-6.799819])
//import (file = "../original/bed carriage p2 P-015.stl");
