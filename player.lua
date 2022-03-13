local Player = {}
Player.width = 30
Player.height = 150
Player.x = WINDOW_WIDTH - Player.width -- center the Player on screen at start
Player.y = WINDOW_HEIGHT / 2 - Player.height / 2 -- center the Player on screen at start
Player.speed = 200

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

function Player:movement(dt)
	if love.keyboard.isDown("s", "down") then
		self.y = self.y + self.speed * dt
	end
	if love.keyboard.isDown("w", "up") then
		self.y = self.y - self.speed * dt
	end
end

function Player:stayInWindow()
	if self.y < 0 then
		self.y = 0
	end

	if self.y + self.height > WINDOW_HEIGHT then -- rectangles and images are all drawn from top left,
		self.y = WINDOW_HEIGHT - self.height     -- so we substract the height to make it stop where we want
	end
end

function Player:update(dt)
	self:movement(dt)
	self:stayInWindow()
end

return Player