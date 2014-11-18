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
include <../lib/metric_fasteners.scad>
include <../MCAD/stepper.scad>
include <../MCAD/bearing.scad>
include <config.scad>

include <vitamins.scad>
use <p012.scad>
use <p013.scad>
use <p014.scad>
use <p015.scad>
use <p020.scad>
use <p021.scad>
use <p022.scad>
use <p023.scad>

/// \file y_axis.scad Y axis assembly (bed)

module bed_carriage()
{
        assembly ();
        // carriage base
        translate ([146, 51/2, 0])
            rotate ([0, 180, 90])
            color (bed_carriage_color_one)
            p012 ();

        // idler holder
        translate ([0, -51/2, 0])
            union ()
        {
            color (bed_carriage_color_two)
                p013 ();
            for (ty = [11, 40])
                translate ([53, ty, 12])
                {
                    translate ([0, 0, washer_dimensions(M8)[2] + bearingDimensions(608)[2]])
                        color (washer_color)
                        washer(M8); echo ("BOM: washer M8");
                    translate ([0, 0, washer_dimensions(M8)[2]])
                        color (bearing_color)
                        bearing(model=608);
                    color (washer_color)
                        washer(M8); echo ("BOM: washer M8");

                }

        }

        // linear bearing holder
        translate ([62+84, -51/2, 0])
            rotate([90,0,180])
            union ()
        {
            color (bed_carriage_color_three)
                p014 ();
            color (bolt_color)
                p014_mounting(length=2);
            for (tx = [0, Y_rod_distance])
                translate ([13+tx,15.5,0])
                    for (tz = [0, LM08UU[0]+3])
                        translate ([0,0,tz])
                            linear_bearing (LM08UU);
        }

        // idler cap
        translate ([71, -51/2, 27])
            rotate ([-90, 0, 90])
            union ()
        {
            color (bed_carriage_color_four)
                p015 ();
            color (bolt_color)
                p015_mounting(length=9);
        }

        // motor
        translate ([32, 0, -2])
            rotate ([180, 0, 0])
            union ()
        {
            motor(Nema17);
            color (bolt_color)
                nema17_mounting(length=9);
        }
        end ();
}


module bed ()
{
    rod_dia = 8;
    rod_len = 25.4 * 10.5;

    assembly();
    translate ([ 0.1, -60.00, 28. ])
        rotate ([180, 0, 90])
    {
        // bed frame part one
        color (bed_frame_one) p020();
        translate ([21, 165-7-121.10, 21.5])
            rotate ([90,90,180])
        {
            color (bed_frame_belt_clamp) p022();
            color (bolt_color) p022_mounting(20);
        }


        // bed frame part two
        translate ([ 143.50 + 135.40, 165, 0])
            rotate ([0,0,180])
        {
            color (bed_frame_two) p021 ();
            translate ([21-7.5, 7+121.10, 21.5])
                rotate ([90,90,0])
            {
                color (bed_frame_belt_clamp) p022 ();
                color (bolt_color) p022_mounting(20);
            }

        }

        // rods
        for (t = [32.1, 32.1 + Y_rod_distance])
            translate ([10, 165-t, 12.5])
                rotate([0, 90, 0])
            {
                rotate([0, 0, 20])rod(rod_dia, rod_len);
                translate ([0, 0, rod_len - 17.8])
                {
                    color(bed_frame_rod_clamp) p023 ();
                    color (bolt_color) p023_mounting();
                }
            }
    }
    end();
}

module y_axis ()
{
    assembly ();
    translate([11.5, 0, 0])
    {
        bed_carriage ();
        bed ();
    }
    end ();
}

y_axis ();
