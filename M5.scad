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
 *
 *
 * This is just a parts library for M5 nuts, bolts, washers, etc.
*/

include <vars.scad>;

module M5_bolt(l=25, hex=false) {
  difference() {
    union() {
      cylinder(h=l, d=M5_bolt_diam, $fn=100, center=true);
      if( hex == true) {
        translate([0,0,l/2 + M5_bolt_head_height/2]) cylinder(h=M5_bolt_head_height, d=M5_bolt_head_diam, $fn=6, center=true);
      } else {
        translate([0,0,l/2 + M5_bolt_head_height/2]) cylinder(h=M5_bolt_head_height, d=M5_bolt_head_diam, $fn=200, center=true);
      }
    }
    translate([0,0,l/2 + M5_bolt_head_height]) cylinder(h=M5_bolt_head_height/2, d=M5_bolt_head_diam/2, $fn=6, center=true);
  }
}


/*
  h = height of the M5_washer
  w = width of the washer (od-id)
*/
module M5_washer(h=1,w=1) {
  difference() {
    cylinder(h=h, d=w+M5_bolt_diam, center=true, $fn=100);
    cylinder(h=h+0.1, d=M5_bolt_diam, center=true, $fn=100);
  }
}

/*
  h = height of the M5_nut
  w = Diameter of the nut
*/
module M5_nut(h=M5_nut_height,w=M5_nut_diam) {
  difference() {
    cylinder(h=h, d=w, center=true, $fn=6);
    cylinder(h=h+0.1, d=M5_bolt_diam, center=true, $fn=100);
  }
}
