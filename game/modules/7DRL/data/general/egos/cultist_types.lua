local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
local DamageType = require "engine.DamageType"


newEntity{
	name = "Blessed ", prefix=true, instant_resolve=true,
	level_range = {1, 4},
	rarity = 5,
	cost = 0,
	energy = {
		mod= 1,
	},
	max_life = resolvers.rngavg(5,10),
	resolvers.equip{
		{type="blessed_cultist_weapons", autoreq=true},
	},
	combat = {
	},
}

newEntity{
	name = " Acolyte", suffix=true, instant_resolve=true,
	level_range = {1, 4},
	energy = {
		mod= 1,
	},
	rarity = 5,
	cost = 0,
	max_life = resolvers.rngavg(5,10),
	combat = {
	},
}