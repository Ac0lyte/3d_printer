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
 * This is a guide for the top end of the z axis. In this
 * case the guide is a 608zz bearing, since the inner
 * opening is the perfect size for an 8mm lead screw.
*/


include <vars.scad>;
include <2020_mount_plate.scad>;
include <608zz_bearing.scad>;


PART = "z_axis_bearing_holder";

if (PART == "z_axis_bearing_holder") {
  color(part_color)
  z_axis_bearing_holder();
}

if (PART == "z_axis_bearing_holder_assembly") {
  color(part_color)
  z_axis_bearing_holder();

  color("grey")
  608zz_bearing();
}


module z_axis_bearing_holder(height=4, length=0, offset=25) {
  bearing_od = 23;
  bearing_height = 7;
  mount_length = length + bearing_od;


  difference(){
    union(){
      translate([0,offset+ (height/2), 0]) rotate([0, 90, 0])
      2020_mount_plate(height, length=mount_length, holes=0);

      translate([0,offset+ (height/2)+11, 11]) rotate([90, 0, 90])
      2020_mount_plate(height, length=mount_length, holes=1);

      translate([0,offset+ (height/2), 11])
      cube([mount_length, height, height], center=true);

      translate([0, offset/2, 0])
      cube([mount_length, offset, bearing_height], center=true);

      cylinder(h=bearing_height, d=bearing_od+(bearing_height*2), $fn=360, center=true);
    }
    cylinder(h=bearing_height+1, d=bearing_od, $fn=360, center=true);
    translate([0,0,-(bearing_height)]) cube([100,100,bearing_height], center=true);
  }
}
