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

use <p007.scad>
use <p008.scad>
use <p012.scad>
use <p016.scad>
use <p017.scad>
use <p018.scad>
use <p019.scad>
use <x_axis.scad>
use <y_axis.scad>

/// \file z_axis.scad Z axis assembly

module z_axis ()
{
    assembly();
    rotate ([0, -90, 0])
        xz_rails();
    translate ([-2.2, -24.95 - 2.8, 85])
        rotate([0, 180, 0])
    {
        // z axis carriage
        color(z_axis_carriage)
            p018 ();

        // driving nut holder
        translate([14.2, 27.75, 48])
            rotate([180, 0, 0])
        {
            color (z_axis_nut_holder)
                p019();
            translate ([-169.2, 25.5, 5])
                rotate ([0, 0, -90])
                color(bolt_color)
                p012_mounting (length=14.5);
        }

        // linear bearings
        for (i=[0,1])
            translate ([0, X_rod_distance * i, 0])
                for (i=[0,1])
                    translate ([11, 11, 24*i])
                        linear_bearing (LM08UU);

        // the bed
        translate ([2.5, 27.75, 5])
            rotate ([180, 0, 180])
            y_axis();
    }
    end ();
}

z_axis ();
