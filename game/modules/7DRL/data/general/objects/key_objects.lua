newEntity{
    define_as = "BASE_KEY",
    type = "key", subtype="door",
    display = "$", color=colors.GOLD,
    encumber = 3,
    rarity = 5,
    droppable = true,
    dropRate = 100,
    identified = true,
    name = "a generic key",
    desc = [[A Key]],
}

newEntity{ base = "BASE_KEY", define_as = "KEY_INNERSANCTUM",
    subtype= "innersanctum",
    name = "Inner Sanctum Key",
    lore = "The Key to the inner sanctum.",
    level_range = {1, 50},
}