
defineAction{
	default = { "sym:_LEFT:true:false:false:false", "sym:_a:true:false:false:false" },
	type = "MOVE_LEFT",
	group = "movement",
	name = "Attack left",
}

defineAction{
	default = { "sym:_RIGHT:true:false:false:false", "sym:_d:true:false:false:false" },
	type = "MOVE_RIGHT",
	group = "movement",
	name = "Attack right",
}

defineAction{
	default = { "sym:_UP:true:false:false:false", "sym:_w:true:false:false:false" },
	type = "MOVE_UP",
	group = "movement",
	name = "Attack up",
}

defineAction{
	default = { "sym:_DOWN:true:false:false:false", "sym:_s:true:false:false:false" },
	type = "MOVE_DOWN",
	group = "movement",
	name = "Attack down",
}

defineAction{
	default = { "sym:_q:true:false:false:false" },
	type = "MOVE_LEFT_UP",
	group = "movement",
	name = "Attack diagonally left and up",
}

defineAction{
	default = { "sym:_e:true:false:false:false" },
	type = "MOVE_RIGHT_UP",
	group = "movement",
	name = "Attack diagonally right and up",
}

defineAction{
	default = { "sym:_z:true:false:false:false" },
	type = "MOVE_LEFT_DOWN",
	group = "movement",
	name = "Attack diagonally left and down",
}

defineAction{
	default = { "sym:_c:true:false:false:false" },
	type = "MOVE_RIGHT_DOWN",
	group = "movement",
	name = "Attack diagonally right and down",
}