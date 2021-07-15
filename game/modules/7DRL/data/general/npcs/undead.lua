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

local Talents = require("engine.interface.ActorTalents")

newEntity{
	define_as = "BASE_NPC_UNDEAD",
	type = "humanoid", subtype = "undead",
	display = "u", color=colors.WHITE,
	desc = "a basic undead",
	body = { INVEN = 10, MAIN_HAND = 1, ARMOR_SLOT = 1, COMBAT_BOOK = 1},
	ai = "dumb_talented_simple", ai_state = { talent_in=3, },
	stats = { str=5, dex=5, con=5 },
	combat_armor = 0,
	resolvers.equip{
		{type="weapon", subtype="longsword", autoreq=true},
		{name = "Tattered Rags", autoreq=true},
	},
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
        physical_damage =  0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_NPC_UNDEAD",
	name = "Undead", color=colors.WHITE,
	level_range = {1, 4}, exp_worth = 1,
	rarity = 1,
	max_life = resolvers.rngavg(5,9),
	combat = { dam=2 },
}