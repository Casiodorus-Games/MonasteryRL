require "engine.class"

module(..., package.seeall, class.make)

function _M:init(x, y, w, h, bgcolor, font, size)
    self.display_x = x
    self.display_y = y
    self.w, self.h = w, h
    self.bgcolor = bgcolor
    self.font = core.display.newFont(font, 10)
    self:resize(x, y, w, h)
end

--- Resize the display area
function _M:resize(x, y, w, h)
    self.display_x, self.display_y = x, y
    self.w, self.h = w, h
    self.font_h = self.font:lineSkip()
    self.font_w = self.font:size(" ")
    self.bars_x = self.font_w * 9
    self.bars_w = self.w - self.bars_x - 5
    self.surface = core.display.newSurface(w, h)
    self.surface_line = core.display.newSurface(w, self.font_h)
    self.texture = self.surface:glTexture()

    self.items = {}
end

function _M:makeTexture(text, x, y, r, g, b, max_w)
    local s = self.surface_line
    s:erase(0, 0, 0, 0)
    s:drawColorStringBlended(self.font, text, 0, 0, r, g, b, true, max_w)

    local item = { s:glTexture() }
    item.x = x
    item.y = y
    item.w = self.w
    item.h = self.font_h
    self.items[#self.items+1] = item

    return item.w, item.h, item.x, item.y
end

function _M:makeTextureBar(text, nfmt, val, max, reg, x, y, r, g, b, bar_col, bar_bgcol)
    local s = self.surface_line
    s:erase(0, 0, 0, 0)
    s:erase(bar_bgcol.r, bar_bgcol.g, bar_bgcol.b, 255, self.bars_x, h, self.bars_w, self.font_h)
    s:erase(bar_col.r, bar_col.g, bar_col.b, 255, self.bars_x, h, self.bars_w * val / max, self.font_h)

    s:drawColorStringBlended(self.font, text, 0, 0, r, g, b, true)
    s:drawColorStringBlended(self.font, (nfmt or "%d/%d"):format(val, max), self.bars_x + 5, 0, r, g, b)
    if reg and reg ~= 0 then
        local reg_txt = (" (%s%.2f)"):format((reg > 0 and "+") or "",reg)
        local reg_txt_w = self.font:size(reg_txt)
        s:drawColorStringBlended(self.font, reg_txt, self.bars_x + self.bars_w - reg_txt_w - 3, 0, r, g, b)
    end
    local item = { s:glTexture() }
    item.x = x
    item.y = y
    item.w = self.w
    item.h = self.font_h
    self.items[#self.items+1] = item

    return item.w, item.h, item.x, item.y
end

-- Displays the stats
function _M:display()
    local player = game.player
    if not player or not player.changed or not game.level then return end

    self.items = {}
    local weapon = player:hasWeapon("main")
    local offhand = player:hasWeapon("off")

    local h = 0
    local x = 0

    self:makeTexture(("%s"):format(game.zone.name), x, h, 255, 255, 255) h = h + self.font_h
    
    h = 200
    x = 2
    self.font:setStyle("bold")
    self:makeTexture(("%s#{normal}#"):format(player.name), 0, h, colors.GOLD.r, colors.GOLD.g, colors.GOLD.b, self.w) h = h + self.font_h
    self.font:setStyle("normal")

    self:makeTexture(("Str/Dex/Con: #00ff00#%s/%s/%s"):format(player:getStr(), player:getDex(), player:getCon()), x, h, 255, 255, 255) h = h + self.font_h
    self:makeTexture(("X/Y: #00ff00#%s/%s"):format(player.x, player.y), x, h, 255, 255, 255) h = h + self.font_h
    h = h + self.font_h

    --self:makeTextureBar("#c00000#Life:", nil, player.life, player.max_life, player.life_regen * util.bound((player.healing_factor or 1), 0, 2.5), x, h, 255, 255, 255, colors.DARK_RED, colors.VERY_DARK_RED) h = h + self.font_h
    self:makeTexture(("#c00000#Health: #FFFFFF#%3d/%3d"):format(player.life, player.max_life), x, h, 255, 255, 255) h = h + self.font_h
    h = 325
    self:makeTexture(("Physical Damage: %s"):format(player:GetCombatBookDamage("physical")+player.combat.physical_damage), x, h, 209,209,209) h = h + self.font_h
    self:makeTexture(("Arcane Damage: %s"):format(player:GetCombatBookDamage("arcane")), x, h, 192,0,175) h = h + self.font_h
    self:makeTexture(("Holy Damage: %s"):format(player:GetCombatBookDamage("holy")), x, h, 255,228,181) h = h + self.font_h
    self:makeTexture(("Unholy Damage: %s"):format(player:GetCombatBookDamage("unholy")), x, h, 70,130,180) h = h + self.font_h

    h = 475
    self:makeTexture(("Physical Resistance: %s"):format(getResistance(player, "physical")*100)..("%"), x, h, 209,209,209) h = h + self.font_h
    self:makeTexture(("Arcane Resistance: %s"):format(getResistance(player, "arcane")*100)..("%"), x, h, 192,0,175) h = h + self.font_h
    self:makeTexture(("Holy Resistance: %s"):format(getResistance(player, "holy")*100)..("%"), x, h, 255,228,181) h = h + self.font_h
    self:makeTexture(("Unholy Resistance: %s"):format(getResistance(player, "unholy")*100)..("%"), x, h, 70,130,180) h = h + self.font_h

    if savefile_pipe.saving then
        h = h + self.font_h
        self:makeTextureBar("Saving:", "%d%%", 100 * savefile_pipe.current_nb / savefile_pipe.total_nb, 100, nil, x, h, colors.YELLOW.r, colors.YELLOW.g, colors.YELLOW.b, 
        {r=49, g=54,b=42},{r=17, g=19, b=0})

        h = h + self.font_h
    end

end

function _M:toScreen(nb_keyframes)
    self:display()
    -- Second to last is the RGB code for changing the color of the display
    core.display.drawQuad(self.display_x, self.display_y, self.w, self.h, 89,61,59, 200)
    
    for i = 1, #self.items do
        local item = self.items[i]
        if type(item) == "table" then
            if item.glow then
                local glow = (1+math.sin(core.game.getTime() / 500)) / 2 * 100 + 120
                item[1]:toScreenFull(self.display_x + item.x, self.display_y + item.y, item.w, item.h, item[2], item[3], 1, 1, 1, glow / 255)
            else
                item[1]:toScreenFull(self.display_x + item.x, self.display_y + item.y, item.w, item.h, item[2], item[3])
            end
        else
            item(self.display_x, self.display_y)
        end
    end

end 

function getResistance(target, resType)
	local resistance = 0
    local counter = 0
	if resType == "physical" then
		resistance = resistance + target.resistances.physical_resistance
        if target:getInven("ARMOR_SLOT") then
            if target:getInven("ARMOR_SLOT")[1] then
            resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.physical_resistance
            end
        end
        if target:getInven("OFF_HAND") then
            if target:getInven("OFF_HAND")[1] then
                resistance = resistance + target:getInven("OFF_HAND")[1].resistances.physical_resistance
            end
        end
        for x in pairs(target:getInven("COMBAT_BOOK")) do
            counter = counter + 1
            if target:getInven("COMBAT_BOOK")[counter] then
                resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.physical_resistance
            end
        end
	elseif resType == "arcane" then
		resistance = resistance + target.resistances.arcane_resistance
        if target:getInven("ARMOR_SLOT") then
            if target:getInven("ARMOR_SLOT")[1] then
            resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.arcane_resistance
            end
        end
        for x in pairs(target:getInven("COMBAT_BOOK")) do
            counter = counter + 1
            if target:getInven("COMBAT_BOOK")[counter] then
                resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.arcane_resistance
            end
        end
	elseif resType == "holy" then
		resistance = resistance + target.resistances.holy_resistance
        if target:getInven("ARMOR_SLOT") then
            if target:getInven("ARMOR_SLOT")[1] then
            resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.holy_resistance
            end
        end
        for x in pairs(target:getInven("COMBAT_BOOK")) do
            counter = counter + 1
            if target:getInven("COMBAT_BOOK")[counter] then
                resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.holy_resistance
            end
        end
	elseif resType == "unholy" then
		resistance = resistance + target.resistances.unholy_resistance
        if target:getInven("ARMOR_SLOT") then
            if target:getInven("ARMOR_SLOT")[1] then
            resistance = resistance + target:getInven("ARMOR_SLOT")[1].resistances.unholy_resistance
            end
        end
        for x in pairs(target:getInven("COMBAT_BOOK")) do
            counter = counter + 1
            if target:getInven("COMBAT_BOOK")[counter] then
                resistance = resistance + target:getInven("COMBAT_BOOK")[counter].resistances.unholy_resistance
            end
        end
    end
	return resistance
end