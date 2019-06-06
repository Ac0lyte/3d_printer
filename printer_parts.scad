/* Global */
include <vars.scad>;
include <2020_extrusion.scad>;
include <height_lever.scad>;
include <608zz_bearing.scad>;
include <2020_corner_plate.scad>;

/* ========================================================= */
/* MODULES                                                   */
/* ========================================================= */

module 2020_3_way_corner_plate(x=4) {
  color("red") union() {
    translate([10,10,-2.5]) rotate([0, 0, 0])   2020_corner_plate(x,x,true);
    translate([10,-2.5,10]) rotate([90,0, 0])   2020_corner_plate(x,x,true);
    translate([-2.5,10,10]) rotate([0, 270, 0]) 2020_corner_plate(x,x,true);
  }
}


module 2020_rail_carriage_lift(rail_d=10) {
  // Platform base dimentions
  platfom_width = 160;
  platfom_height = 5;
  platfom_depth = 30;

  //
  linear_bearing_height=29;
  linear_bearing_od=19;
  linear_bearing_id=10;

  //608zz
  bearing_height=7;
  bearing_od=22;
  bearing_id=8;
  bearing_race=11;

  // M5 Nut
  M5_height = 4;
  M5_diam = 9;

  difference(){
    union() {
      // Bearing race holes
      translate([-30, 0, 0]) 2020_rail_bearing();
      translate([ 30, 0, 0]) 2020_rail_bearing();

      hull() {
        translate([ 30,0,0])   cylinder(h=5, d=20, $fn=100, center=true);
        translate([-30,0,0])   cylinder(h=5, d=20, $fn=100, center=true);
        translate([ 165,30,0]) cylinder(h=5, d=20, $fn=100, center=true);
        translate([-165,30,0]) cylinder(h=5, d=20, $fn=100, center=true);
      }

      // Bridge between races
      translate([0,0,0]) cube([50,5,20], $fn=100, center=true);

      // Ribs
      hull() {
        translate([30, 0, 7.5]) sphere(d=5, $fn=100);
        translate([30, 0,-7.5]) sphere(d=5, $fn=100);
        translate([0,37.5,1])   sphere(d=5, $fn=100);
        translate([0,37.5,-1])  sphere(d=5, $fn=100);
      }
      // Ribs
      hull() {
        translate([-30, 0, 7.5]) sphere(d=5, $fn=100);
        translate([-30, 0,-7.5]) sphere(d=5, $fn=100);
        translate([0,37.5,1])    sphere(d=5, $fn=100);
        translate([0,37.5,-1])   sphere(d=5, $fn=100);
      }
      // Ribs
      hull() {
        translate([-30, 0, 7.5]) sphere(d=5, $fn=100);
        translate([-30, 0,-7.5]) sphere(d=5, $fn=100);
        translate([-95,37.5,1])  sphere(d=5, $fn=100);
        translate([-95,37.5,-1]) sphere(d=5, $fn=100);
      }
      // Ribs
      hull() {
        translate([30, 0, 7.5]) sphere(d=5, $fn=100);
        translate([30, 0,-7.5]) sphere(d=5, $fn=100);
        translate([95,37.5,1])  sphere(d=5, $fn=100);
        translate([95,37.5,-1]) sphere(d=5, $fn=100);
      }
      // Ribs
      hull() {
        translate([-30, 0, 7.5])    sphere(d=5, $fn=100);
        translate([-30, 0,-7.5])    sphere(d=5, $fn=100);
        translate([-172.5,32.5,1])  sphere(d=5, $fn=100);
        translate([-172.5,32.5,-1]) sphere(d=5, $fn=100);
      }
      // Ribs
      hull() {
        translate([30, 0, 7.5])    sphere(d=5, $fn=100);
        translate([30, 0,-7.5])    sphere(d=5, $fn=100);
        translate([172.5,32.5,1])  sphere(d=5, $fn=100);
        translate([172.5,32.5,-1]) sphere(d=5, $fn=100);
      }

      // height adjustment bolt stand
      translate([ 10,35,0]) cylinder(h=10, d=10, $fn=100, center=true);
      translate([-10,35,0]) cylinder(h=10, d=10, $fn=100, center=true);
    }

    // Rail holes
    translate([ 30, 0, 0])  cylinder(h=21, d=10, $fn=100, center=true);
    translate([-30, 0, 0])  cylinder(h=21, d=10, $fn=100, center=true);

    // height adjustment bolt hole
    translate([ 10,35,5]) cylinder(h=10, d=4, $fn=100, center=true);
    translate([-10,35,5]) cylinder(h=10, d=4, $fn=100, center=true);

    // height adjustment spring hole
    translate([10,35,5]) cylinder(h=1, d=5, $fn=100, center=true);
    translate([-10,35,5]) cylinder(h=1, d=5, $fn=100, center=true);

    // height adjustment nut hole
    translate([10,35,0]) rotate([0,0,30]) cylinder(h=M5_height, d=M5_diam, $fn=6, center=true);
    translate([10,40,0]) cube([8,10,M5_height], center=true);
    translate([-10,35,0]) rotate([0,0,30]) cylinder(h=M5_height, d=M5_diam, $fn=6, center=true);
    translate([-10,40,0]) cube([8,10,M5_height], center=true);

    // 608zz bearing slot
    translate([ 170,36,0]) rotate([90,0,0]) cylinder(h=bearing_height+2, d=bearing_od+10, $fn=100, center=true);
    translate([-170,36,0]) rotate([90,0,0]) cylinder(h=bearing_height+2, d=bearing_od+10, $fn=100, center=true);
  }

  // 608zz bearing peg
  translate([ 170,36,0]) rotate([90,0,0]) cylinder(h=bearing_height+2, d=bearing_id-0.2, $fn=100, center=true);
  translate([-170,36,0]) rotate([90,0,0]) cylinder(h=bearing_height+2, d=bearing_id-0.2, $fn=100, center=true);

  // 608zz bearing race stop
  translate([170,32.5,0]) difference() {
    sphere(d=bearing_race, $fn=100);
    translate([0, bearing_race/4, 0]) cube([bearing_race+1, bearing_race/2, bearing_race+1], center=true);
  }
  translate([-170,32.5,0]) difference() {
    sphere(d=bearing_race, $fn=100);
    translate([0, bearing_race/4, 0]) cube([bearing_race+1, bearing_race/2, bearing_race+1], center=true);
  }
}

module platform_corner() {
    // Bearing dimensions
    bearing_height=7;
    bearing_od=22;
    bearing_id=8;
    bearing_race=11;


    // Platform corner
    color("lightgreen") {
        // Corner plate
        translate([5, 10, 0]) rotate([0,180,0]) 2020_corner_plate(3,3);

        //
        //translate([x, y-0.5, 0]) rotate([90,0,0])
        //    cylinder(h=1, d=bearing_race, $fn=100, center=true);

        translate([0, 0-(bearing_id/2), 0]) rotate([90,0,0])
            cylinder(h=bearing_height+1, d=bearing_id, $fn=100, center=true);

        translate([0, 0, 0]) difference() {
            sphere(d=bearing_race, $fn=100);
            translate([0, bearing_race/4, bearing_race/2])
                cube([bearing_race+1, bearing_race/2, bearing_race+1], center=true);
        }
    } // lightgreen
} // platform_corner



module 2020_rail_bearing(rail_d=10) {
    height=20;

    difference() {
      cylinder(h=height, d=rail_d*2, $fn=100, center=true);
      cylinder(h=height+1, d=rail_d, $fn=100, center=true);
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
    points=[ [0,0,0],[s,0,0],[0,s,0],[0,0,s] ],
    faces=[ [0,1,2],[0,3,1],[1,3,2],[2,3,0] ]
    );
}


module prism(l, w, h){
   polyhedron(
           points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
           faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
           );
}

module 2020_inside_l( toung=false) {
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
            translate([0,3,15]) cube([20,6,30], center=true);
            translate([-10,0,20]) rotate([270,0,0]) prism(20,20,20);
            translate([-10,0,30]) rotate([270,0,0]) prism(6,30,30);
            translate([4,0,30]) rotate([270,0,0]) prism(6,30,30);
            if( toung == true) {
                translate([0,-2,15]) cube([toung_width,toung_height,toung_lenght], center=true);
                translate([0,15,-2]) cube([toung_width,toung_lenght,toung_height], center=true);
            }
        }
        translate([0,20,0]) cylinder(h=15,d=hole_diam, center=true, $fn=200);
        rotate([90,0,0]) translate([0,20,0]) cylinder(h=15,d=hole_diam, center=true, $fn=200);
        translate([0,20,-3]) cylinder(h=4,d=m4_nut_diam, center=true, $fn=200);
        rotate([90,0,0]) translate([0,20,4]) cylinder(h=6,d=m4_nut_diam, center=true, $fn=6);
    }
}
