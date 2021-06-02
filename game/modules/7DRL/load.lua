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

-- This file loads the game module, and loads data
local KeyBind = require "engine.KeyBind"
local DamageType = require "engine.DamageType"
local ActorStats = require "engine.interface.ActorStats"
local ActorResource = require "engine.interface.ActorResource"
local ActorTalents = require "engine.interface.ActorTalents"
local ActorAI = require "engine.interface.ActorAI"
local ActorLevel = require "engine.interface.ActorLevel"
local ActorTemporaryEffects = require "engine.interface.ActorTemporaryEffects"
local Birther = require "engine.Birther"
local ActorInventory = require "engine.interface.ActorInventory"

-- Useful keybinds
KeyBind:load("move,hotkeys,inventory,actions,interface,debug")

-- Stone style ui (simple, stone and metal also options)
local UIBase = require "engine.ui.Base"
UIBase.ui = "pixelstone"
UIBase.font = core.display.newFont("/data/general/font/Ac437_IBM_CGA.ttf", 12)
UIBase.font_mono = core.display.newFont("/data/general/font/Ac437_IBM_CGA.ttf", 12)
UIBase.font_bold = core.display.newFont("/data/general/font/Ac437_IBM_CGA.ttf", 12)
UIBase.font_h = UIBase.font:lineSkip()
UIBase.font_bold_h = UIBase.font_bold:lineSkip()
UIBase.font_mono_w = UIBase.font_mono:size(" ")
UIBase.font_mono_h = UIBase.font_mono:lineSkip()+2

-- Additional entities resolvers
dofile("/mod/resolvers.lua")

-- Damage types
DamageType:loadDefinition("/data/damage_types.lua")

-- Talents
ActorTalents:loadDefinition("/data/talents.lua")

-- Timed Effects
ActorTemporaryEffects:loadDefinition("/data/timed_effects.lua")

-- Actor resources
ActorResource:defineResource("Power", "power", nil, "power_regen", "Power represent your ability to use special talents.")

-- Actor stats
ActorStats:defineStat("Strength",	"str", 10, 1, 100, "Strength defines your character's ability to apply physical force. It increases your melee damage, damage with heavy weapons, your chance to resist physical effects, and carrying capacity.")
ActorStats:defineStat("Dexterity",	"dex", 10, 1, 100, "Dexterity defines your character's ability to be agile and alert. It increases your chance to hit, your ability to avoid attacks and your damage with light weapons.")
ActorStats:defineStat("Constitution",	"con", 10, 1, 100, "Constitution defines your character's ability to withstand and resist damage. It increases your maximum life and physical resistance.")

-- Actor Equipment
ActorInventory:defineInventory("MAIN_HAND", "Main Hand", true, "Main Hand")
ActorInventory:defineInventory("OFF_HAND", "Off Hand", true, "Off Hand")
ActorInventory:defineInventory("ARMOR_SLOT", "Armor", true, "Full body Armor")
ActorInventory:defineInventory("COMBAT_BOOK", "Combat Book", true, "Book of beneficial buffs")

-- Actor AIs
ActorAI:loadDefinition("/engine/ai/")

-- Birther descriptor
Birther:loadDefinition("/data/birth/descriptors.lua")



-- Colors
defineColor('CP1_DarkBlue', 24, 23, 38)
defineColor('CP1_Gray', 47, 54, 64)
defineColor('CP1_Salmon', 166, 106, 93)
defineColor('CP1_Brown', 115, 90, 85)
defineColor('CP1_BurntOrange', 217, 107, 98)
defineColor('CP2_Orange', 217, 89, 61)
defineColor('CP2_DarkOrange', 140, 82, 68)
defineColor('CP2_Red', 242, 82, 68)
defineColor('CP2_DarkRed', 166, 73, 65)
defineColor('CP2_Brown', 89, 61, 59)


return {require "mod.class.Game" }
