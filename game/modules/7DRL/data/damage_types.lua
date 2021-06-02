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

-- The basic stuff used to damage a grid
setDefaultProjector(function(src, x, y, type, dam)
	if dam < 0 then
		dam = 0
	end
	local target = game.level.map(x, y, Map.ACTOR)
	if target then
		local flash = game.flash.NEUTRAL
		if target == game.player then 
			flash = game.flash.BAD 
			nameColor = "#RED#"
		end
		if src == game.player then 
			flash = game.flash.GOOD 
			nameColor = "#GREEN#"
		end
		if dam > 0 then
			game.combatSeen(target, flash, nameColor.."%s#LAST# hits %s for %s%0.2f %s damage#LAST#.", src.name:capitalize(), target.name, DamageType:get(type).text_color or "#aaaaaa#", dam, DamageType:get(type).name)
			--game.combatLog(target.name.." HP: "..target.life)
			--game.combatLog(target.name.."level"..target.level)
		end
			local sx, sy = game.level.map:getTileToScreen(x, y)
		if target:takeHit(dam, src) then
			if src == game.player or target == game.player then
				game.flyers:add(sx, sy, 30, (rng.range(0,2)-1) * 0.5, -3, "Kill!", {255,0,255})
				game.combatLog(target.name.." has been killed!")
			end
		else
			if dam > 0 then
				if src == game.player then
					game.flyers:add(sx, sy, 30, (rng.range(0,5)-1) * 0.5, -3, tostring(-math.ceil(dam)), DamageType:get(type).rgb)
				elseif target == game.player then
					game.flyers:add(sx, sy, 30, (rng.range(0,5)-1) * 0.5, 3, tostring(-math.ceil(dam)), DamageType:get(type).rgb)
				end
			end
		end
		return dam
	end
	return 0
end)

newDamageType{
	name = "physical", type = "PHYSICAL", text_color = "#LIGHT_SLATE#", rgb={209,209,209},
}

newDamageType{
	name = "fire", type = "FIRE", text_color = "#PINK#", rgb={255,192,203},
}

newDamageType{
	name = "cold", type = "COLD", text_color = "#LIGHT_BLUE#", rgb={81,221,255},
}

newDamageType{
	name = "arcane", type = "ARCANE", text_color = "#VIOLET#", rgb={192,0,175},
}

newDamageType{
	name = "holy", type = "HOLY", text_color = "#MOCCASIN#", rgb={255,228,181},
} 

newDamageType{
	name = "unholy", type = "UNHOLY", text_color = "#STEEL_BLUE#", rgb={70,130,180},
}

-- Acid destroys potions
newDamageType{
	name = "acid", type = "ACID", text_color = "#GREEN#", rgb={0,134,69},
}
