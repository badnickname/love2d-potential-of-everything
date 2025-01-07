background = {
    image = {},
    load = function(self)
        self.image[0] = love.graphics.newImage('back_2.png')
        self.image[1] = love.graphics.newImage('back_2_dark.png')
    end,
    update = function(self)
        -- none
    end,
    draw = function(self)
        love.graphics.draw(self.image[0], 0, 0)
        love.graphics.setColor(1, 1, 1, night)
        love.graphics.draw(self.image[1], 0, 0)
        love.graphics.setColor(1, 1, 1, 1)
    end
}