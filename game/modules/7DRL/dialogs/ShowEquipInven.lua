-- TE4 - T-Engine 4
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
local Dialog = require "engine.ui.Dialog"
local ListColumns = require "engine.ui.ListColumns"
local Textzone = require "engine.ui.Textzone"
local TextzoneList = require "engine.ui.TextzoneList"
local Separator = require "engine.ui.Separator"

gameFont = "/data/general/font/Ac437_IBM_CGA.ttf"

--- Show Equip Iventory
-- @classmod engine.dialogs.ShowEquipInven
module(..., package.seeall, class.inherit(Dialog))

function _M:init(title, actor, filter, action, on_select)
	self.action = action
	self.filter = filter
	self.actor = actor
	self.on_select = on_select

	Dialog.init(self, title or "Inventory", game.w * 0.7, game.h * 0.7, nil, nil, nil, "/data/general/font/Ac437_IBM_CGA.ttf")

	self.on_select = function(item)
		--local mx, my = core.mouse.get()
		--if item.object then
		--	game:tooltipDisplayAtMap(5, 400, getToolTip(item), true)
		if item.object then
			self.c_desc:switchItem(item, getToolTip(item))
		end
	end	

	self.max_h = 0

	self.c_desc = TextzoneList.new{width=self.iw, height=self.max_h*self.font_h + 150, no_color_bleed=true}

	self.c_inven = ListColumns.new{width=math.floor(self.iw / 2 - 10), height=self.ih - self.max_h*self.font_h - 10, sortable=true, scrollbar=true, columns={
		{name="", width={30,"fixed"}, display_prop="char", sort="id"},
		{name="", width={30,"fixed"}, display_prop="object", sort="sortname", direct_draw=function(item, x, y) if item.object then item.object:toScreen(nil, x+4, y, 16, 16) end end},
		{name="Inventory", width=68, display_prop="name", sort="sortname"},
		{name="Category", width=20, display_prop="cat", sort="cat"},
		{name="Enc.", width=12, display_prop="encumberance", sort="encumberance"},
	}, list={}, fct=function(item, sel, button, event) self:use(item, button, event) end, select=function(item, sel) self:select(item) end, on_drag=function(item) if self.on_drag then self.on_drag(item) end end}

	self.c_equip = ListColumns.new{width=math.floor(self.iw / 2 - 10), height=self.ih - self.max_h*self.font_h - 10, scrollbar=true, columns={
		{name="", width={30,"fixed"}, display_prop="char"},
		{name="", width={8+16,"fixed"}, display_prop="object", direct_draw=function(item, x, y) if item.object then item.object:toScreen(nil, x+4, y, 16, 16) end end},
		{name="Equipment", width=72, display_prop="name"},
		{name="Category", width=20, display_prop="cat"},
		{name="Enc.", width=10, display_prop="encumberance"},
	}, list={}, fct=function(item, sel, button, event) self:use(item, button, event) end, select=function(item, sel) self:select(item) end, on_drag=function(item) if self.on_drag then self.on_drag(item) end end}


	self:generateList()

	self:loadUI{
		{left=0, top=0, ui=self.c_equip},
		{right=0, top=0, ui=self.c_inven},
		{left=0, bottom=0, ui=self.c_desc},
		{hcenter=0, top=5, ui=Separator.new{dir="horizontal", size=self.ih - 10}},
		{left=5, bottom=self.c_desc.h, ui=Separator.new{dir="vertical", size=self.iw / 2 - 25}},
	}
	self:setFocus(self.c_inven)
	self:setupUI()

	self.key:addCommands{
		__TEXTINPUT = function(c)
			local list
			if self.focus_ui and self.focus_ui.ui == self.c_inven then list = self.c_inven.list
			elseif self.focus_ui and self.focus_ui.ui == self.c_equip then list = self.c_equip.list
			end
			if list and list.chars[c] then
				self:use(list[list.chars[c]])
			end
		end,
	}
	if engine.interface and engine.interface.PlayerHotkeys then engine.interface.PlayerHotkeys:bindAllHotkeys(self.key, function(i) self:defineHotkey(i) end) end
	self.key:addBinds{
		ACCEPT = function()
			if self.focus_ui and self.focus_ui.ui == self.c_inven then self:use(self.c_inven.list[self.c_inven.sel])
			elseif self.focus_ui and self.focus_ui.ui == self.c_equip then self:use(self.c_equip.list[self.c_equip.sel])
			end
		end,
		EXIT = function() game:unregisterDialog(self) game:tooltipHide() end,
	}
end

function _M:on_register()
	game:onTickEnd(function() self.key:unicodeInput(true) end)
end

function _M:defineHotkey(id)
	if not self.actor or not self.actor.hotkey then return end

	local item = nil
	if self.focus_ui and self.focus_ui.ui == self.c_inven then item = self.c_inven.list[self.c_inven.sel]
	elseif self.focus_ui and self.focus_ui.ui == self.c_equip then item = self.c_equip.list[self.c_equip.sel]
	end
	if not item or not item.object then return end

	self.actor.hotkey[id] = {"inventory", item.object:getName{no_add_name=true, no_count=true}}
	self:simplePopup("Hotkey "..id.." assigned", item.object:getName{no_add_name=true, no_count=true}:capitalize().." assigned to hotkey "..id)
	self.actor.changed = true
end

function _M:select(item)
	if self.cur_item == item then return end
	if item then
		if self.on_select then self.on_select(item) end
	end
	self.cur_item = item
end

function _M:on_focus(id, ui)
	if self.focus_ui and self.focus_ui.ui == self.c_inven then self:select(self.c_inven.list[self.c_inven.sel])
	elseif self.focus_ui and self.focus_ui.ui == self.c_equip then self:select(self.c_equip.list[self.c_equip.sel])
	end
end

function _M:use(item, button, event)
	if item then
		if self.action(item.object, item.inven, item.item, button, event) then
			game:unregisterDialog(self)
		end
	end
end

function _M:generateList(no_update)
	-- Makes up the list
	self.equip_list = {}
	local list = self.equip_list
	local chars = {}
	local i = 1
	self.max_h = 0
	for inven_id =  1, #self.actor.inven_def do
		if self.actor.inven[inven_id] and (self.actor.inven_def[inven_id].is_worn or self.actor.inven_def[inven_id].is_shown_equip) then
			list[#list+1] = { id=#list+1, char="", name=tstring{{"/data/general/font/Ac437_IBM_CGA.ttf"}, self.actor.inven_def[inven_id].name, {"/data/general/font/Ac437_IBM_CGA.ttf"}}, color={0x90, 0x90, 0x90}, inven=inven_id, cat="", encumberance="", desc=self.actor.inven_def[inven_id].description }
			self.max_h = math.max(self.max_h, #self.actor.inven_def[inven_id].description:splitLines(self.iw - 10, self.font))

			for item, o in ipairs(self.actor.inven[inven_id]) do
				if not self.filter or self.filter(o) then
					local char = self:makeKeyChar(i)

					local enc = 0
					o:forAllStack(function(o) enc=enc+o.encumber end)

					list[#list+1] = { id=#list+1, char=char, name=o:getName(), sortname=o:getName():toString():removeColorCodes(), color=o:getDisplayColor(), object=o, inven=inven_id, item=item, cat=o.subtype, encumberance=enc, desc=o:getDesc() }
					chars[char] = #list
					i = i + 1
				end
			end
		end
	end
	list.chars = chars
	self.equip_list = list

	-- Makes up the list
	self.inven_list = {}
	local list = self.inven_list
	local chars = {}
	local i = 1
	for item, o in ipairs(self.actor:getInven("INVEN") or {}) do
		if not self.filter or self.filter(o) then
			local char = self:makeKeyChar(i)

			local enc = 0
			o:forAllStack(function(o) enc=enc+o.encumber end)

			list[#list+1] = { id=#list+1, char=char, name=o:getName(), sortname=o:getName():toString():removeColorCodes(), color=o:getDisplayColor(), object=o, inven=self.actor.INVEN_INVEN, item=item, cat=o.subtype, encumberance=enc, desc=o:getDesc() }
			chars[char] = #list
			i = i + 1
		end
	end
	list.chars = chars

	if not no_update then
		self.c_inven:setList(self.inven_list)
		self.c_equip:setList(self.equip_list)
	end
end

function _M:on_recover_focus()
	self:generateList()
end

function getToolTip(item)
	local lore = item.object.lore
	local name = item.name
	local ego = " "
	local color = "#WHITE#"
	stat1_type = " "
	stat1 = " "
	stat2_type = " "
	stat2 = " "
	stat3_type = " "
	stat3 = " "
	stat4_type = " "
	stat4= " "
	if item.object.type == "armor" then 
		local elementalTypes = getElement(item, "armor")
		local elementDamage = getDamageType(item, "armor")
		stat1_type = "Armor: "
		stat1 = item.object.combat.armor
		local count = countTable(elementalTypes)
		if count == 4 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1].."%"
			stat2_type = elementalTypes[2]
			stat2 = elementDamage[2].."%"
			stat3_type = elementalTypes[3]
			stat3 = elementDamage[3].."%"
			stat4_type = elementalTypes[4]
			stat4 = elementDamage[4].."%"
		elseif count == 3 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1].."%"
			stat2_type = elementalTypes[2]
			stat2 = elementDamage[2].."%"
			stat3_type = elementalTypes[3]
			stat3 = elementDamage[3].."%"
			stat4_type = " "
			stat4= " "
		elseif count == 2 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1].."%"
			stat2_type = elementalTypes[2]
			stat2 = elementDamage[2].."%"
			stat3_type = " "
			stat3 = " "
			stat4_type = " "
			stat4= " "
		elseif count == 1 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1].."%"
			stat2_type = " "
			stat2 = " "
			stat3_type = " "
			stat3 = " "
			stat4_type = " "
			stat4= " "
		end
	elseif item.object.type == "weapon" then
		local elementalTypes = getElement(item, "weapon")
		local elementDamage = getDamageType(item, "weapon")
		local count = countTable(elementalTypes)
		if count == 4 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1]
			stat2_type = elementalTypes[2]
			stat2 = elementDamage[2]
			stat3_type = elementalTypes[3]
			stat3 = elementDamage[3]
			stat4_type = elementalTypes[4]
			stat4 = elementDamage[4]
		elseif count == 3 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1]
			stat2_type = elementalTypes[2]
			stat2 = elementDamage[2]
			stat3_type = elementalTypes[3]
			stat3 = elementDamage[3]
			stat4_type = " "
			stat4= " "
		elseif count == 2 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1]
			stat2_type = elementalTypes[2]
			stat2 = elementDamage[2]
			stat3_type = " "
			stat3 = " "
			stat4_type = " "
			stat4= " "
		elseif count == 1 then
			stat1_type = elementalTypes[1]
			stat1 = elementDamage[1]
			stat2_type = " "
			stat2 = " "
			stat3_type = " "
			stat3 = " "
			stat4_type = " "
			stat4= " "
		end
	elseif item.object.type == "page" then 
			local elementalTypes = getElement(item, "armor")
			local elementDamage = getDamageType(item, "armor")
			stat1_type = "Armor: "
			stat1 = item.object.combat.armor
			local count = countTable(elementalTypes)
			if count == 4 then
				stat1_type = elementalTypes[1]
				stat1 = elementDamage[1].."%"
				stat2_type = elementalTypes[2]
				stat2 = elementDamage[2].."%"
				stat3_type = elementalTypes[3]
				stat3 = elementDamage[3].."%"
				stat4_type = elementalTypes[4]
				stat4 = elementDamage[4].."%"
			elseif count == 3 then
				stat1_type = elementalTypes[1]
				stat1 = elementDamage[1].."%"
				stat2_type = elementalTypes[2]
				stat2 = elementDamage[2].."%"
				stat3_type = elementalTypes[3]
				stat3 = elementDamage[3].."%"
				stat4_type = " "
				stat4= " "
			elseif count == 2 then
				stat1_type = elementalTypes[1]
				stat1 = elementDamage[1].."%"
				stat2_type = elementalTypes[2]
				stat2 = elementDamage[2].."%"
				stat3_type = " "
				stat3 = " "
				stat4_type = " "
				stat4= " "
			elseif count == 1 then
				stat1_type = elementalTypes[1]
				stat1 = elementDamage[1].."%"
				stat2_type = " "
				stat2 = " "
				stat3_type = " "
				stat3 = " "
				stat4_type = " "
				stat4= " "
			end
	end
	if item.object.ego_lore then ego = item.object.ego_lore end
	local str = 
		color..name..
		"\n#WHITE#"..lore.."\n"..ego..
		"\n"..stat1_type..stat1..
		"\n"..stat2_type..stat2..
		"\n"..stat3_type..stat3..
		"\n"..stat4_type..stat4
	return str
end


function getElement(item, type) -- Item and then what type of damage we're looking for
	elementTypes = {}
	if type == "weapon" then
		if item.object.combat.physical_damage > 0 then table.insert(elementTypes, "Physical Damage: ") end
		if item.object.combat.arcane_damage > 0 then table.insert(elementTypes, "Arcane Damage: ") end
		if item.object.combat.holy_damage > 0 then table.insert(elementTypes, "Holy Damage: ") end
		if item.object.combat.unholy_damage > 0 then table.insert(elementTypes, "Unholy Damage: ") end
	end
	if type == "armor" then
		if item.object.resistances.physical_resistance > 0 then table.insert(elementTypes, "Physical Resistance: ") end
		if item.object.resistances.arcane_resistance > 0 then table.insert(elementTypes, "Arcane Resistance: ") end
		if item.object.resistances.holy_resistance > 0 then table.insert(elementTypes, "Holy Resistance: ") end
		if item.object.resistances.unholy_resistance > 0 then table.insert(elementTypes, "Unholy Resistance: ") end
	end
	return elementTypes
end

function getDamageType(item, type) -- Item and then what type of damage we're looking for
	damageType = {}
	if type == "weapon" then
		if item.object.combat.physical_damage > 0 then table.insert(damageType,item.object.combat.physical_damage+item.object.combat.bonus_damage) end
		if item.object.combat.arcane_damage > 0 then table.insert(damageType,item.object.combat.arcane_damage) end
		if item.object.combat.holy_damage > 0 then table.insert(damageType,item.object.combat.holy_damage) end
		if item.object.combat.unholy_damage > 0 then table.insert(damageType,item.object.combat.unholy_damage) end
	end
	if type == "armor" then
		if item.object.resistances.physical_resistance > 0 then table.insert(damageType,item.object.resistances.physical_resistance*100) end
		if item.object.resistances.arcane_resistance > 0 then table.insert(damageType,item.object.resistances.arcane_resistance*100) end
		if item.object.resistances.holy_resistance > 0 then table.insert(damageType,item.object.resistances.holy_resistance*100) end
		if item.object.resistances.unholy_resistance > 0 then table.insert(damageType,item.object.resistances.unholy_resistance*100) end
	end
	return damageType
end	

function countTable(itemTable)
	local count = 0
	for i in pairs(itemTable) do count = count + 1 end
	return count
end

