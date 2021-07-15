-- ToME - Tales of Middle-Earth
-- Copyright (C) 2009, 2010, 2011, 2012 Nicolas Casalini
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

local UIBase = require "engine.ui.Base"
UIBase.ui = "pixelstone"
UIBase.font = core.display.newFont("/data/general/font/Ac437_IBM_CGA.ttf", 12)
UIBase.font_mono = core.display.newFont("/data/general/font/Ac437_IBM_CGA.ttf", 12)
UIBase.font_bold = core.display.newFont("/data/general/font/Ac437_IBM_CGA.ttf", 12)
UIBase.font_h = UIBase.font:lineSkip()
UIBase.font_bold_h = UIBase.font_bold:lineSkip()
UIBase.font_mono_w = UIBase.font_mono:size(" ")
UIBase.font_mono_h = UIBase.font_mono:lineSkip()+2

local n = core.noise.new(2)
_2DNoise = n:makeTexture2D(64, 64)

UIBase:setTextShadow(0.6)

-- Usefull keybinds
KeyBind:load("move,hotkeys,inventory,actions,interface,debug")

return {require "mod.class.Game" }
