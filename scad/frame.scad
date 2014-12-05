/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * The steel frame of Eventorbot
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

/// \file eventorbot.scad The steel frame of the Eventorbot.

/**
 * A square pipe with rounded corners. The profile is extruded along the Z axis.
 *
 * @param size widht, height and length of a pipe;
 * @param thickness thickness of walls;
 * @param radius radius of rounded corners.
 *
 * Inspired by WilliamAAdams' http://www.thingiverse.com/thing:9347
 */

include <config.scad>
use <../lib/bom.scad>

use <x_axis.scad>
use <z_axis.scad>

module square_profile(size, thickness, radius=0)
{
    $fn=20;
    x = size[0];
    y = size[1];
    length = size[2];

    difference ()
    {
        if (radius <= 0)
        {
            cube(size);
        }
        else
        {
            linear_extrude (height=length)
                hull ()
            {
                translate ([radius, radius, 0])
                    circle (radius);
                translate ([x - radius, radius, 0])
                    circle (radius);
                translate ([x - radius, y - radius, 0])
                    circle (radius);
                translate ([radius, y - radius, 0])
                    circle (radius);
            }
        }

        translate ([thickness, thickness, -1])
            if (radius <= 0)
            {
                cube([x - (2 * thickness), y - (2 * thickness), length + 2]);
            }
            else
            {
                linear_extrude (height=length + 2)
                    hull ()
                {
                    translate ([radius, radius, 0])
                        circle (radius);
                    translate ([x - radius - (2*thickness), radius, 0])
                        circle (radius);
                    translate ([x - radius - (2*thickness), y - radius - (2*thickness), 0])
                        circle (radius);
                    translate ([radius, y - radius - (2*thickness), 0])
                        circle (radius);
                }
            }
    }
}

module frame_top(crossection=false)
{
    whl = horizontal_frame_hole_length;
    whp = horizontal_frame_hole_position;
    fl = horizontal_frame_length;

    render(convexity=10)
        difference ()
    {
        translate ([0,-30,60])
            rotate ([0, 90, 0])
            square_profile ([60, 60, fl], 2, 2);
        union ()
        {
            // cut the end
            translate ([0, 0, 60-45*sqrt(2)])
                rotate ([0, 45, 0])
                cube([90, 90, 90], center=true);
            // x-axis cut out, a hole for the hotend carrige
            translate ([whp, ((60-25)/2)-30, -1])
                cube ([whl, 25, 5]);
            // holes for screws to mount the the rails
            translate ([77, 0, 0]) union ()
            {
                screw_hole (5);
                translate ([14, 0, 0]) screw_hole (5);
                translate ([290, 0, 0]) screw_hole (5);
                translate ([304, 0, 0]) screw_hole (5);
            }
            // a hole for the passive pulley
            translate ([fl - 18 - 14, 0, 60])
                linear_extrude (height=10, center=true)
                hull () { circle(4); translate ([18, 0, 0]) circle (4);}
            // a hole to access the vertical part
            translate ([-4, 2-30, -1]) cube ([60,56,62]);
        }
        if (crossection)
            translate([-1, -1000, -1]) cube(1000);
    }
}

module frame_vertical(crossection=false)
{
    working_hole_length   = vertical_frame_hole_length;
    working_hole_position = vertical_frame_hole_position;
    fl = vertical_frame_length;

    render(convexity=10)
        difference ()
    {
        translate([0, -30, 0])
        square_profile ([60, 60, fl], 2, 2);
        union ()
        {
            // cut both ends at 45 degrees
            translate ([60, 0, 60-45*sqrt(2)])
                rotate ([0, 45, 0])
                cube([90, 90, 90], center=true);
            translate ([60, 0, fl-60+45*sqrt(2)])
                rotate ([0, 45, 0])
                cube([90, 90, 90], center=true);
            // z-axis
            translate ([50, 0, working_hole_position])
                cube ([10, 25, working_hole_length]);
        }
        if (crossection)
            translate([-1, -1000, -1]) cube(1000);
    }
}

module frame_bottom(crossection=false)
{
    render(convexity=10)
        difference()
    {
	translate ([0,-30,60])
	  rotate ([0, 90, 0])
	  square_profile ([60, 60, 374], 2, 2);
	translate ([0, 00, 45*sqrt(2)])
	  rotate ([0, 45, 0])
	  cube([90, 90, 90],center=true);
        if (crossection)
            translate([-1, -1000, -1]) cube(1000);
    }
}

//
// The steel frame of the robot. The length of the horizontal parts
// have been adjusted to make five frames from 6m of the pipe. The
// size of the pipe have been set to 60x60 mm instead of 2.5 inch.
//
module steel_frame()
{
    assembly ();
    translate ([0, 0, vertical_frame_length - 60]) {
        frame_top(true);
        translate([X_AXIS_POSITION, 0, 2]) x_axis ();
    }
    translate ([0, 0, 0]) frame_vertical(true);
    translate ([58, 0, Z_AXIS_POSITION])
        z_axis();
    // translate ([0, 0, 0]) frame_bottom(true);

    echo (str ("BOM: square pipe 60x60x",
               10 * ceil (((2*horizontal_frame_length +
                            vertical_frame_length) * 1.05) / 10)));
    end ();
}

steel_frame();
