snows = {
    image = {},
    height = 360,
    root = {
        x = 5555,
        y = 256,
        next = nil
    },
    period = 200,
    timer = 1,
    speed = 3,
    load = function(self)
        self.image[0] = love.graphics.newImage('snow.png')
        self.image[1] = love.graphics.newImage('snow_dark.png')
    end,
    update = function(self)
        self.timer = self.timer + 1
        local p = self.root
        local i = 0
        local prev = p
        while p do
            if i > 0 then
                p.x = p.x - self.speed
            end
            if p.x > dragon.x and p.x < dragon.x + dragon.width and p.y + 24 > dragon.y and p.y < dragon.y + dragon.height then
                love.audio.play(earn)
                score = score + 1
                prev.next = p.next
            end
            i = i + 1
            prev = p
            p = p.next
        end
        if self.timer > self.period then
            self.timer = 0
            p = self.root.next
            self.root.next = {
                x = 512,
                y = love.math.random(20, 360),
                next = p
            }
        end
    end,
    draw = function(self)
        local p = self.root
        while p do
            love.graphics.setColor(0, 0, 0, 0.2)
            love.graphics.draw(self.image[0], p.x - 5, p.y + 5)
            local c = (512 - p.y) / 512 + 0.5
            love.graphics.setColor(c, c, 1, 1)
            love.graphics.draw(self.image[0], p.x, p.y)
            c = 1 - c + 1
            love.graphics.setColor(1, c, c, night)
            love.graphics.draw(self.image[1], p.x, p.y)
            love.graphics.setColor(1, 1, 1, 1)
            p = p.next
        end
    end
}