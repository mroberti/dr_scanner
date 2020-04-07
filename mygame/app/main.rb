$gtk.reset()
require 'lib/helpers.rb'
require "lib/Ship.rb"
$shoeboxData = $gtk.parse_json($gtk.read_file('assets/icons/icons.json'))
$iconSheetInfo = []
$scannerLine = {x:0,y:0,w:1,h:720}
#The Increment in which to move the 
# scanner line by. Smaller is slower
# and smoother, larger is faster and
# more jagged.
$lineStepDistance = 5

for i in 1..18 do
  $iconSheetInfo << "icons_"+i.to_s+".png"
end
$numShips = 10
$targetShip = rand($numShips)
def defaults args
  # If not already created, make an array to 
  # store our ship objects, using the Ship object
  args.state.lines ||= []
  args.state.ships ||= $numShips.map_with_index do |i|
    args.state.ships[i] = Ship.new($shoeboxData,'assets/icons/icons.png',$iconSheetInfo[rand(18)])
  end
end

def render args
    # Background image
    args.outputs.sprites <<  [0,0,1280,1280, 'assets/background2.jpg']
    args.outputs.sprites << {
      x: 0,
      y: 0,
      w: 1280,
      h: 720,
      path: 'assets/overlay1.png',
      angle: 0,
      a: 64,
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
      angle_anchor_y: 1.0}
      args.outputs.lines << [$scannerLine.x, 0, $scannerLine.x, 720, 0, 255, 255]
      args.outputs.lines << args.state.lines
    # Create all our sprites from the objects we
    # created in defaults
    # args.outputs.sprites << getSpriteDataShoebox2($shoeboxData,'assets/spritesheets/ships.png','e12 destroyer.png')  #getSpriteData(rand(20))
    args.outputs.sprites << args.state.ships
    
    

end

def calc args

  def ScannerLine args

    # Using the modulo operator may be
    # math intensive...but I'm lazy and it will 
    # switch back to 0 if it passes 1280
    $scannerLine.x = ($scannerLine.x + $lineStepDistance)%1280

    # Iterate through our ship array
    # and do stuff with 'em. Mostly
    # track the current target, $targetShip
    for tempShip in args.state.ships do
      tempNumber = (tempShip.x - $scannerLine.x).abs
      # puts "$scannerLine.x: " + $scannerLine.x.to_s
      # puts "tempNumber: " + tempNumber.to_s
      # Ooooh, get the x,y of the ship before it's move
      # and then after, so we can draw a line from where
      # they were and to where they are!
      if( (tempShip.x - $scannerLine.x).abs <$lineStepDistance/2 )then
        x1,y1 = tempShip.x,tempShip.y
        tempShip.move_towards(args.state.ships[$targetShip])
        x2,y2 = tempShip.x,tempShip.y
        templine = {x:x1,y:y1,w:x2,h:y2}
        args.state.lines << [templine.x, templine.y, templine.w,templine.h, 720, 0, 255, 255]
      end
    end

    # Every 600 ticks, change the target ship
    # to mix it up a little!
    if(args.state.tick_count%600==0)then
      $targetShip = rand($numShips)
    end

  end

  ScannerLine args
end

def tick args
  defaults args
  render args
  calc args
end

# def tick args
#   defaults args
#   check_click args
#   render args
#   calc args
#   # check__click args
# end