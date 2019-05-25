/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */
module 2020_corner_plate(x=4, y=4) {
  difference(){
    hull(){
      for ( i = [0:x-1]) {
        translate([10 * i, 0, 0]) cylinder(h=5, d=20, center=true, $fn=200);
      }
      for ( i = [0:y-1]) {
        translate([0, 10 * i, 0]) cylinder(h=5, d=20, center=true, $fn=200);
      }
    }
    for ( i = [0:x-1]) {
      translate([10 * i, 0, 0]) cylinder(h=6, d=5, center=true, $fn=200);
    }
    for ( i = [0:y-1]) {
      translate([0, 10 * i, 0]) cylinder(h=6, d=5, center=true, $fn=200);
    }
  }
}

module 2020_dual_rail_lift(rail_d=10) {
    translate([30,0,0]) 2020_rail_lift(rail_d);
    translate([-30,0,0]) 2020_rail_lift(rail_d);
    translate([0,25,2.5]) cube([24,30,5], center=true);
    translate([0,15,2.5]) cube([40,10,5], center=true);
}

module 2020_rail_lift(rail_d=10) {
    height=5;

    translate([0,0,2.5])
    difference() {
        union() {
            hull() {
                cylinder(h=height, d=rail_d * 2, center=true, $fn=200);
                translate([15,30,0]) cylinder(h=height, d=rail_d * 2, center=true, $fn=200);
                translate([-15,30,0]) cylinder(h=height, d=rail_d * 2, center=true, $fn=200);
            }
            translate([0, 0, height]) cylinder(h=height*3, d=rail_d * 2, center=true, $fn=200);
        }
        translate([0, 0, height]) cylinder(h=(height*4)+1, d=rail_d, center=true, $fn=200);
        translate([15,30,0]) cylinder(h=height+1, d=6, center=true, $fn=200);
        translate([-15,30,0]) cylinder(h=height+1, d=6, center=true, $fn=200);
    }

}


module 2020_dual_rail_mount(rail_d=10) {
    translate([30,0,0]) 2020_rail_mount(rail_d);
    translate([-30,0,0]) 2020_rail_mount(rail_d);
    translate([0,0,2.5]) cube([24,frame_size,5], center=true);
    translate([0,7.5,2.5]) cube([40,5,5], center=true);
    translate([0,-7.5,2.5]) cube([40,5,5], center=true);
}

module 2020_rail_mount(rail_d=10) {
    height=5;

    translate([0,0,2.5])
    difference() {
        union() {
            hull() {
                cylinder(h=height, d=20, center=true, $fn=200);
                translate([15,0,0]) cylinder(h=height, d=20, center=true, $fn=200);
                translate([-15,0,0]) cylinder(h=height, d=20, center=true, $fn=200);
            }
            translate([0, 0, height]) cylinder(h=height*3, d=20, center=true, $fn=200);
        }
        translate([0, 0, height]) cylinder(h=(height*4)+1, d=rail_d, center=true, $fn=200);
        translate([15,0,0]) cylinder(h=height+1, d=6, center=true, $fn=200);
        translate([-15,0,0]) cylinder(h=height+1, d=6, center=true, $fn=200);
    }

}

module 2020_inside_3_way() {
    union() {
        translate([10, 20, 20])  rotate([0, 0, 0])  2020_inside_l();
        translate([20, 10, 20])  rotate([0 ,0,270]) 2020_inside_l();
        translate([20, 20 ,10 ]) rotate([0 ,90,0])  2020_inside_l();
        translate([20, 20, 20])  rotate([0, 0, 0])  corner_center(25);
    }
}


module tetrahedron(s=1)
{
	polyhedron(
		points=[
			[+1,0,-1/sqrt(2)],
			[-1,0,-1/sqrt(2)],
			[0,+1,+1/sqrt(2)],
			[0,-1,+1/sqrt(2)]		],
		faces=[
			[1,0,2],
			[2,0,3],
			[0,1,3],
			[1,2,3]
		]
	);
}


module pyramid(l, w, h) {
    polyhedron(
    points=[ [1,w,0],[l,-w,0],[-l,-w,0],[-l,w,0], // the four points at base
           [0,0,h]  ],                                 // the apex point
    faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
    );
}

module corner_center(s) {
    polyhedron(
    points=[ [0,0,0],[s,0,0],[0,s,0],[0,0,s],
           [0,0,h]  ],
    faces=[ [0,1,2],[1,2,3],[2,0,3],[0,1,3] ]
    );
}


module prism(l, w, h){
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]],
           center=true
           );
}

module 2020_inside_l() {
    // TODO: parameterize
    small=0.001;
    hole_diam=4.5;
    m4_nut_diam=7.8;
    toung_width=5;
    toung_height=4;
    toung_lenght=25;

    difference() {
        union() {
            translate([0,15,3]) cube([20,30,6], center=true);
            translate([0,15,-2]) cube([toung_width,toung_lenght,toung_height], center=true);
            translate([0,3,15]) cube([20,6,30], center=true);
            translate([0,-2,15]) cube([toung_width,toung_height,toung_lenght], center=true);
            translate([-10,0,20]) rotate([270,0,0]) prism(20,20,20);
            translate([-10,0,30]) rotate([270,0,0]) prism(6,30,30);
            translate([4,0,30]) rotate([270,0,0]) prism(6,30,30);
        }
        translate([0,20,0]) cylinder(h=15,d=hole_diam, center=true, $fn=200);
        rotate([90,0,0]) translate([0,20,0]) cylinder(h=15,d=hole_diam, center=true, $fn=200);
        translate([0,20,-3]) cylinder(h=4,d=m4_nut_diam, center=true, $fn=200);
        rotate([90,0,0]) translate([0,20,4]) cylinder(h=6,d=m4_nut_diam, center=true, $fn=6);
    }
}

module 2020_extrusion(bar_height){
    small=0.001;

    translate([0,0,0])
    intersection(){
        cylinder(d=26.87,h=bar_height,center=true, $fn=200);
        difference(){
            union(){
                difference(){
                cube([20,20,bar_height],center=true);
                    union()
                    {
                        cube([16.4+small,16.4+small,bar_height+small],center=true);
                        cube([6.2+small,20+small,bar_height+small],center=true);
                        cube([20+small,6.2+small,bar_height+small],center=true);

                        translate([0,9.75,0])
                        cube([7.2+small,0.5+small,bar_height+small],center=true);
                        translate([9.75+small,0,0])
                        cube([0.5+small,7.2+small,bar_height+small],center=true);
                        translate([0,-9.75-small,0])
                        cube([7.2+small,0.5+small,bar_height+small],center=true);
                        translate([-9.75-small,0,0])
                        cube([0.5+small,7.2+small,bar_height+small],center=true);
                    }

                }
                rotate([0,0,45]){
                    cube([1.5,26,bar_height],center=true);
                    cube([26,1.5,bar_height],center=true);
                }
                translate([7.5,7.5,0])cube([4.5,4.5,bar_height],center=true);
                translate([-7.5,-7.5,0])cube([4.5,4.5,bar_height],center=true);
                translate([-7.5,7.5,0])cube([4.5,4.5,bar_height],center=true);
                translate([7.5,-7.5,0])cube([4.5,4.5,bar_height],center=true);
                cube([8,8,bar_height],center=true);
            }
            cylinder(r=2.5,h=bar_height+small,center=true, $fn=200);
        }
}
}
