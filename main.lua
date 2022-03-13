require("constants") -- here we require but the values in that file are global
local player = require("player") -- require to acces the functions etc and store those in player.
local enemy = require("enemy")
local ball = require("ball")

function love.load()
	enemy:load(ball) -- we pass ball object to enemy file as an argument
end

function love.draw()
	player:draw()
	enemy:draw()
	ball:draw()
end

function love.update(dt)
	player:update(dt) -- we pass dt to player as an argument, dt is just a number that smooths "things" between different computers
	enemy:update(dt) -- so my ball moves at the same speed as your ball kinda deal :)
	ball:update(dt)
end