/*
 * This is my attempt at creating a z axiz carriage.
 * I suspect that it may be fairly over built, but it is
 * intended for a moving z-axis and I am printing it in PLA
 * so the material is not asstron as I would like.
 *
 * The size variable anlong with the left/right/center parts
 * were created for use when splitting the print into 3 pieces
 * because my DiVinci Jr 1.0w could not print the full thing.
 *
 * The parts in this file are:
 *
 *   - pivot_nut_holder()
 *
  * Copyright 2019 Tim Schaller
 * All rights reserved
 * Released under the GPL3
 * No claims are made as to the fitness and/or corectness of
 * this work. Use at your own risk. If you create useless things,
 * or if the parts fail it is on you NOT ME. As far as I know
 * this might make your printer burst into flames or print
 * little pink bunnies. You call. };->
 *
 */

 include <vars.scad>;

if (PART == "pivot_nut_holder") {
    color("lightgreen") pivot_nut_holder();
}

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module pivot_nut_holder(
    pivot_diam = pivot_diam,
    bolt_diam = height_bolt_diam + 1,
    nut_diam = M4_nut_diam,
    nut_height = M4_nut_height,
    nut_width = M4_nut_width
) {
    difference() {
        sphere( d=pivot_diam, $fn=100);

        // center bolt hole
        cylinder(h=pivot_diam+1, d=bolt_diam, $fn=100, center=true);

        // height adjustment nut hole
        rotate([0,0,0]) cylinder(h=nut_height +0.5, d=nut_diam+0.5, $fn=6, center=true);
        translate([5,0,0]) cube([8,nut_width + 0.5 ,nut_height+0.5], center=true);

        // Take the bottom off the sphere
        translate([0 ,0 ,0 - pivot_diam/2 - nut_height]) cube([pivot_diam, pivot_diam, pivot_diam], center=true);
    }
}
