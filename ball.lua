local player = require("player")
local enemy = require("enemy")

local Ball = {}
Ball.width = 10
Ball.height = 10
Ball.x = WINDOW_WIDTH / 2 - Ball.width / 2 -- place player paddle on the right side
Ball.y = WINDOW_HEIGHT / 2 - Ball.height / 2 -- center the ball on screen at start
Ball.xVelocity = 100
Ball.yVelocity = 100

function Ball:stayInWindow()
	if self.y < 0 then
		self.yVelocity = self.yVelocity * -1 -- when we reach the top we flip our speed to go the other way
	end

	if self.y + self.height > WINDOW_HEIGHT then
		self.yVelocity = self.yVelocity * -1 -- when we reach the bottom we flip our speed to go the other way
	end
end

function Ball:detectCollision(entity)
	if self.x + self.width > entity.x then
		self.xVelocity = self.xVelocity * -1
	end

	if self.x < entity.x + entity.width then
		self.xVelocity = self.xVelocity * -1
	end
end

function Ball:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Ball:update(dt)
	self:stayInWindow()
	self:detectCollision(player)
	self:detectCollision(enemy)
	self.x = self.x + self.xVelocity * dt
	self.y = self.y + self.yVelocity * dt
end

return Ball