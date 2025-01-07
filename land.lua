land = {
    image = {},
    x = 0,
    speed = 1,
    load = function(self)
        self.image[0] = love.graphics.newImage('land.png')
        self.image[1] = love.graphics.newImage('land_dark.png')
    end,
    update = function(self)
        self.x = self.x - self.speed
        if self.x <= -1300 then
            self.x = 0
        end
    end,
    draw = function(self)
        love.graphics.draw(self.image[0], self.x - 1300, 289)
        love.graphics.draw(self.image[0], self.x, 289)
        love.graphics.draw(self.image[0], self.x + 1300, 289)
        love.graphics.setColor(1, 1, 1, night)
        love.graphics.draw(self.image[1], self.x - 1300, 289)
        love.graphics.draw(self.image[1], self.x, 289)
        love.graphics.draw(self.image[1], self.x + 1300, 289)
        love.graphics.setColor(1, 1, 1, 1)
    end
}