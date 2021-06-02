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

newBirthDescriptor{
	type = "base",
	name = "base",
	desc = {
	},
	experience = 1.0,
	body = { INVEN = 10, MAIN_HAND = 1, OFF_HAND = 1, ARMOR_SLOT = 1, COMBAT_BOOK = 5,},
	copy = {
		max_level = 10,
		lite = 4,
		max_life = 20,
		resistances = {
			physical_resistance = 0,
			fire_resistance = 0,
			cold_resistance = 0,
			arcane_resistance = 0,
			holy_resistance = 0,
			unholy_resistance = 0,
			bonus_resistance = 0,
		},
		combat = {
			armor = 0,
			damage_reduction = 0,
		},
	},

}

newBirthDescriptor{
	type = "role",
	name = "Generic Class",
	desc =
	{
		"Crashhhhh!",
	},
	talents = {
	},
	copy = {
		resolvers.equip{ 
			full_id=true,
			{type="weapon", subtype="longsword", autoreq=true},
			{name = "Paladins Plate", autoreq=true},
			{name = "Round Shield", autoreq=true},
		},
	},
}