/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * Design parameters
 * Copyright (C) 2014  Łukasz Stelmach
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/// \file config.scad Configuration file for Eventorbot machine. Use
/// the with the "include" directive.

/*
 * Constants
 *
 * These value should not be edited. They depend on each other but
 * there are no formulae (yet?) to describe the dependencies. If you
 * choose to change any of them, be prepared to adjust every other.
 */

FRAME_SIDE_LENGTH = 70;         /**< The length of each side of the
                                 * square pipe used to build the
                                 * frame */
FRAME_THICKNESS = 2;
FRAME_RADIUS = 3 * FRAME_THICKNESS; /**< Max 3 according to
                                     * BN-79/0656-01, see also
                                     * EN10219 */

X_CARRIAGE_LENGTH = 48.0;       /**< The length of X carriage along the rods */
Y_CARRIAGE_LENGTH = 51.0;       /**< The length of Y bearing holder along the rods */
Y_ROD_CLAMP_LENGTH = 10;
BED_FRAME_WIDTH_N = 10;         /**< Widht of the narrow parts of the bed frame */
BED_FRAME_WIDHT_W = 14;         /**< Widht of the wide parts of the bed frame */
Z_CARRIAGE_LENGTH = 48.0;       /**< The length of Z carriage along the rods */
ROD_SUPPORT_LENGTH = 26.4;      /**< The length of X and Z axis rods
                                 * hidden in the supporting element */

X_rod_distance = 33.5;          /**< Distance between the rods of X axis */
Y_rod_distance = 37;            /**< Distance between the rods in the bed frame */
Z_rod_distance = X_rod_distance; /**< Z axis rails use the same components for X axis */

/* Parameters */
x_working_distance = 199;       /**< Working distance along X axis */
y_working_distance = 187.9;     /**< Working distance along Y axis */
z_working_distance = 199;       /**< Working distance along Z axis */

x_carriage_render_position = 0;
y_carriage_render_position = 0;
z_carriage_render_position = 10;

printed_plastic_color = "orange"; /**< Common colour for all printed parts */
use_realistic_colors = false;     /**< Use one colour for all plastic parts */
with_ball_screw = false;        /**< Build the machine with a ball
                                 * screw for z axis drive instead of a
                                 * threaded rod, */

/* Helper variables, avoid touching. */
X_AXIS_POSITION = FRAME_SIDE_LENGTH + 10.8; /**< Position of the X axis assembly in the frame */
Z_AXIS_POSITION = FRAME_SIDE_LENGTH + 18.8; /**< Position of the Z axis assembly in the frame */

horizontal_frame_hole_position = ceil(X_AXIS_POSITION + ROD_SUPPORT_LENGTH);
horizontal_frame_hole_length   = ceil(x_working_distance + X_CARRIAGE_LENGTH);
horizontal_frame_hole_width    = 25;
horizontal_frame_length = horizontal_frame_hole_position +
    horizontal_frame_hole_length + 46;

vertical_frame_hole_position = ceil(Z_AXIS_POSITION + ROD_SUPPORT_LENGTH);
vertical_frame_hole_length   = ceil(z_working_distance + Z_CARRIAGE_LENGTH);
vertical_frame_hole_width    = 25;
vertical_frame_length = vertical_frame_hole_position +
    vertical_frame_hole_length + 70 + FRAME_SIDE_LENGTH;

X_smooth_rod_length = horizontal_frame_hole_length +
    2 * ceil(ROD_SUPPORT_LENGTH);        /**< Length of X axis smooth rods. */
//Y_smooth_rod_length = 270;         /**< Length of Y axis smooth rods. */
Y_smooth_rod_length = y_working_distance +
    Y_CARRIAGE_LENGTH +
    2 * Y_ROD_CLAMP_LENGTH +
    BED_FRAME_WIDTH_N;         /**< Length of Y axis smooth rods. */
Z_smooth_rod_length = vertical_frame_hole_length +
    2 * ceil(ROD_SUPPORT_LENGTH);        /**< Length of Z axis smooth rods. */


include <colors.scad>
