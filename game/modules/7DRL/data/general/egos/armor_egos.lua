local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
local DamageType = require "engine.DamageType"

newEntity{
	name = "Arcane ", prefix=true, instant_resolve=true,
	ego_lore = "Blessed by Arcane",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		arcane_resistance = resolvers.resistance(1,10)
	},
}

newEntity{
	name = "Holy ", prefix=true, instant_resolve=true,
	ego_lore = "Blessed by Holy",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		holy_resistance = resolvers.resistance(1,10)
	},
}

newEntity{
	name = "Unholy ", prefix=true, instant_resolve=true,
	ego_lore = "Blessed by Ygthor",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	resistances ={
		unholy_resistance = resolvers.resistance(1,10)
	},
}