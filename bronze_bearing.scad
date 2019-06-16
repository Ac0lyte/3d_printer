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

 /* ========================================================= */
 /* MODULES                                                   */
 /* ========================================================= */

include <vars.scad>;

PART = "bronze_bearing";

if (PART == "bronze_bearing") {
    rotate([0, 0, 45])
    bronze_bearing();
}



module bronze_bearing(id=10, od=16, length=15) {
  color("DarkGoldenrod")
  difference(){
    cylinder(h=length,   d=od, $fn=200, center=true);
    cylinder(h=length+1, d=id, $fn=200, center=true);
  }
}
