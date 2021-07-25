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

require "engine.class"
local DamageType = require "engine.DamageType"
local Map = require "engine.Map"
local Target = require "engine.Target"
local Talents = require "engine.interface.ActorTalents"

--- Interface to add ToME combat system
module(..., package.seeall, class.make)

--- Checks what to do with the target
-- Talk ? attack ? displace ?
function _M:bumpInto(target)
	local reaction = self:reactionToward(target)
	if reaction < 0 then
		return self:attackTarget(target)
	elseif reaction >= 0 then
		if self.move_others then
			-- Displace
			game.level.map:remove(self.x, self.y, Map.ACTOR)
			game.level.map:remove(target.x, target.y, Map.ACTOR)
			game.level.map(self.x, self.y, Map.ACTOR, target)
			game.level.map(target.x, target.y, Map.ACTOR, self)
			self.x, self.y, target.x, target.y = target.x, target.y, self.x, self.y
		end
	end
end

--- Makes the death happen!
function _M:attackTarget(target, mult)
	local weaponMH = self:hasWeapon("main")
	local armorEquip = target:hasArmor()

	local armor = armorEquip.combat.armor+target.combat.armor*0.1
	local dr = armorEquip.combat.damage_reduction+target.combat.damage_reduction

	if self.combat then
		DamageType:get(DamageType.PHYSICAL).projector(self, target.x, target.y, DamageType.PHYSICAL, math.max(0, self:getCharBonus("physical")+weaponMH.combat.physical_damage+weaponMH.combat.bonus_damage+self:GetCombatBookDamage("physical")-(weaponMH.combat.physical_damage*getResistance(target,"physical")))-armor-dr)
		--DamageType:get(DamageType.PHYSICAL).projector(self, target.x, target.y, DamageType.PHYSICAL, math.max(0, 0))
		DamageType:get(DamageType.FIRE).projector(self, target.x, target.y, DamageType.FIRE, math.max(0, self:getCharBonus("fire")+weaponMH.combat.fire_damage+self:GetCombatBookDamage("fire")-(weaponMH.combat.fire_damage*getResistance(target,"fire")))-armor-dr)
		DamageType:get(DamageType.COLD).projector(self, target.x, target.y, DamageType.COLD, math.max(0, self:getCharBonus("cold")+weaponMH.combat.cold_damage+self:GetCombatBookDamage("cold")-(weaponMH.combat.cold_damage*getResistance(target,"cold")))-armor-dr)
		DamageType:get(DamageType.ARCANE).projector(self, target.x, target.y, DamageType.ARCANE, math.max(0, self:getCharBonus("arcane")+weaponMH.combat.arcane_damage+self:GetCombatBookDamage("arcane")-(weaponMH.combat.arcane_damage*getResistance(target,"arcane")))-armor-dr)
		DamageType:get(DamageType.HOLY).projector(self, target.x, target.y, DamageType.HOLY, math.max(0, self:getCharBonus("holy")+weaponMH.combat.holy_damage+self:GetCombatBookDamage("holy")-(weaponMH.combat.holy_damage*target.getResistance(target,"holy")))-armor-dr)
		DamageType:get(DamageType.UNHOLY).projector(self, target.x, target.y, DamageType.UNHOLY, math.max(0, self:getCharBonus("unholy")+weaponMH.combat.unholy_damage+self:GetCombatBookDamage("unholy")-(weaponMH.combat.unholy_damage*getResistance(target,"unholy")))-armor-dr)
	end

	-- We use up our own energy
	self:useEnergy(game.energy_to_act)
	if self.energy.mod > 0 then
		self.energy.mod = 1
	end
end


function _M:hasWeapon(type)
	if type == "main" then
		if not self:getInven("MAIN_HAND") then 
			unarmed = {
				combat = {
					physical_damage = 0,
					fire_damage = 0,
					cold_damage = 0,
					arcane_damage = 0,
					holy_damage = 0,
					unholy_damage = 0,
					bonus_damage = 0,
				},
			}
			return unarmed
		end
		local weapon = self:getInven("MAIN_HAND")[1]
		return weapon
	end
	if type == "off" then
		if not self:getInven("OFF_HAND") then return end
		local weapon = self:getInven("OFF_HAND")[1]
		if not weapon or not weapon.combat then
			unarmed = {
				combat = {
					physical_damage = 0,
					fire_damage = 0,
					cold_damage = 0,
					arcane_damage = 0,
					holy_damage = 0,
					unholy_damage = 0,
					bonus_damage = 0,
				},
			}
			return unarmed
		end
		return weapon
	end
end

function _M:hasArmor()
	if not self:getInven("ARMOR_SLOT") then
		unequipped = {
			combat = {
				armor = 0,
				damage_reduction = 0,
			},
		}
		return unequipped
	end
	local armor = self:getInven("ARMOR_SLOT")[1]
	return armor
end

function getResistance(target, resType)
	local resistance = 0
	local counter = 0
	if target:getInven("ARMOR_SLOT") then
		resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.bonus_resistance
	end
	if target:getInven("OFF_HAND") then
		resistance = resistance + target:getInven("OFF_HAND")[1].resistances.bonus_resistance
	end
	if resType == "physical" then
		resistance = target.resistances.physical_resistance
		if target:getInven("ARMOR_SLOT") then
		resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.physical_resistance
		end
		if target:getInven("OFF_HAND") then
			resistance = resistance + target:getInven("OFF_HAND")[1].resistances.physical_resistance
		end
		if target:getInven("COMBAT_BOOK") then
			for x in pairs(target:getInven("COMBAT_BOOK")) do
				counter = counter + 1
				if target:getInven("COMBAT_BOOK")[counter] then
					resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.physical_resistance
				end
			end
		end
	elseif resType == "fire" then
		resistance = target.resistances.fire_resistance
		if target:getInven("ARMOR_SLOT") then
		resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.fire_resistance
		end
		if target:getInven("OFF_HAND") then
			resistance = resistance + target:getInven("OFF_HAND")[1].resistances.fire_resistance
		end
	elseif resType == "arcane" then
		resistance = target.resistances.fire_resistance
		if target:getInven("ARMOR_SLOT") then
		resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.arcane_resistance
		end
		if target:getInven("OFF_HAND") then
			resistance = resistance + target:getInven("OFF_HAND")[1].resistances.arcane_resistance
		end
		if target:getInven("COMBAT_BOOK") then
			for x in pairs(target:getInven("COMBAT_BOOK")) do
				counter = counter + 1
				if target:getInven("COMBAT_BOOK")[counter] then
					resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.arcane_resistance
				end
			end
		end
	elseif resType == "cold" then
		resistance = target.resistances.cold_resistance
		if target:getInven("ARMOR_SLOT") then
		resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.cold_resistance
		end
		if target:getInven("OFF_HAND") then
			resistance = resistance + target:getInven("OFF_HAND")[1].resistances.cold_resistance
		end
	elseif resType == "holy" then
		resistance = target.resistances.holy_resistance
		if target:getInven("ARMOR_SLOT") then
		resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.holy_resistance
		end
		if target:getInven("OFF_HAND") then
			resistance = resistance + target:getInven("OFF_HAND")[1].resistances.holy_resistance
		end
		if target:getInven("COMBAT_BOOK") then
			for x in pairs(target:getInven("COMBAT_BOOK")) do
				counter = counter + 1
				if target:getInven("COMBAT_BOOK")[counter] then
					resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.holy_resistance
				end
			end
		end
	elseif resType == "unholy" then
		resistance = target.resistances.unholy_resistance
		if target:getInven("ARMOR_SLOT") then
		resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.unholy_resistance
		end
		if target:getInven("OFF_HAND") then
			resistance = resistance + target:getInven("OFF_HAND")[1].resistances.unholy_resistance
		end
		if target:getInven("COMBAT_BOOK") then
			for x in pairs(target:getInven("COMBAT_BOOK")) do
				counter = counter + 1
				if target:getInven("COMBAT_BOOK")[counter] then
					resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.unholy_resistance
				end
			end
		end
	end	
	return resistance
end

function _M:getCharBonus(type)
	local damageBonus = 0
	if type == "physical" then
		if self.combat.physical_damage > 0 then
			damageBonus = damageBonus + self.combat.physical_damage
			return damageBonus
		end
	end
	if type == "fire" then
		if self.combat.fire_damage > 0 then
			damageBonus = damageBonus + self.combat.fire_damage
			return damageBonus
		end
	end
	if type == "cold" then
		if self.combat.cold_damage > 0 then
			damageBonus = damageBonus + self.combat.cold_damage
			return damageBonus
		end
	end
	if type == "arcane" then
		if self.combat.arcane_damage > 0 then
			damageBonus = damageBonus + self.combat.arcane_damage
			return damageBonus
		end
	end
	if type == "holy" then
		if self.combat.holy_damage > 0 then
			damageBonus = damageBonus + self.combat.holy_damage
			return damageBonus
		end
	end
	if type == "unholy" then
		if self.combat.unholy_damage > 0 then
			damageBonus = damageBonus + self.combat.unholy_damage
			return damageBonus
		end
	end
	return damageBonus
end

function _M:GetCombatBookDamage(type) 
	local damageBonus = 0
	local counter = 0
	if not self:getInven("COMBAT_BOOK") then return end
	if type == "physical" then
		for x in pairs(self:getInven("COMBAT_BOOK")) do
			counter = counter + 1
			if self:getInven("COMBAT_BOOK")[counter] then
				damageBonus = damageBonus + self:getInven("COMBAT_BOOK")[counter].combat.physical_damage
			end
		end
		return damageBonus
	end
	if type == "fire" then
		for x in pairs(self:getInven("COMBAT_BOOK")) do
			counter = counter + 1
			if self:getInven("COMBAT_BOOK")[counter] then
				damageBonus = damageBonus + self:getInven("COMBAT_BOOK")[counter].combat.fire_damage
			end
		end
		return damageBonus
	end
	if type == "cold" then
		for x in pairs(self:getInven("COMBAT_BOOK")) do
			counter = counter + 1
			if self:getInven("COMBAT_BOOK")[counter] then
				damageBonus = damageBonus + self:getInven("COMBAT_BOOK")[counter].combat.cold_damage
			end
		end
		return damageBonus
	end
	if type == "arcane" then
		for x in pairs(self:getInven("COMBAT_BOOK")) do
			counter = counter + 1
			if self:getInven("COMBAT_BOOK")[counter] then
				damageBonus = damageBonus + self:getInven("COMBAT_BOOK")[counter].combat.arcane_damage
			end
		end
		return damageBonus
	end
	if type == "holy" then
		for x in pairs(self:getInven("COMBAT_BOOK")) do
			counter = counter + 1
			if self:getInven("COMBAT_BOOK")[counter] then
				damageBonus = damageBonus + self:getInven("COMBAT_BOOK")[counter].combat.holy_damage
			end
		end
		return damageBonus
	end
	if type == "unholy" then
		for x in pairs(self:getInven("COMBAT_BOOK")) do
			counter = counter + 1
			if self:getInven("COMBAT_BOOK")[counter] then
				damageBonus = damageBonus + self:getInven("COMBAT_BOOK")[counter].combat.unholy_damage
			end
		end
		return damageBonus
	end
	if type == "bonus" then
		for x in pairs(self:getInven("COMBAT_BOOK")) do
			counter = counter + 1
			if self:getInven("COMBAT_BOOK")[counter] then
				damageBonus = damageBonus + self:getInven("COMBAT_BOOK")[counter].combat.bonus_damage
			end
		end
		return damageBonus
	end
	return damageBonus
end