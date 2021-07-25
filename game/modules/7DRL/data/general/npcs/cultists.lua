local Talents = require("engine.interface.ActorTalents")

newEntity{
	define_as = "BASE_NPC_CULTIST",
	type = "humanoid", subtype = "cultist",
	display = "c", color=colors.WHITE,
	desc = "a basic culstist",
	body = { INVEN = 10, MAIN_HAND = 1, ARMOR_SLOT = 1, COMBAT_BOOK = 1},
	ai = "dumb_talented_simple", ai_state = { talent_in=3, },
	stats = { str=5, dex=5, con=5 },
	combat_armor = 0,
	resolvers.equip{
		{type="cultist_weapons", autoreq=true},
		{name = "Tattered Rags", autoreq=true},
		{type="page", subtype="page", autoreq=false}
	},
	resolvers.inventory{ id=true,
		{type="page", subtype="page"}
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
		armor = 0,
		damage_reduction = 0,
		physical_damage =  0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_NPC_CULTIST",
	name = "Ygothr Cultist", color=colors.WHITE,
	level_range = {3, 5}, exp_worth = 1,
	egos = "/data/general/egos/cultist_types.lua", egos_chance = {prefix=20, suffix=20},
	rarity = 1,
	energy = {
		mod= 1,
	},
	max_life = resolvers.rngavg(5,10),
	combat = {
	},
}

newEntity{ base = "BASE_NPC_CULTIST",
	name = "Ygothr Priest", color=colors.RED,
	display = "p",
	level_range = {1, 4}, exp_worth = 1,
	rarity = 5,
	max_life = resolvers.rngavg(7,12),
	combat = {
	},
}

newEntity{ base = "BASE_NPC_CULTIST",
	name = "Champion of Ygothr", color=colors.CRIMSON,
	display = "C",
	level_range = {1, 4}, exp_worth = 1,
	rarity = 20,
	max_life = resolvers.rngavg(15,19),
	combat = {
	},
}