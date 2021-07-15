defineTile('#', "WALL")
defineTile('+', "DOOR")
defineTile(".", "FLOOR")
defineTile('t', "TREE")
defineTile('d', "DIRT")
defineTile("i", "DOOR_LOCKED")
defineTile("1", "FLOOR", nil, nil, "ENTERANCE")
defineTile("n", "UP_NORTH_BELLTOWER")
defineTile("c", "UP_CRYPT")

startx = 7
starty = 12

addSpot({42, 5}, "door", "intnersactum")

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
ddddddd.....................................#ddtttt
tdddddd#..###.....###.........###...........#dttttt
tdddddd#..###.....###.........###...........#ddtttt
tdddddd#....................................#dttttt
tdddddd########.######################.######dttttt
tddddddddddddd#.....#dddddddddddddddd#......#dttttt
ttdddddddddddd#.....#dddddddddddddddd#......#ddtttt
tttddddddddddd#######dddddddddddddddd#......#dddttt
ttttdttdddddddddddddddddddddddddddddd#......#ddtttt
ttttttttdddtdddddddddddtddddddddddddd#.....n#dttttt
tttttttttttttdddddddddttttdddddttdddd########tttttt
ttttttttttttttttttdddttttttdddttttdtttttttttttttttt
ttttttttttttttttttttttttttttttttttttttttttttttttttt
ttttttttttttttttttttttttttttttttttttttttttttttttttt]]