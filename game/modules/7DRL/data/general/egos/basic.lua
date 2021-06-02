local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
local DamageType = require "engine.DamageType"

newEntity{
	name = "Arcane ", prefix=true, instant_resolve=true,
	ego_lore = "Blessed by Arcane",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	combat ={
		arcane_damage = resolvers.rngavg(2, 3),
	},
}

newEntity{
	name = "Holy ", prefix=true, instant_resolve=true,
	ego_lore = "Blessed by Holy",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	combat ={
		holy_damage = resolvers.rngavg(2, 3),
	},
}

newEntity{
	name = "Unholy ", prefix=true, instant_resolve=true,
	ego_lore = "Blessed by Ygthor",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	combat ={
		unholy_damage = resolvers.rngavg(2, 3),
	},
}

newEntity{
	name = " +1 ", suffix=true, instant_resolve=true,
	ego_lore = " ",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	combat ={
		bonus_damage = resolvers.rngavg(2, 3),
	},
}