require "engine.class"

local Dialog = require "engine.ui.Dialog"
local Talents = require "engine.interface.ActorTalents"
local SurfaceZone = require "engine.ui.SurfaceZone"
local Stats = require "engine.interface.ActorStats"
local Textzone = require "engine.ui.Textzone"

module(..., package.seeall, class.inherit(Dialog))

function _M:init(actor)
    self.actor = actor
    
    self.font = core.display.newFont("/data/general/font/Ac437_IBM_CGA.ttf", 10)
    Dialog.init(self, "Character Sheet: ", math.max(game.w * 0.7, 950), 500, nil, nil, font)
    
    self.c_desc = SurfaceZone.new{width=self.iw, height=self.ih,alpha=0}

    self:loadUI{
        {left=0, top=0, ui=self.c_desc},
    }
    
    self:setupUI()
    
    self:drawDialog()
    
    self.key:addBind("EXIT", function() cs_player_dup = game.player:clone() game:unregisterDialog(self) end)
end

function _M:drawDialog()
    local player = self.actor
    local s = self.c_desc.s

    s:erase(0,0,0,0)

    local h = 0
    local w = 0

    h = 0
    w = 0
    s:drawStringBlended(self.font, "Name : Renault", w, h, 255, 255, 255, true) h = h + self.font_h
    s:drawStringBlended(self.font, "Role : Paladin of the Holy Order", w, h, 255, 255, 255, true) h = h + self.font_h
        
    h = h + self.font_h -- Adds an empty row
    
    h = 0
    w = self.w * 0.25 
    -- start on second column
        
    --s:drawStringBlended(self.font, "STR : "..(player:getStr()), w, h, 0, 255, 255, true) h = h + self.font_h
    --s:drawStringBlended(self.font, "DEX : "..(player:getDex()), w, h, 255, 0, 255, true) h = h + self.font_h
    --s:drawStringBlended(self.font, "CON : "..(player:getCon()), w, h, 255, 255, 0, true) h = h + self.font_h
    
    h = 0
    w = self.w * 0.50 
    -- start on second column
        
    s:drawStringBlended(self.font, "Physical Resistance : "..(getResistance(player, "physical")*100).."%", w, h, 209,209,209, true) h = h + self.font_h
    s:drawStringBlended(self.font, "Pierce Resistance : "..(getResistance(player, "pierce")*100).."%", w, h, 201,0,0, true) h = h + self.font_h
    s:drawStringBlended(self.font, "Fire Resistance : "..(getResistance(player, "fire")*100).."%", w, h, 255,192,203, true) h = h + self.font_h
    s:drawStringBlended(self.font, "Cold Resistance : "..(getResistance(player, "cold")*100).."%", w, h, 81,221,255, true) h = h + self.font_h
    s:drawStringBlended(self.font, "Arcane Resistance : "..(getResistance(player, "arcane")*100).."%", w, h, 192,0,175, true) h = h + self.font_h
    s:drawStringBlended(self.font, "Holy Resistance : "..(getResistance(player, "holy")*100).."%", w, h, 255,228,181, true) h = h + self.font_h
    s:drawStringBlended(self.font, "Unholy Resistance : "..(getResistance(player, "unholy")*100).."%", w, h, 70,130,180, true) h = h + self.font_h



    self.c_desc:generate()
    self.changed = false
end 

function getResistance(target, resType)
	local resistance = 0
	if resType == "physical" then
		resistance = target.resistances.physical_resistance
		if target:getInven("BODY_SLOT") then
		resistance = resistance + target:getInven("BODY_SLOT")[1].resistances.physical_resistance
		end
		if target:getInven("HEAD_SLOT") then
			resistance = resistance +  target:getInven("HEAD_SLOT")[1].resistances.physical_resistance
		end
		if target:getInven("HAND_SLOT") then
			resistance = resistance + target:getInven("HAND_SLOT")[1].resistances.physical_resistance
		end
		if target:getInven("LEG_SLOT") then
			resistance = resistance + target:getInven("LEG_SLOT")[1].resistances.physical_resistance
		end
	elseif resType == "fire" then
		resistance = target.resistances.fire_resistance
		if target:getInven("BODY_SLOT") then
			resistance = resistance + target:getInven("BODY_SLOT")[1].resistances.fire_resistance
			end
			if target:getInven("HEAD_SLOT") then
				resistance = resistance +  target:getInven("HEAD_SLOT")[1].resistances.fire_resistance
			end
			if target:getInven("HAND_SLOT") then
				resistance = resistance + target:getInven("HAND_SLOT")[1].resistances.fire_resistance
			end
			if target:getInven("LEG_SLOT") then
				resistance = resistance + target:getInven("LEG_SLOT")[1].resistances.fire_resistance
			end
	elseif resType == "cold" then
		resistance = target.resistances.cold_resistance
		if target:getInven("BODY_SLOT") then
			resistance = resistance + target:getInven("BODY_SLOT")[1].resistances.cold_resistance
			end
			if target:getInven("HEAD_SLOT") then
				resistance = resistance +  target:getInven("HEAD_SLOT")[1].resistances.cold_resistance
			end
			if target:getInven("HAND_SLOT") then
				resistance = resistance + target:getInven("HAND_SLOT")[1].resistances.cold_resistance
			end
			if target:getInven("LEG_SLOT") then
				resistance = resistance + target:getInven("LEG_SLOT")[1].resistances.cold_resistance
			end
	elseif resType == "holy" then
		resistance = target.resistances.holy_resistance
		if target:getInven("BODY_SLOT") then
			resistance = resistance + target:getInven("BODY_SLOT")[1].resistances.holy_resistance
			end
			if target:getInven("HEAD_SLOT") then
				resistance = resistance +  target:getInven("HEAD_SLOT")[1].resistances.holy_resistance
			end
			if target:getInven("HAND_SLOT") then
				resistance = resistance + target:getInven("HAND_SLOT")[1].resistances.holy_resistance
			end
			if target:getInven("LEG_SLOT") then
				resistance = resistance + target:getInven("LEG_SLOT")[1].resistances.holy_resistance
			end
	elseif resType == "unholy" then
		resistance = target.resistances.unholy_resistance
		if target:getInven("BODY_SLOT") then
			resistance = resistance + target:getInven("BODY_SLOT")[1].resistances.unholy_resistance
			end
			if target:getInven("HEAD_SLOT") then
				resistance = resistance +  target:getInven("HEAD_SLOT")[1].resistances.unholy_resistance
			end
			if target:getInven("HAND_SLOT") then
				resistance = resistance + target:getInven("HAND_SLOT")[1].resistances.unholy_resistance
			end
			if target:getInven("LEG_SLOT") then
				resistance = resistance + target:getInven("LEG_SLOT")[1].resistances.unholy_resistance
			end
	end
	return resistance
end