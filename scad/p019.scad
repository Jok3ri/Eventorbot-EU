// -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-

/// \file p019.scad The nut holder for Z axis driving screw

use <../MCAD/nuts_and_bolts.scad>
use <p018.scad>
use <p012.scad>

/**
 * TODO: move to a different file.
 */
module driving_rod (bom=true)
{
        nutHole(8);
        translate([0,0, 40])scale([1,1,5]) nutHole(8);
        cylinder(h=250, r=8/2, center=true, $fn=15);
        if (bom)
        {
            echo (str ("BOM: ", "nut M8"));
            echo (str ("BOM: ", "nut M8"));
            echo (str ("BOM: ", "bolt M8 threaded rod"));
        }

}

/**
 * The nut holder for Z axis driving screw with a space to put an
 * anti-backlash spring.
 *
 * @param bom Print BOM information, default: true.
 * @param stl Move and rotate for printing.
 *
 * TODO: bom entry;
 */
module p019(bom=true, stl=false)
{
    cube_depth = 15.28;
    rotate ([0, stl ? -90 : 0, 0])
        translate([0, stl ? 9.915 : 0, stl ? -64 : 0])
    render()
        difference() {
        linear_extrude(height=64)
            hull(){
            translate([15.9, 0])  rotate([0,0,]) rotate([0,0,30])  circle(r=9.915, $fn=6);
            translate([0, -(cube_depth/2)]) square([15, cube_depth]);
        }
        translate ([7.8,-10,12.5]) cube([20,20,11.5*2]);
        translate ([-27.2, 0, 18]) bed_carrige_to_z_axis_mounting(bom=false);
        translate ([13.3, 0, 0]) driving_rod();
    }
    if (bom)
    {
    }
}

/* 
============== Size ==============
Min X =  6.497517, Max X =  26.597517, Width  = 20.1
Min Y =  6.080724, Max Y =  54.080723, Depth  = 48.0
Min Z =  3.400000, Max Z =  26.700001, Height = 23.3
*/
//translate([14.2, 17.75, 0])
//rotate([90,0,90])
//translate([-6.497517, -6.080724, -3.4])
//import("../z carriage p2 P-019.stl");
