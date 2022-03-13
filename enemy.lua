local Enemy = {}
Enemy.width = 30
Enemy.height = 150
Enemy.x = 0 -- center the Enemy on screen at start
Enemy.y = WINDOW_HEIGHT / 2 - Enemy.height / 2 -- center the Enemy on screen at start
Enemy.speed = 200
local ball = {}

function Enemy:load(object)
	ball = object
end

function Enemy:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Enemy:movement(dt)
	self.y = (ball.y + ball.height / 2) - self.height / 2 -- center the enemy paddle on the ball
end

function Enemy:getObject(object)
	return object
end

function Enemy:stayInWindow()
	if self.y < 0 then
		self.y = 0
	end

	if self.y + self.height > WINDOW_HEIGHT then -- rectangles and images are all drawn from top left,
		self.y = WINDOW_HEIGHT - self.height     -- so we substract the height to make it stop where we want
	end
end

function Enemy:update(dt)
	self:movement(dt)
	self:stayInWindow()
end

return Enemy