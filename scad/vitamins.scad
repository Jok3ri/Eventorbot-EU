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


include <config.scad>

module rod(d, l)
{
    echo (str ("BOM: vitamin Smooth rod ", d, "mm x ", round(l), "mm"));
    color (rod_color)
        cylinder (d=d, h=l);
}

LM08UU = [24, 15, 8];

module linear_bearing(type)
{
    L = type[0];
    D = type[1];
    d = type[2];
    echo (str ("BOM vitamin LM", d, "UU linear bearing"));
    color (bearing_color)
        translate ([0, 0, L / 2])
        difference ()
    {
        cylinder (d = D, h = L, center = true);
        cylinder (d = d, h = L + 1, center = true);
    }
}
