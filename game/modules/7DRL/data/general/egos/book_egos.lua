local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
local DamageType = require "engine.DamageType"
-- Prefixes
newEntity{
	name = "Worn ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is worn out",
	level_range = {1, 50},
	rarity = 1,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(1,3)
	},
}

newEntity{
	name = "Torn ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is torn",
	level_range = {1, 50},
	rarity = 2,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(3,6)
	},
}

newEntity{
	name = "Clean ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is clean",
	level_range = {1, 50},
	rarity = 3,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(5,9)
	},
}
newEntity{
	name = "Pristine ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is pristine",
	level_range = {1, 50},
	rarity = 4,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(7,11)
	},
}

-- Suffixes

-- Common 
newEntity{
	name = " 479", suffix=true, instant_resolve=true,
	ego_lore = "If you don't expect gratitude you'll seldom\nbe disappointed.",
	level_range = {1, 50},
	rarity = 1,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 1,
        holy_damage = 0,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 369", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 1,
	cost = 0,
	resistances ={
		holy_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 1,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 873", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 1,
	cost = 0,
	resistances ={
		unholy_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 1,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 1018", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 2,
	cost = 0,
	resistances ={
		unholy_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 0,
        unholy_damage = 1,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 548", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 2,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(2,4),
	},
}


newEntity{
	name = " 900", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 2,
	cost = 0,
	resistances ={
		holy_resistance = resolvers.resistance(2,4),
	},
}

newEntity{
	name = " 344", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 2,
	cost = 0,
	resistances ={
		unholy_resistance = resolvers.resistance(2,4),
	},
}

-- Uncommon 
newEntity{
	name = " 692", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 4,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(1,3),
		holy_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 1,
        holy_damage = 1,
        unholy_damage = 0,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 1135", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 4,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(1,3),
		unholy_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 1,
        holy_damage = 0,
        unholy_damage = 1,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 458", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 4,
	cost = 0,
	resistances ={
		holy_resistance = resolvers.resistance(1,3),
		unholy_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 0,
        holy_damage = 1,
        unholy_damage = 1,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 759", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 4,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(2,4),
		unholy_resistance = resolvers.resistance(2,4),
	},
}


newEntity{
	name = " 194", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 4,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(2,4),
		holy_resistance = resolvers.resistance(2,4),
	},
}

newEntity{
	name = " 95", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 4,
	cost = 0,
	resistances ={
		holy_resistance = resolvers.resistance(2,4),
		unholy_resistance = resolvers.resistance(2,4),
	},
}

-- Rare

newEntity{
	name = " 775", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 7,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(1,3),
		holy_resistance = resolvers.resistance(1,3),
		unholy_resistance = resolvers.resistance(1,3),
	},
	combat = {
        physical_damage = 0,
        fire_damage = 0,
        cold_damage = 0,
        arcane_damage = 1,
        holy_damage = 1,
        unholy_damage = 1,
        bonus_damage = 0,
    },
}

newEntity{
	name = " 6", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 7,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(2,4),
		holy_resistance = resolvers.resistance(2,4),
		unholy_resistance = resolvers.resistance(2,4),
	},
}