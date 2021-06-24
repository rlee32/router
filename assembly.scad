// Units are mm.

use <common.scad>;
use <hub-gusset.scad>;
use <tube.scad>;

// Hub gussets.
translate([0, 0, tube_height() / 2])
    linear_extrude(height = gusset_thickness())
        hub_gusset();
translate([0, 0, -tube_height() / 2 - gusset_thickness()])
    linear_extrude(height = gusset_thickness())
        hub_gusset();

module forward_tube() {
    len = tube_width() + center_to_motor() * 2 + bolt_radial_position() * 2;
    h0 = tube_width() / 2;
    h1 = h0 + center_to_motor();
    h2 = h1 + 2 * bolt_radial_position();
    center = h2 - bolt_radial_position();
    h3 = h2 + center_to_motor();
    h4 = center - web_dx();
    h5 = center + web_dx();
    tube(length = len, top_bolts = [h0, h1, h2, h3, h4, h5]);
}
forward_tube();

lateral_tube_len = tube_width() + center_to_motor() - bolt_radial_position();
module lateral_tube() {
    h0 = tube_width() / 2;
    h1 = h0 + web_dx() - bolt_radial_position();
    h2 = lateral_tube_len - tube_width() / 2;
    tube(length = lateral_tube_len, top_bolts = [h0, h1, h2]);
}
rotate([0, 0, 90])
    translate([0, lateral_tube_len / 2 - tube_width() / 2 + bolt_radial_position(), 0])
        lateral_tube();
rotate([0, 0, -90])
    translate([0, lateral_tube_len / 2 - tube_width() / 2 + bolt_radial_position(), 0])
        lateral_tube();

