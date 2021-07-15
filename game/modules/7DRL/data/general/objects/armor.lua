newEntity{
    define_as = "BASE_ARMOR",
    slot = "ARMOR_SLOT",
    type = "armor", subtype="body",
    display = "^", color=colors.SLATE,
    droppable = false,
    dropRate = 0,
    encumber = 3,
    rarity = 5,
    egos = "/data/general/egos/armor_egos.lua", egos_chance = {prefix=80, suffix=20},
    name = "a generic chest armor",
    desc = [[A Generic chest armor.]],
    lvlup = {
        str = 0,
        dex = 0,
    },
    combat = {
        armor = 0,
        damage_reduction = 0,
    },
    resistances = {
        physical_resistance = resolvers.resistance(1,5),
        fire_resistance = 0,
        cold_resistance = 0,
        arcane_resistance = 0,
        holy_resistance = 0,
        unholy_resistance = 0,
        bonus_resistance = 0,
    },
    combat = {
        physical_damage =  0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_ARMOR",
    name = "Tattered Rags",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "This is a basic armor",
    combat = {
        armor = 0,
        damage_reduction = 0,
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
}

newEntity{ base = "BASE_ARMOR",
    name = "Paladins Plate",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "Standard issued armor of the Holy Order",
    combat = {
        armor = 1,
        damage_reduction = 0,
    },
    resistances = {
        physical_resistance = resolvers.resistance(1,1),
        arcane_resistance = resolvers.resistance(1,1),
        holy_resistance = resolvers.resistance(1,1),
        unholy_resistance = resolvers.resistance(1,1),
    },
}

newEntity{ base = "BASE_ARMOR",
    name = "Breast Plate",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "A breast plate",
    combat = {
        armor = 1,
        damage_reduction = 0,
    },
    resistances = {
        physical_resistance = resolvers.resistance(1,5),
    },
}

newEntity{ base = "BASE_ARMOR",
    name = "Chainmaile",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "A chainmail shirt",
    combat = {
        armor = 1,
        damage_reduction = 0,
    },
    resistances = {
        physical_resistance = resolvers.resistance(1,5),
    },
}

newEntity{ base = "BASE_ARMOR",
    name = "Scale Mail",
    level_range = {1, 10},
    require = { stat = { str=1 }, },
    cost = 5,
    lore = "A breast plate",
    combat = {
        armor = 1,
        damage_reduction = 0,
    },
    resistances = {
        physical_resistance = resolvers.resistance(1,5),
    },
}