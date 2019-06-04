
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

