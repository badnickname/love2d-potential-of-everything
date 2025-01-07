dragon = {
    image = {},
    x = 40,
    y = 256,
    width = 101,
    height = 56,
    speed = 5,
    shake = { 
        min = { x = -20, y = -3 },
        max = { x = 20, y = 3 },
        speed = { x = 0.15, y = 0.1 },
        x = 0,
        y = 0
    },
    update = function(self)
        if self.shake.x + self.shake.speed.x > self.shake.max.x or self.shake.x + self.shake.speed.x < self.shake.min.x then
            self.shake.speed.x = -self.shake.speed.x
        end
        if self.shake.y + self.shake.speed.y > self.shake.max.y or self.shake.y + self.shake.speed.y < self.shake.min.y then
            self.shake.speed.y = -self.shake.speed.y
        end
        self.shake.x = self.shake.x + self.shake.speed.x
        self.shake.y = self.shake.y + self.shake.speed.y

        local delta = 0
        if love.keyboard.isDown('s') then
            delta = delta + self.speed
        end
        if love.keyboard.isDown('w') then
            delta = delta - self.speed
        end
        if (self.y + delta < 20 or self.y + delta > 360) then
            return
        end
        self.y = self.y + delta
    end,
    load = function(self)
        self.image[0] = love.graphics.newImage('dragon.png')
        self.image[1] = love.graphics.newImage('dragon_dark.png')
    end,
    draw = function(self)
        love.graphics.setColor(0, 0, 0, 0.2)
        love.graphics.draw(self.image[0], self.x + self.shake.x - 5, self.y + self.shake.y + 5)
        
        local c = (512 - self.y) / 512 + 0.5
        love.graphics.setColor(c, c, 1, 1)
        love.graphics.draw(self.image[0], self.x + self.shake.x, self.y + self.shake.y)

        c = 1 - c + 1
        love.graphics.setColor(1, c, c, night)
        love.graphics.draw(self.image[1], self.x + self.shake.x, self.y + self.shake.y)

        love.graphics.setColor(1, 1, 1, 1)
    end
}