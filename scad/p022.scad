/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * Clamp for Y axis timting belt.
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


/** \file p022.scad Clamp for the Y axis timing belt. The clamps hold
 * the belt fastened to P020 and P021.
 */

include <../lib/metric_fasteners_tab.scad>
use <../lib/metric_fasteners.scad>
use <../lib/bom.scad>

/**
 * Nuts and bolts holding the Y timing belt attached to the bed
 * frame.
 *
 * @param length Additional length of bolts required to attach the
 * part. This should actually be a thickness of a part this part is
 * attached to.
 */

module p022_mounting (length = 0.0, bom = true)
{
    bolt_length = 5 * ceil((7.0 + hex_nut_thickness(M3_5) + length)/5);
    render (convexity=4)
    {
        translate ([4.3, 7.5/2, 0])
            hex_bolt (M3_5, bolt_length);

        translate ([4.3, 7.5/2, 7+length])
            hex_nut (M3_5);

        translate ([4.3+12.9, 7.5/2, 0])
            hex_bolt (M3_5, bolt_length);

        translate ([4.3+12.9, 7.5/2, 7+length])
            hex_nut (M3_5);
    }
    if (bom)
    {
        echo ("BOM: nut M3.5");
        echo ("BOM: nut M3.5");
        echo (str ("BOM: nut M3.5x", bolt_length));
        echo (str ("BOM: nut M3.5x", bolt_length));
    }
}

module p022 ()
{
    render ()
        difference ()
    {
        cube([21.5, 7.5, 7]);
        translate ([ 6.80, -.25,  6.0]) cube ([ 7.9, 8.0, 1.1]);
        translate ([0, 0, -0.1]) p022_mounting(10, bom = false);
    }

    bom_fff();
}

p022 ();

/*
============== Size ==============
Min X =  0.357785, Max X =  21.857784
Min Y =  0.336866, Max Y =  7.836866
Min Z =  0.800000, Max Z =  7.800000
*/
//translate ([-0.357785, -0.336866, -0.800000])
//import (file = "../original/bed\ A\ p1\ P-022.stl");
