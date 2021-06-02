local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
local DamageType = require "engine.DamageType"

newEntity{
	name = "Ygothr ", prefix=true, instant_resolve=true,
	ego_lore = "Blessed by Ygthor",
	level_range = {1, 50},
	rarity = 5,
	cost = 0,
	combat ={
		unholy_damage = resolvers.rngavg(2, 3),
	},
}