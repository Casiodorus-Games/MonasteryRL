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
	name = "The Belfry",
	level_range = {1, 1},
	max_level = 10,
	decay = {300, 800},
	width = 35, height = 35,
--	persistent = "zone",
	generator =  {
		map = {
			class = "engine.generator.map.Roomer",
			nb_rooms = 15,
			rooms = {"simple", "pilar", "corner"},
			lite_room_chance = 100,
			['.'] = "FLOOR",
			['#'] = "WALL",
			up = "UP",
			down = "DOWN",
			door = "DOOR",
		},
		actor = {
			class = "engine.generator.actor.Random",
			nb_npc = {5, 12},
--			guardian = "SHADE_OF_ANGMAR", -- The guardian is set in the static map
		},
		object = {
		},
	},
	levels =
	{
		[1] = {
			generator = {
				map = {
					class = "engine.generator.map.Roomer",
					nb_rooms = 10,
					rooms = {"simple", "pilar"},
					lite_room_chance = 100,
					['.'] = "FLOOR",
					['#'] = "WALL",
					up = "UP_MONASTERY",
					down = "DOWN",
					door = "DOOR",
				},
				actor = {
					class = "engine.generator.actor.Random",
					nb_npc = {3, 7},
		--			guardian = "SHADE_OF_ANGMAR", -- The guardian is set in the static map
				},
				object = {
				},
			},
		},
		[3] = {
			generator = {
				map = {
					class = "engine.generator.map.Roomer",
					nb_rooms = 10,
					rooms = {"simple", "pilar"},
					lite_room_chance = 100,
					['.'] = "FLOOR",
					['#'] = "WALL",
					up = "UP",
					down = "UP_NORTH_BELLTOWER_BOSS",
					door = "DOOR",
				},
			},
		},
	},
	post_process = function(level)
		if north_belfrey == true then
			north_belfrey = false
			game.chatLog("You enter the Northern Belfrey.")
		end
	end
}
