/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
 * A linear rod support element (right sided).
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

/// \file p016.scad A rod support element with a cable holder on the
/// \em right and its mounting nuts and bolts.

use <../lib/bom.scad>
include <rod_support.scad>

/**
 * Rod support, handle on the \em right
 */
module p016 ()
{
    rod_support (side = "right");
    bom_fff();
}

/** Mounting nuts and bolts for p016
 *
 * @param length See rod_support_mounting()
 *
 * @param bom See rod_support_mounting()
 */
module p016_mounting (length = 0.0, bom = true)
{
    rod_support_mounting (length=length, side = "right", bom = bom);
}
