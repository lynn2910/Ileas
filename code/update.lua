function love.update(dt)
    dt = math.min(dt, 1/60)

    WIDTH = love.graphics.getWidth();
    HEIGHT = love.graphics.getHeight();

    -- keyboard
    for key, t in pairs(KEYS) do
        if key ~= ".data" then
            if love.keyboard.isDown(key) then
                if t.state == 1 then
                    keyboard(key, 1, t.held);
                    t.state = 2;
                    t.held = t.held + dt;
                elseif t.state == 2 then
                    keyboard(key, 2, t.held)
                    t.held = t.held + dt;
                end
            else 
                if t.state == 3 then
                    t.state = 0;
                    t.held = 0;
                end
            end
        end
    end

end