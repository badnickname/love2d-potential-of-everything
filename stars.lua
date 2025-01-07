stars = {
    image = {},
    x = 0,
    speed = 0.1,    
    load = function(self)
        self.image[0] = love.graphics.newImage('clouds_dark.png')
    end,
    update = function(self)
        self.x = self.x - self.speed
        if self.x <= -1300 then
            self.x = 0
        end
    end,
    draw = function(self)
        love.graphics.setColor(1, 1, 1, night)
        love.graphics.draw(self.image[0], self.x - 1300, 0)
        love.graphics.draw(self.image[0], self.x, 0)
        love.graphics.draw(self.image[0], self.x + 1300, 0)
        love.graphics.setColor(1, 1, 1, 1)
    end
}