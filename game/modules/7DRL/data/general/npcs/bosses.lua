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
		{type="weapon", subtype="longsword", autoreq=true},
		{name = "Tattered Rags", autoreq=true},
	},
	resistances = {
		physical_resistance = 0.15,
        fire_resistance = 0.15,
        cold_resistance = 0.15,
        arcane_resistance = 0.15,
        holy_resistance = 0.15,
        unholy_resistance = 0.15,
        bonus_resistance = 0.15,
    },
	combat = {
		armor = 0,
		damage_reduction = 0,
        physical_damage =  resolvers.rngDMGBonus(0, 3),
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = resolvers.rngDMGBonus(0, 2),
        bonus_damage = 0,
    },
}

newEntity{ base = "BASE_NPC_CULTIST", define_as = "CULTIST_BOSS_KEY",
	name = "Hand of Ygothr", color=colors.CRIMSON,
	display = "B",
	level_range = {1, 4}, exp_worth = 1,
	rarity = 20,
	max_life = resolvers.rngavg(5,9),
	combat = { physical_damage = 2,},
	keyHolder = true,
	resolvers.drops{chance=100, nb=1, 
		{type="key", subtype="innersanctum", defined = "KEY_INNERSANCTUM"}
	},
}