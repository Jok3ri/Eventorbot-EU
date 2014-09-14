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

/// \file p014.scad A holder for linear bearings holding bed rods,
/// mounted on the bed carrige.

use <../lib/bom.scad>
use <../MCAD/nuts_and_bolts.scad>

module p014_mounting (length = 0.0, bom = true){
    bolt_size = 5;
    bolt_length = 5*ceil((17 + length + 1)/5);

    translate ([63/2,-length, 13.5])
        rotate ([-90, 0, 0])
        boltHole (size=bolt_size, length=bolt_length);
    translate ([63/2,13.5, 13.5])
        rotate ([-90, 0, 0])
        nutHole (bolt_size);

    translate ([63/2,-length, 13.5+24])
        rotate ([-90, 0, 0])
        boltHole (size=bolt_size, length=bolt_length);
    translate ([63/2,13.5, 13.5+24])
        rotate ([-90, 0, 0])
        nutHole (bolt_size);

    if (bom) {
        echo ( str ("BOM: nut M", bolt_size));
        echo ( str ("BOM: nut M", bolt_size));
        echo ( str ("BOM: bolt M", bolt_size, "x", bolt_length));
        echo ( str ("BOM: bolt M", bolt_size, "x", bolt_length));
    }
}

module p014 () {
    difference()
    {
        union ()
        {
            // the body
            translate ([0,0,0]) cube ([63,17.5,51]);
            // end-stop lug
            translate ([61,0,0]) cube ([14.48,20,3]);

            // linear-bearing barrels
            translate ([13,   15,0]) cylinder (d=26,h=51);
            translate ([13+37,15,0]) cylinder (d=26,h=51);
        }

        translate ([0,0,-1])
            union ()
        {
            // linear bearing holes
            translate ([13,15.5,0]) cylinder (d=15,h=53);
            translate ([13+37,15.5,0]) cylinder (d=15,h=53);

            // end-stop hole
            translate ([69,13.4,0]) cylinder (d=5,h=53);

            //the slot
            translate ([12.5,8,0]) cube ([37,1.5,53]);
        }

        // mounting holes
        scale ([1,1.001, 1]) p014_mounting (length=3, bom=false);
    }
    bom_fff();
}

/*
============== Size ==============
Min X =  11.924370, Max X =  87.495674
Min Y =  26.072781, Max Y =  54.072781
Min Z =  12.015692, Max Z =  63.015690
*/
// rotate ([0,0,180])
// translate ([-87.425674,-54.072781,-12.015692])
// import(file = "../original/bed\ carriage\ p3\ P-014.stl");
