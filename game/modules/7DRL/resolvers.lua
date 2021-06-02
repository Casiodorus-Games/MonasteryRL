--- Resolves drops creation for an actor
function resolvers.drops(t)
	return {__resolver="drops", __resolve_last=true, t}
end

--- Actually resolve the drops creation
function resolvers.calc.drops(t, e)
	t = t[1]
	if not rng.percent(t.chance or 100) then return nil end

	-- Iterate of object requests, try to create them and drops them
	for i = 1, (t.nb or 1) do
		local filter = t[rng.range(1, #t)]
		print("Drops resolver", e.name, filter.type, filter.subtype, filter.defined)
		local o
		if not filter.defined then
			o = game.zone:makeEntity(game.level, "object", filter, nil, true)
		else
			o = game.zone:makeEntityByName(game.level, "object", filter.defined)
		end
		if o then
			print("Zone made us an drop according to filter!", o:getName())
			e:addObject(e.INVEN_INVEN, o)
			game.zone:addEntity(game.level, o, "object")

		end
	end
	-- Delete the origin field
	return nil
end


--- Resolves equipment creation for an actor
function resolvers.equip(t)
	return {__resolver="equip", __resolve_last=true, t}
end
--- Actually resolve the equipment creation
function resolvers.calc.equip(t, e)
	print("Equipment resolver for", e.name)
	-- Iterate of object requests, try to create them and equip them
	for i, filter in ipairs(t[1]) do
		print("Equipment resolver", e.name, filter.type, filter.subtype)
		local o
		if not filter.defined then
			o = game.zone:makeEntity(game.level, "object", filter, nil, true)
		else
			o = game.zone:makeEntityByName(game.level, "object", filter.defined)
		end
		if o then
			print("Zone made us an equipment according to filter!", o:getName())

			-- Auto alloc some stats to be able to wear it
			if filter.autoreq and rawget(o, "require") and rawget(o, "require").stat then
				print("Autorequire stats")
				for s, v in pairs(rawget(o, "require").stat) do
					print(s,v)
					if e:getStat(s) < v then
						e.unused_stats = e.unused_stats - (v - e:getStat(s))
						e:incStat(s, v - e:getStat(s))
					end
				end
			end

			e:wearObject(o, true, false)

			-- Do not drop it unless it is an ego or better
			if not o.egoed and not o.unique then o.no_drop = true end
			if filter.force_drop then o.no_drop = nil end
			game.zone:addEntity(game.level, o, "object")

			--if t[1].id then o:identify(t[1].id) end
		end
	end
	-- Delete the origin field
	return nil
end


--- Random bonus based on level
resolvers.current_level = 1
function resolvers.mbonus(max, add, pricefct)
	return {__resolver="mbonus",  __resolve_instant=true, max, add, pricefct}
end
function resolvers.calc.mbonus(t, e)
	local v = rng.mbonus(t[1], resolvers.current_level, resolvers.mbonus_max_level) + (t[2] or 0)

	if e.cost and t[3] then
		local ap, nv = t[3](e, v)
		e.cost = e.cost + ap
		v = nv or v
	end

	return v
end

--- Resolves drops creation for an actor
function resolvers.resistance(min, max)
	return {__resolver="resistance", __resolve_last=true,min, max}
end

--- Actually resolve the drops creation
function resolvers.calc.resistance(t)
	minValue = t[1]
	maxValue = t[2]
	value = rng.range(minValue,maxValue)/100
	return value
end

