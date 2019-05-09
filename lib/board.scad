use <arduino.scad>

module gpib_conn() {
    color([1,1,1]*.2) {
        difference() {
        cube([15, 55, 1]);
        translate([5,4,0])
            cylinder(d=3, h=10, center=true);
        translate([5,55-4,0])
            cylinder(d=3, h=10, center=true);
        }
        translate([15,(55-33)/2,2])
            cube([10, 33, 8]);
    }
}

module shield() {
    $fn = 20;
    color([.2,.5,.2]) 
		difference() {
			cube([77, 55, 1.5]);
			translate([4,3,0])
				cylinder(d=3, h=5, center=true);
			translate([3,51,0])
				cylinder(d=3, h=5, center=true);
			translate([55,18,0])
				cylinder(d=3, h=5, center=true);
			translate([55,46,0])
				cylinder(d=3, h=5, center=true);
		}
    translate([63,0,1.5])
        gpib_conn();
}

module board() {
    translate([0,53.34,0])
        rotate(90,[0,0,-1])
            arduino();
    translate([11,53.5,14])
        rotate(180,[1,0,0])
            shield();
}

board();
