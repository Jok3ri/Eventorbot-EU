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

X_smooth_rod_length = 270; /**< Length of X axis smooth rod. */
Y_smooth_rod_length = 270; /**< Length of X axis smooth rod. */
Z_smooth_rod_length = 270; /**< Length of X axis smooth rod. */

with_ball_screw = false;   /**< Build the machine with a ball screw
			        for z axis drive instead of a threaded
			        rod, */

printed_plastic_color = "orange"; /**< Common colour for all printed parts */
use_realistic_colors = false;     /**< Use one colour for all plastic parts */
include <colors.scad>
