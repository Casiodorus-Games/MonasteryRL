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

newEntity{
	define_as = "UP_MONASTERY",
	name = "Exit to the Monastery",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "monastery",
}

newEntity{
	define_as = "UP_NORTH_BELLTOWER",
	name = "Exit to the Belltower",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "north_belltower",
}

newEntity{
	define_as = "UP_NORTH_BELLTOWER_BOSS",
	name = "boss",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "north_belltower_boss",
}

newEntity{
	define_as = "UP_SOUTH_BELLTOWER",
	name = "exit to the wilds",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "south_belltower",
}

newEntity{
	define_as = "UP_SOUTH_BELLTOWER_BOSS",
	name = "boss",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "south_belltower_boss",
}

newEntity{
	define_as = "UP_CRYPT",
	name = "exit to the crypts",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "crypt",
}

newEntity{
	define_as = "UP_CRYPT_BOSS",
	name = "boss room",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "crypt_boss",
}

newEntity{
	define_as = "UP_INNERSANCTUM",
	name = "Inner Sanctum",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	always_remember = true,
	notice = true,
	change_level = 1,
	change_zone = "innerSanctum",
}

newEntity{
	define_as = "UP",
	name = "previous level",
	display = '<', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	notice = true,
	always_remember = true,
	change_level = -1,
}

newEntity{
	define_as = "DOWN",
	name = "next level",
	display = '>', color_r=242, color_g=82, color_b=68, back_color=colors.CP1_Gray,
	notice = true,
	always_remember = true,
	change_level = 1,
}

newEntity{
	define_as = "FLOOR",
	name = "floor", image = "terrain/marble_floor.png",
	display = ' ', color_r=255, color_g=255, color_b=255, back_color=colors.CP1_Gray,
}

newEntity{
	define_as = "DIRT",
	name = "dirt floor", image = "terrain/marble_floor.png",
	display = ' ', color_r=255, color_g=255, color_b=255, back_color=colors.CP2_Brown,
}

newEntity{
	define_as = "WALL",
	name = "wall", image = "terrain/granite_wall1.png",
	display = '#', color_r=217, color_g=107, color_b=98, back_color=colors.CP1_Gray,
	always_remember = true,
	does_block_move = true,
	can_pass = {pass_wall=1},
	block_sight = true,
	air_level = -20,
	dig = "FLOOR",
}

newEntity{
	define_as = "DOOR",
	name = "door", image = "terrain/granite_door1.png",
	display = '+', color_r=238, color_g=154, color_b=77, back_color=colors.CP1_Gray,
	notice = true,
	always_remember = true,
	block_sight = true,
	door_opened = "DOOR_OPEN",
	dig = "DOOR_OPEN",
}

newEntity{
	define_as = "TREE",
	name = "tree",
	display = '♠', color_r=147, color_g=168, color_b=137, back_color=colors.CP2_Brown,
	block_sight = true,
	does_block_move = true,
	always_remember = true,
}

newEntity{
	define_as = "DOOR_OPEN",
	name = "open door", image = "terrain/granite_door1_open.png",
	display = "'", color_r=238, color_g=154, color_b=77, back_color=colors.CP1_Gray,
	always_remember = true,
	door_closed = "DOOR",
}

newEntity{
	define_as = "DOOR_LOCKED",
	name = "door",
	display = '■', color_r=238, color_g=0, color_b=0, back_color=colors.CP1_Gray,
	notice = true,
	always_remember = true,
	block_sight = false,
	is_door = true,
	-- Blocks the player from moving through the door if they dont have the required item
	block_move = function(self, x, y, who, act)
		-- Getting the player. This may not be necessary. Might be able to just use self.
		local player = game.player
		-- Checking the player inventory for the required key.
		if act and player:findInAllInventoriesBy('define_as', 'KEY_INNERSANCTUM') then
			-- Debug message
			game.chatLog("You insert the gem into the slot and the alter slides back revealing a staircase!")
			-- Converting the locked door into the unlocked door
			local spot = game.level:pickSpot{type="door", subtype="intnersactum"}
			local g = game.zone:makeEntityByName(game.level, "terrain", "UP_INNERSANCTUM")
			game.zone:addEntity(game.level, g, "terrain", spot.x, spot.y)
			-- Need code to remove the key after its been used.
			-- Allowing the player to pass through
			return false
		end
		-- If the player doesnt have the key, give them a message.
		if act and not player:findInAllInventoriesBy('define_as',"KEY_INNERSANCTUM")
		then
			game.chatLog("You approach the alter, and notice a gem is missing from the front.")
			return true
		end
	end,
}
