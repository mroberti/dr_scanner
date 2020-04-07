def getSpriteData(i)
	thePath = $theData['textures'][0]['frames'][i]['filename']
	thetile_w =  $theData['textures'][0]['frames'][i]['frame']['w']
	thetile_h =  $theData['textures'][0]['frames'][i]['frame']['h']
	thetile_x =  $theData['textures'][0]['frames'][i]['frame']['x']
	thetile_y =  $theData['textures'][0]['frames'][i]['frame']['y']
	theHash = {
		x: 300,
		y: 300,
		w: 100,
		h: 100,
		path: "sprites/player.png",
		angle: 0,
		a: 255,
		r: 255,
		g: 255,
		b: 255,
		tile_x:  0,
		tile_y:  0,
		tile_w: -1,
		tile_h: -1,
		flip_vertically: false,
		flip_horizontally: false,
		angle_anchor_x: 0.5,
		angle_anchor_y: 1.0
	}

	theHash.w=thetile_w
	theHash.h=thetile_h
	theHash.tile_w=thetile_w
	theHash.tile_h=thetile_h
	theHash.tile_x=thetile_x
	theHash.tile_y=thetile_y
	theHash.path = "assets/spritesheets/allships-0.png"
	# puts theHash
	return theHash
end
  
def getSpriteDataShoebox(name)
	# thePath = $shoeboxData['frames'][0]['rotated']
	thetile_w =  $shoeboxData['frames'][name]['frame']['w']
	thetile_h =  $shoeboxData['frames'][name]['frame']['h']
	thetile_x =  $shoeboxData['frames'][name]['frame']['x']
	thetile_y =  $shoeboxData['frames'][name]['frame']['y']
	theHash = {
		x: 300,
		y: 300,
		w: 100,
		h: 100,
		path: "sprites/player.png",
		angle: 0,
		a: 255,
		r: 255,
		g: 255,
		b: 255,
		tile_x:  0,
		tile_y:  0,
		tile_w: -1,
		tile_h: -1,
		flip_vertically: false,
		flip_horizontally: false,
		angle_anchor_x: 0.5,
		angle_anchor_y: 1.0
	}
	# puts $shoeboxData['frames'][name]['frame']['w']
	theHash.w=thetile_w
	theHash.h=thetile_h
	theHash.tile_w=thetile_w
	theHash.tile_h=thetile_h
	theHash.tile_x=thetile_x
	theHash.tile_y=thetile_y
	theHash.path = "assets/spritesheets/sprites.png"
	# puts theHash
	return theHash
end

def getSpriteDataShoebox2(theSheet,thePath,theName)
	# thePath = $shoeboxData['frames'][0]['rotated']
	thetile_w =  theSheet['frames'][theName]['frame']['w']
	thetile_h =  theSheet['frames'][theName]['frame']['h']
	thetile_x =  theSheet['frames'][theName]['frame']['x']
	thetile_y =  theSheet['frames'][theName]['frame']['y']
	theHash = {
		x: 400,
		y: 400,
		w: 100,
		h: 100,
		path: thePath,
		angle: 0,
		a: 255,
		r: 255,
		g: 255,
		b: 255,
		tile_x:  0,
		tile_y:  0,
		tile_w: -1,
		tile_h: -1,
		flip_vertically: false,
		flip_horizontally: false,
		angle_anchor_x: 0.5,
		angle_anchor_y: 1.0
	}
	# puts theSheet['frames'][theName]['frame']['w']
	# puts theSheet['frames'][theName]['frame']['x']
	theHash.w=thetile_w
	theHash.h=thetile_h
	theHash.tile_w=thetile_w
	theHash.tile_h=thetile_h
	theHash.tile_x=thetile_x
	theHash.tile_y=thetile_y
	theHash.path = thePath
	# puts theHash
	return theHash
end

def choice(hash)
	return hash[rand(hash.length())]
end

def radians_to_degrees(angle_in_radians)
	angle_in_radians*(180/Math::PI)
end

def degrees_to_radians(angle_in_radians)
	angle_in_radians*(Math::PI/180)
end