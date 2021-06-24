// Units are mm.

function i2mm(x) = x * 0.0254 * 1000;

function rotor_radius() = i2mm(6);
function bolt_diam() = i2mm(1.0/8);
function gusset_thickness() = i2mm(1/16);

function center_to_motor() = 1.03125 * rotor_radius(); // overall center to motor axis.

function web_dx() = center_to_motor() / sqrt(2); // lateral distance from center to webbing bolt hole.

// hub gusset
function edge_radius() = i2mm(1);
function bolt_radial_position() = i2mm(0.75);

// tube
function tube_height() = i2mm(0.5);
function tube_width() = i2mm(0.5);
function tube_thickness() = i2mm(1/16);



