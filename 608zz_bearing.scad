/*
* The parts in this file are:
*
*   - 608zz_bearing()
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



module 608zz_bearing() {
    bearing_height=7;
    bearing_od=22;
    bearing_id=8;

    color("white")
    difference() {
      cylinder(h=bearing_height, d=bearing_od, $fn=100, center=true);
      cylinder(h=bearing_height+1, d=bearing_id, $fn=100, center=true);
    }
}
