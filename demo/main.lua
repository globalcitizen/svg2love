#!/Applications/love.app/Contents/MacOS/love .

target_area_offset_x = 300
target_area_offset_y = 300
image_size_x = 1024
image_size_y = 680
target_area_width = 500
target_area_height = 300

-- gets overwritten
scale_factor = 1
centering_offset_x = 0
centering_offset_y = 0

function love.load()
	-- set resolution
	modes = love.window.getFullscreenModes()
	table.sort(modes, function(a, b) return a.width*a.height < b.width*b.height end)
	v = modes[#modes]
	resolutionPixelsX=v.width
	resolutionPixelsY=v.height
	screenModeFlags = {fullscreen=true, fullscreentype='desktop', vsync=true, msaa=8}
	love.window.setMode(resolutionPixelsX, resolutionPixelsY, screenModeFlags)

	-- determine per-axis scaling
	scale_factor_x = target_area_width/image_size_x
	scale_factor_y = target_area_height/image_size_y

	-- select final scale factor
	--  if we use the minimum of the two axes, we get a blank edge
	--  if we use the maximum of the two axes, we lose a bit of the image
	scale_factor = math.max(scale_factor_x,scale_factor_y)
	
	-- now we have the problem of an offset for the image to center it.
	--  (basically it's possibly taller or wider than the display area on one axis)
	-- we first check which axis, then we offset half the difference
	if scale_factor * image_size_x > target_area_width then
		centering_offset_x = -math.floor(((scale_factor*image_size_x)-target_area_width)*0.5)
	elseif scale_factor * image_size_y > target_area_width then
		centering_offset_y = -math.floor(((scale_factor*image_size_y)-target_area_height)*0.5)
	end
end


function love.draw()

	-- clip to the target area
	love.graphics.setScissor(target_area_offset_x,target_area_offset_y,target_area_width,target_area_height)
	
	-- draw in the target area
	love.graphics.translate(target_area_offset_x+centering_offset_x,target_area_offset_y+centering_offset_y)
	
	-- scale to the target area
	love.graphics.scale(scale_factor,scale_factor)
	
	dofile('demo-input.lua')

	-- bounding box
	love.graphics.setScissor()
	love.graphics.origin()
	love.graphics.setColor(55,55,55,255)
	love.graphics.rectangle('line',target_area_offset_x-1,target_area_offset_y-1,target_area_width+2,target_area_height+2)
	
end
