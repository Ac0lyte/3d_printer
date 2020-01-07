difference() {
  translate([2.5, 0, 2.5]) cube([25, 10, 23], center=true);

  translate([0, 0, 0]) cube([20.1, 10.1, 20.1], center=true);
  translate([15, 0, 0]) rotate([0, 90, 0]) cylinder(h=10, d=4.5, center=true, $fn=120);
}
