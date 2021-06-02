local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
local DamageType = require "engine.DamageType"

newEntity{
	name = "Worn ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is worn out",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(1,3)
	},
}

newEntity{
	name = "Torn ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is torn",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(3,6)
	},
}

newEntity{
	name = "Clean ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is clean",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(5,9)
	},
}
newEntity{
	name = "Clean ", prefix=true, instant_resolve=true,
	--ego_lore = "This page is pristine",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		physical_resistance = resolvers.resistance(5,9)
	},
}
newEntity{
	name = " 479", suffix=true, instant_resolve=true,
	ego_lore = "If you don't expect gratitude you'll seldom be disappointed.",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(1,3)
	},
}