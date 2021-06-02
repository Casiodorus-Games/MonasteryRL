-- ToME - Tales of Middle-Earth
-- Copyright (C) 2009 - 2019 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

return {
	name = "The Inner Sanctum",
	level_range = {1, 1},
	max_level = 10,
	decay = {300, 800},
	width = 25, height = 25,
	persistent = "zone",
	all_lited = true,
	all_remembered = true,
	generator =  {
		map = {
			class = "engine.generator.map.Static",
			map = "innersanctum",
		},
		actor = {
		},
		object = {
		},
	},
	levels =
	{
	},
}
