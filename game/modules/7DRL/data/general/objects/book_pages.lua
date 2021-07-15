newEntity{
    define_as = "BASE_PAGE",
    slot = "COMBAT_BOOK",
    type = "page", subtype="page",
    display = "^", color=colors.SLATE,
    encumber = 3,
    rarity = 5,
    egos = "/data/general/egos/book_egos.lua", egos_chance = { prefix=100, suffix=100 },
    name = "a generic chest armor",
    droppable = true,
    dropRate = 75,
    desc = [[A Generic chest armor.]],
    lvlup = {
        str = 0,
        dex = 0,
    },
    resistances = {
        physical_resistance = 0,
        fire_resistance = 0,
        cold_resistance = 0,
        arcane_resistance = 0,
        holy_resistance = 0,
        unholy_resistance = 0,
        bonus_resistance = 0,
    },
    combat = {
        physical_damage = 0,
        armor = 0,
        damage_reduction = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_PAGE",
    name = "Page",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = " ",
    combat = {
    },
    resistances = {
        physical_resistance = 0.01,
    },
}