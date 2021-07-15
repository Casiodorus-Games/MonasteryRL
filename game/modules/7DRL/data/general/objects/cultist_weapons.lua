local Talents = require "engine.interface.ActorTalents"

newEntity{
    define_as = "BASE_CULTIST_LONGSWORD",
    slot = "MAIN_HAND",
    type = "cultist_weapons", subtype="longsword",
    display = "/", color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    droppable = false,
    dropRate = 0,
    str_multiplier = 1.2,
    combat = { sound = "actions/melee", sound_miss = "actions/melee_miss", },
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
    --lvlup_str = 1,
    --lvlup_dex = 0,
}


newEntity{ base = "BASE_CULTIST_LONGSWORD",
    name = "Longsword",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "This is a basic longsword",
    combat = {
        physical_damage =  resolvers.rngavg(2, 5),
    },
}

newEntity{ base = "BASE_CULTIST_LONGSWORD",
    type = "blessed_cultist_weapons",
    name = "Longsword",
    egos = "/data/general/egos/cultist_egos.lua", egos_chance = { prefix=20, suffix=20 },
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "This is a basic longsword",
    combat = {
        unholy_damage = resolvers.rngavg(2, 5),
    },
}