local Talents = require "engine.interface.ActorTalents"

newEntity{
    define_as = "BASE_LONGSWORD",
    slot = "MAIN_HAND",
    type = "weapon", subtype="longsword",
    display = "/", color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    droppable = false,
    dropRate = 0,
    str_multiplier = 1.2,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    egos = "/data/general/egos/basic.lua", egos_chance = { prefix=20, suffix=20 },
    name = "a generic battleaxe",
    desc = [[t4modules massive two-handed battleaxes.]],
    lvlup = {
        str = 1,
        dex = 0,
    },
    combat = {
        physical_damage =  resolvers.rngavg(2, 5),
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_LONGSWORD",
    name = "Longsword",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "This is a basic longsword",
    combat = {
    },
}

newEntity{
    define_as = "BASE_GREATSWORD",
    slot = "MAIN_HAND",
    slot_forbid = "OFF_HAND",
    type = "weapon", subtype="greatsword",
    display = "/", color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    droppable = false,
    dropRate = 0,
    str_multiplier = 1.2,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    egos = "/data/general/egos/basic.lua", egos_chance = { prefix=20, suffix=20 },
    name = "a generic battleaxe",
    desc = [[t4modules massive two-handed battleaxes.]],
    lvlup = {
        str = 1,
        dex = 0,
    },
    combat = {
        physical_damage =  resolvers.rngavg(2, 5),
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_GREATSWORD",
    name = "Greatsword",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "This is a basic greatsword",
    combat = {
    },
}

newEntity{
    define_as = "BASE_CLUB",
    slot = "MAIN_HAND",
    type = "weapon", subtype="club",
    display = "/", color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    droppable = false,
    dropRate = 0,
    str_multiplier = 1.2,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    egos = "/data/general/egos/basic.lua", egos_chance = { prefix=20, suffix=20 },
    name = "a generic battleaxe",
    desc = [[t4modules massive two-handed battleaxes.]],
    lvlup = {
        str = 1,
        dex = 0,
    },
    combat = {
        physical_damage =  resolvers.rngavg(2, 5),
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_CLUB",
    name = "Club",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "This is a basic Club",
    combat = {
    },
}

newEntity{
    define_as = "BASE_AXE",
    slot = "MAIN_HAND",
    type = "weapon", subtype="axe",
    display = "/", color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    droppable = false,
    dropRate = 0,
    str_multiplier = 1.2,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
    egos = "/data/general/egos/basic.lua", egos_chance = { prefix=20, suffix=20 },
    name = "a generic battleaxe",
    desc = [[t4modules massive two-handed battleaxes.]],
    lvlup = {
        str = 1,
        dex = 0,
    },
    combat = {
        physical_damage =  resolvers.rngavg(2, 5),
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_AXE",
    name = "Handaxe",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "This is a basic handaxe",
    combat = {
    },
}