class Ship
	attr_sprite
	attr_accessor :my_label,:hp
	def initialize(theSheet,path,theName)
	  # thePath = $shoeboxData['frames'][0]['rotated']
	  thetile_w =  theSheet['frames'][theName]['frame']['w']
	  thetile_h =  theSheet['frames'][theName]['frame']['h']
	  thetile_x =  theSheet['frames'][theName]['frame']['x']
	  thetile_y =  theSheet['frames'][theName]['frame']['y']
  
	  # For noobs like me, the '@' symbol
	  # denotes an inherited variable from
	  # the parent sprite class
	  @x=rand(1280)
	  @y=rand(720)
	  @w=thetile_w/2
	  @h=thetile_h/2
	  @path=path
	  @angle=0
	  @a=255
	  @r=255
	  @g=255
	  @b=255
	  @tile_x= thetile_x
	  @tile_y= thetile_y
	  @tile_w=thetile_w
	  @tile_h=thetile_h
	  @flip_vertically=false
	  @flip_horizontally=false
	  @angle_anchor_x=0.5
	  @angle_anchor_y=0.5
	  self.my_label = theName
	  self.hp = rand(7)+3
	  
	  # puts theSheet['frames'][theName]['frame']['w']
	  # puts theSheet['frames'][theName]['frame']['x']
	  return nil
	end
  
	def serialize
	  instance_variables.each_with_object({}) do |ivar, collector|
		  collector[ivar] = instance_variable_get(ivar)
	  end
	end

	def inspect
	  serialize.to_s
	end
  
	def to_s
	  serialize.to_s
	end
  
	def render
	  self
	end
  
	def move_forward
	  # # -- Only rotate the the image
	  speed_length = 100.75
	  speed_x = speed_length * Math.cos(degrees_to_radians(self.angle))
	  speed_y = speed_length * Math.sin(degrees_to_radians(self.angle))
	  self.x = self.x + speed_x
	  self.y = self.y + speed_y
	  return self.x + speed_x,self.y + speed_y
	end

	def move_towards(target)
		heading = self.angle_to target
		# puts 'Heading: '+heading.to_s
		speed_length = 3.75
		speed_x = speed_length * Math.cos(degrees_to_radians(heading))
		speed_y = speed_length * Math.sin(degrees_to_radians(heading))
		self.x = self.x + speed_x
		self.y = self.y + speed_y
		return self.x + speed_x,self.y + speed_y
	  end

  end