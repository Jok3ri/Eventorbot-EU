// -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-

/** \file fasteners.scad Metric fasteners: bolts, nuts, washers etc.
 */

include <metric_fasteners_tab.scad>

/**
 * The thickness of a hex nut.
 *
 * @param size  Index in the tables. Use M* variables.
 */
function hex_nut_thickness(size) = METRIC_HEXAGONAL_HEADS_AND_NUTS[size][1];

/**
 * Basic metric bolt with hexagonal head.
 *
 * @param size Index in the tables. Use M* variables.
 *
 * @param length Length of the thread.
 */

module hex_bolt(size, length)
{
    d = METRIC_THREADS[size][0];
    m = METRIC_HEXAGONAL_HEADS_AND_NUTS[size][1];
    s = METRIC_HEXAGONAL_HEADS_AND_NUTS[size][2];
    a = 0.1 * m;
    b = s / 1.73205;
    bolt_length = (length == undef) ? m : length;
    render()
        union()
    {
        translate([0, 0, -a])
            cylinder(r = d/2, h=bolt_length + a, $fn=24);
        translate([0, 0, -m])
            cylinder(r = b, h = m, $fn = 6);
    }
}

/**
 * Basic metric hexagonal nut *without* a threaded hole in it.
 *
 * @param size Index in the tables. Use M* variables
 */

module hex_nut (size)
{
    d = METRIC_THREADS[size][0];
    m = METRIC_HEXAGONAL_HEADS_AND_NUTS[size][1];
    s = METRIC_HEXAGONAL_HEADS_AND_NUTS[size][2];
    a = 0.1 * m;
    b = s / 1.73205;

    render ()
        cylinder (r = b, h = m, $fn = 6);
}

/**
 * Basic metric hexagonal nut *with* a hole in it. Avoid using this
 * module to carve holes for nuts and bolts because you may not get a
 * manifold mesh.
 *
 * @param size Index in the tables. Use M* variables
 */

module hex_nut_hole (size)
{
    d = METRIC_THREADS[size][0];
    m = METRIC_HEXAGONAL_HEADS_AND_NUTS[size][1];
    s = METRIC_HEXAGONAL_HEADS_AND_NUTS[size][2];
    a = 0.1 * m;
    b = s / 1.73205;

    render ()
        difference ()
    {
        cylinder (r = b, h = m, $fn = 6);
        translate ([0, 0, -0.05])
            cylinder (d = d, h = m + 0.1, $fn = 26);
    }
}

/**
 * Basic washer for metric bolts.
 *
 * @param size Index in the tables. Use M* variables
 */

module washer (size)
{
    wd1 = METRIC_WASHERS[size][0];
    wd2 = METRIC_WASHERS[size][1];
    wh = METRIC_WASHERS[size][2];

    render()
        difference ()
    {
        cylinder (d=wd2, h=wh);
        cylinder (d=wd1, h=2.1*wh, center=true);
    }
}

/**
 * Dimensions of a basic washer for metric bolts.
 *
 * @param size Index in the tables. Use M* variables
 * @return [inner d., outer d., height]
 */
function washer_dimensions(size) = METRIC_WASHERS[size];
