/*
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

// Part color when an image is rendered
part_color = "skyblue";

// Height of the nut in milimeters
nut_height = 3.5;

// Diameter of the nut in milimeters.
nut_diam = 11;

// Size of the hole for the bolt in mm. Add .5
bolt_hole = 5.5;

// Approxamatly 1/3 of the final knob diameter
knob_diam = 15;

/***************************************************************/

PART = "tension_knob";

/***************************************************************/

if (PART == "tension_knob") {
  color(part_color)
  rotate([0,180,0])
  tension_knob(
    nut_height = 3.5,
    nut_diam = 11,
    bolt_hole = 5.5,
    knob_diam = 15
  );
}

/***************************************************************/

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module tension_knob(
  nut_height = 3.5,
  nut_diam = 11,
  bolt_hole = 5.5,
  knob_diam = 15,
) {

  difference(){
    union(){
      translate([0, 0, -(nut_height)]) cylinder(h=nut_height*2, d=nut_diam+6, $fn=100, center=true);
      translate([0, 0, nut_height/2]) cylinder(h=5, d=knob_diam*2, $fn=100, center=true);
      for ( i = [1:6] ) {
        x = sin(i*60) * knob_diam;
        y = cos(i*60) * knob_diam;
        translate([x, y, nut_height/2]) cylinder(h=5, d=knob_diam* 1.2, $fn=100, center=true);
      }
    }
    translate([0, 0, 1-(nut_height*2)]) cylinder(h=nut_height+0.2, d=nut_diam, $fn=6, center=true);
    translate([0, 0, 0]) cylinder(h=20, d=bolt_hole, $fn=100, center=true);
  }
}
