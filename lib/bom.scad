/* -*- mode: scad; c-basic-offset: 4; c-file-style: "k&r"; indent-tabs-mode: nil -*-
 *
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

/// \file bom.scad Utility modules for building BOM. Inspired by Chris
/// Palmer's Mendel90 bom.scad.


module bom_fff()
{
    echo (str ("BOM: FFF ", parent_module ()));
}

module assembly(name="UNKNOWN")
{
    //if (BOM > 0)
        echo (str ("BOM: assembly ", parent_module () ? parent_module () : name, "/"));
}

module end(name="UNKNOWN")
{
    //if (BOM > 0)
        echo(str("BOM: assembly /", parent_module () ? parent_module () : name));
}
