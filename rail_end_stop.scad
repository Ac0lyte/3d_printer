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

include <vars.scad>;
use <microswitch.scad>;

PART = "rail_end_stop_assembly";


if (PART == "rail_end_stop_assembly") {
  color(part_color) rail_end_stop_top();
  color(part_color, 0.75) rail_end_stop_bottom();

  color("black",0.25) translate([-3, 8.5, 11]) microswitch();
}

if (PART == "rail_end_stop_top") {
  color(part_color) rail_end_stop_top();
}

if (PART == "rail_end_stop_bottom") {
  color(part_color) rail_end_stop_bottom();
}


/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module rail_end_stop_top(id=10, od=14, width=5){
  difference(){
    color(part_color) rail_end_stop(id, od, width);
    translate([0, 0,-20]) cube([30,30,40],center=true);
  }
}

module rail_end_stop_bottom(id=10, od=14, width=5){
  difference(){
    color(part_color) rail_end_stop(id, od, width);
    translate([0, 0, 20]) cube([30,30,40],center=true);
  }
}

module rail_end_stop(id=10, od=14, width=5){
  plate_height=2;
  plate_width=20;
  plate_depth=width;

  union(){
    rotate([90, 0, 0]) difference(){
      union(){
        cylinder(h=width, d=od, $fn=100, center=true);
        cube([od+10, 4, width], center=true);
      }
      cylinder(h=width+1, d=id+.5, $fn=100, center=true); // rail
      rotate([90,0,0]){
        translate([ (od/2+2), 0, 0]) cylinder(h=5, d=3.5, $fn=100, center=true);
        translate([-(od/2+2), 0, 0]) cylinder(h=5, d=3.5, $fn=100, center=true);
      }
    }
    difference(){
      translate([0, 0, (od+plate_height)/2-1]) cube([plate_width, plate_depth, plate_height], center=true);
      translate([-4.75, 0, (od+plate_height)/2-1]) cylinder(h=6, $fn=100, center=true);
    }
    translate([ 4.75, 0, (od+plate_height)/2+2]) cylinder(h=6, $fn=100, center=true);
  }
}
