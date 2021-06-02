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
    tdddddddddddddddddddddddddddddddddddddddddddddddddt
    tdddddddddddddddddddddddddddddddddddddddddddddddddt
    tddddddddddddddddddddddddddddddd#############dddddt
    tddddddddddddddddddddddddddddddd#...........#dddddt
    tddddddddddddddddddddddddddddddd#..###i###..#dddddt
    tddddddddddddddddddddddddddddddd#..###.###..#dddddt
    tddddddddddddddddddddddddddddddd#...........#dddddt
    tdddddd##########################...........#dddddt
    tdddddd#....................................#dddddt
    tdddddd#..###.....###.........###...........#dddddt
    tdddddd#..###.....###.........###...........#dddddt
    tdddddd+1...................................#dddddt
    tdddddd#..###.....###.........###...........#dddddt
    tdddddd#..###.....###.........###...........#dddddt
    tdddddd#....................................#dddddt
    tdddddd########+######################.######dddddt
    tddddddddddddd#.....#dddddddddddddddd#......#dddddt
    tddddddddddddd#.....#dddddddddddddddd#......#dddddt
    tddddddddddddd#######dddddddddddddddd#......#dddddt
    tdddddddddddddddddddddddddddddddddddd#......#dddddt
    tdddddddddddddddddddddddddddddddddddd#.....n#dddddt
    tdddddddddddddddddddddddddddddddddddd########dddddt
    tdddddddddddddddddddddddddddddddddddddddddddddddddt
    tdddddddddddddddddddddddddddddddddddddddddddddddddt
    ttttttttttttttttttttttttttttttttttttttttttttttttttt]]