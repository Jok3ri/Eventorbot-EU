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

use <../lib/bom.scad>
include <config.scad>

include <vitamins.scad>
use <p007.scad>
use <p008.scad>
use <p016.scad>
use <p017.scad>
use <p023.scad>

/// \file x_axis.scad X axis assembly.

module xz_rails ()
{
    rod_dia = 8;
    rod_len = 10.5 * 25.4;

    assembly();
    translate ([26.4, -24.95, 0])
        rotate ([0, -90, 0])
        union ()
    {
        color (clamp_color)
            p016();
        color (bolt_color)
            p016_mounting(length=2);
    }
    translate ([rod_len - 26.4, 54.9 - 24.95, 0])
	rotate ([0, -90, 180])
        union ()
    {
        color (clamp_color)
            p017();
        color (bolt_color)
            p017_mounting(length=2);
    }
    // rods
    translate([0,0,13.2])
        for(i=[-0.5:0.5])
            translate([0, X_rod_distance * i, 0])
                rotate([0, 90, 0]) rod(rod_dia, rod_len);

   end ();
}


module x_axis ()
{
    xz_rails ();

    // X carriage position x: <26.4, 218.7>
    translate ([26.4+165.9, 8.2, 13.2])
        rotate ([0, 90, 0])
        x_carriage()
        end();
}

module x_carriage ()
{
    assembly();

    translate ([-17.5, -11, 0])
        color (x_carriage_color)
        render ()
        p007 ();

    for (i=[0,1])
        translate ([0, X_rod_distance * i, 0])
            for (i=[0,1])
                translate ([0, 0, 24*i])
                    linear_bearing (LM08UU);

    translate ([-11,27.5,5])
        rotate ([90, -90,0])
        union ()
    {
        color (x_carriage_color)
            render ()
            p008 ();
        color (bolt_color)
            p008_mounting (length = 31);
    }
    end();
}

x_axis();
