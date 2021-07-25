defineTile('#', "WALL")
defineTile('+', "DOOR")
defineTile(".", "FLOOR")
defineTile('t', "TREE")
defineTile('d', "DIRT")
defineTile("i", "DOOR_LOCKED")
defineTile("1", "FLOOR", nil, nil, "ENTERANCE")
defineTile("2", "FLOOR", nil, nil, "TUTORIAL_DESCEND")
defineTile("3", "FLOOR", nil, nil, "TUTORIAL_EQUIP")
defineTile("p", "FLOOR", {random_filter={type="page"}}, nil, "TUTORIAL_PICKUP")
defineTile("n", "UP_NORTH_BELLTOWER")
defineTile("c", "UP_CRYPT")

startx = 4
starty = 12

addSpot({38, 5}, "door", "intnersactum")

return [[
ttttttttttttttttttttttttttttttttttttttttttttttttttt
ttttttttttttttttttttttttttttttttttttttttttttttttttt
ttttdtdtttttttttdttttttttttdtttddddddddddddddtttttt
tttdddddddtttttdddtdttttttdddtdd#############tttttt
tttddddddddttddddddtdttdtddddddd#...........#dttttt
tddddddddddddddddddddddddddddddd#..###i###..#dttttt
tddddddddddddddddddddddddddddddd#..###.###..#ddtttt
tddddddddddddddddddddddddddddddd#...........#dttttt
tdddddd##########################...........#ddtttt
tdddddd#....................................#ddtttt
tdddddd#..###.....###.........###...........#ddtttt
tdddddd#..###.....###.........###...........#dttttt
ddddddd1....................................#ddtttt
tdddddd#..###.....###.........###...........#dttttt
tdddddd#..###.....###.........###...........#ddtttt
tdddddd#....................................#dttttt
tdddddd########3######################2######dttttt
tddddddddddddd#.....#dddddddddddddddd#......#dttttt
ttdddddddddddd#....p#dddddddddddddddd#......#ddtttt
tttddddddddddd#######dddddddddddddddd#......#dddttt
ttttdttdddddddddddddddddddddddddddddd#......#ddtttt
ttttttttdddtdddddddddddtddddddddddddd#.....n#dttttt
tttttttttttttdddddddddttttdddddttdddd########tttttt
ttttttttttttttttttdddttttttdddttttdtttttttttttttttt
ttttttttttttttttttttttttttttttttttttttttttttttttttt
ttttttttttttttttttttttttttttttttttttttttttttttttttt]]