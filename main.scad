// Dimensions in millimeters

use <lib/board.scad>;

INNER_LENGTH = 89;
INNER_WIDTH = 56;
INNER_HEIGHT = 19;
WALL_WIDTH = 3;
BOARD_POSITION = [0,2,3];
SCREWS_HOLE_DIAMETER = 1;

$fn = 20;

translate(BOARD_POSITION)
    board();

difference() {
    union() {
        translate([INNER_LENGTH,-WALL_WIDTH,INNER_HEIGHT/2]) {
            translate([-20,0,0])
                sphere(r=SCREWS_HOLE_DIAMETER/2+.8*WALL_WIDTH);
            rotate(90, [0,-1,0])
                cylinder(r=SCREWS_HOLE_DIAMETER/2+.8*WALL_WIDTH, h=20);
        }

        translate([INNER_LENGTH,INNER_WIDTH+WALL_WIDTH,INNER_HEIGHT/2]) {
            translate([-20,0,0])
                sphere(r=SCREWS_HOLE_DIAMETER/2+.8*WALL_WIDTH);
            rotate(90, [0,-1,0])
                cylinder(r=SCREWS_HOLE_DIAMETER/2+.8*WALL_WIDTH, h=20);
        }

        translate([0,-1,0]*WALL_WIDTH)
            cube([INNER_LENGTH, WALL_WIDTH, INNER_HEIGHT]);
        translate([0,INNER_WIDTH,0])
            cube([INNER_LENGTH, WALL_WIDTH, INNER_HEIGHT]);
        translate([-1,-1,0]*WALL_WIDTH)
            cube([WALL_WIDTH, INNER_WIDTH+2*WALL_WIDTH, INNER_HEIGHT]);
        translate([-1,-1,-1]*WALL_WIDTH)
            cube([INNER_LENGTH+WALL_WIDTH, INNER_WIDTH + 2*WALL_WIDTH, WALL_WIDTH]);
        translate([-1,-1,0]*WALL_WIDTH + [0,0,INNER_HEIGHT])
            cube([INNER_LENGTH+WALL_WIDTH, INNER_WIDTH + 2*WALL_WIDTH, WALL_WIDTH]);
    }
    translate([INNER_LENGTH,-WALL_WIDTH,INNER_HEIGHT/2]) {
        rotate(90, [0,-1,0])
            cylinder(r=SCREWS_HOLE_DIAMETER/2, h=20);
    }
    translate([INNER_LENGTH,INNER_WIDTH+WALL_WIDTH,INNER_HEIGHT/2]) {
        rotate(90, [0,-1,0])
            cylinder(r=SCREWS_HOLE_DIAMETER/2, h=20);
    }
    translate([-2*WALL_WIDTH,33.5,BOARD_POSITION[2]+1.2])
        cube([3*WALL_WIDTH, 13, 12]);
    translate([-2,4.5,BOARD_POSITION[2]+.5])
        cube([WALL_WIDTH, 11, 13]);
}