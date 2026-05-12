$fn = 128;

outer_d = 37.5;
outer_h = 14;

inner_d = 33;
inner_h = 6;

axle_d = 4;
axle_bore_depth = outer_h - 2;

metal_insert_d = 4 + inner_h;
metal_insert_w = 3;
metal_insert_l = 10;
metal_insert_offset = 3;

key_w = 1.5;
key_l = 2.5;

module metal_insert(depth = metal_insert_l, width = metal_insert_w, length = metal_insert_l) {
    difference() {
        hull() {
            translate(v = [-length/2, 0,0]) {
                cylinder(h = depth, d = width);
            }
            translate(v = [length/2, 0,0]) {
                cylinder(h = depth, d = width);
            }
        }
        translate(v = [0,-width/2,-0.001]) {
            cylinder(h = depth + 0.002, d = width/2);
        }
    }
}

difference() {
    cylinder(h = outer_h, d = outer_d);

    // Large inner pocket from bottom
    translate([0, 0, -0.001]){
        cylinder(h = inner_h + 0.002, d = inner_d);
    }
    translate([0, 0, -0.001]){
        cylinder(h = axle_bore_depth + 0.002, d = axle_d);
    }
    // translate(v = [0, -metal_insert_offset, 0]) {
    //     metal_insert();
    // }
    rotate(a = [0,0,-45]) {
        translate(v = [-axle_d/2-key_l/2, -key_w/2, 0]) {
            cube(size = [key_l, key_w, axle_bore_depth]);
        }
    }
}
