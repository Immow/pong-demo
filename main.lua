require("constants") -- here we require but the values in that file are global
local player = require("player") -- require to acces the functions etc and store those in player.
local enemy = require("enemy")
local ball = require("ball")

function love.load()
	enemy:load(ball)
end

function love.draw()
	player:draw()
	enemy:draw()
	ball:draw()
end

function love.update(dt)
	player:update(dt) -- we pass the stuff from main.lua to player, in this case the dt value
	enemy:update(dt)
	ball:update(dt)
end