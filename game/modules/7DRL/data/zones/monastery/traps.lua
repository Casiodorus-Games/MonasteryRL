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

local Dialog = require "engine.ui.Dialog"

newEntity{ define_as = "ENTERANCE",
	type = "game_messages", subtype="game_messages", id_by_type=true, unided_name = "game_messages",
	detect_power = 999999, disarm_power = 999999,
	desc = [[A Game Message]],
	display = ' ', color=colors.WHITE,
    message = false,
	triggered = function(self, x, y, who)
		if who.player then
--			game.player:runStop()
--			local d = require("engine.dialogs.ShowText").new("Tutorial: "..self.name, "tutorial/"..self.text)
--			game:registerDialog(d)
            if not game.gameMessage_entrance then
                game.chatLog("As you step forth into the Monastery, you can smell the infestation taking root")
                game.gameMessage_entrance = true
            end
		end
		return false, false
	end
}

newEntity{ define_as = "TUTORIAL_DESCEND",
	type = "game_messages", subtype="game_messages", id_by_type=true, unided_name = "game_messages",
	detect_power = 999999, disarm_power = 999999,
	desc = [[A Game Message]],
	display = ' ', color=colors.WHITE,
    message = false,
	triggered = function(self, x, y, who)
		if who.player then
            if not game.gameTutorial_stairs then
                Dialog:simplePopup("Tutorial","Press Shift+> to traverse floors when over a < or >")
                game.gameTutorial_stairs = true
            end
		end
		return false, false
	end
}

newEntity{ define_as = "TUTORIAL_PICKUP",
	type = "game_messages", subtype="game_messages", id_by_type=true, unided_name = "game_messages",
	detect_power = 999999, disarm_power = 999999,
	desc = [[A Game Message]],
	display = ' ', color=colors.WHITE,
    message = false,
	triggered = function(self, x, y, who)
		if who.player then
            if not game.gameTutorial_pickup then
				--Dialog:simplePopup("Tutorial","Press I to open inventory and equip items.")
                Dialog:simplePopup("Tutorial","Press G to pick up items.")
                game.gameTutorial_pickup = true
            end
		end
		return false, false
	end
}

newEntity{ define_as = "TUTORIAL_EQUIP",
	type = "game_messages", subtype="game_messages", id_by_type=true, unided_name = "game_messages",
	detect_power = 999999, disarm_power = 999999,
	desc = [[A Game Message]],
	display = ' ', color=colors.WHITE,
    message = false,
	triggered = function(self, x, y, who)
		if who.player then
            if game.gameTutorial_pickup and not game.gameTutorial_equip then
				Dialog:simplePopup("Tutorial","Press I to open inventory and equip items.")
                game.gameTutorial_equip = true
            end
		end
		return false, false
	end
}
