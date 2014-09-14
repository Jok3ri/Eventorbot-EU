/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * Colour configuration
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

/// \file colors.scad Colour configuration file for Eventorbot
/// machine. Use the with the "include" directive.

grey20 = [0.2, 0.2, 0.2];
grey40 = [0.4, 0.4, 0.4];
grey60 = [0.6, 0.6, 0.6];
grey80 = [0.8, 0.8, 0.8];

rod_color = grey80;

/**
 * Depending on configuration make plastic parts use the same or
 * different colours for plastic parts. 
 * 
 * @param colour Colour to return unless use_realistic_colors is true.
 */
function plastic_color(colour) = use_realistic_colors ? printed_plastic_color : colour;

x_carrige_color = plastic_color("OrangeRed");
clamp_color = plastic_color("LawnGreen");

