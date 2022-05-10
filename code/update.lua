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



    -- mouse
    for key, t in pairs(MOUSE) do
        if key ~= ".data" then
            if love.mouse.isDown(key) then
                if t.state == 1 then
                    mouse(key, t.x, t.y, 1, t.held);
                    t.state = 2
                    t.held = t.held + dt;
                elseif t.state == 2 then
                    mouse(key, t.x, t.y, 2, t.held);
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


    if STATE == "game" then
        -- player move
        local PlayerCoords = Player.getCoords(Player);
        local case = Game.map[PlayerCoords.y+1][PlayerCoords.x+1];
        if PLAYER_MOVE ~= nil then
            print(CASES_PROPERTIES[case.id].solid)
            if PLAYER_MOVE == "UP" and PlayerCoords.y > 0 then
                if not CASES_PROPERTIES[case.id].solid then
                    if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                        Player.position.y = Player.position.y - (PLAYER_SPEED);
                        PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                    else
                        PLAYER_MOVE = nil;
                        PLAYER_MOVE_STATE = 0;
                        LAST_MOVE_TIME = os.time();
                    end
                end
            elseif PLAYER_MOVE == "DOWN" and PlayerCoords.y >= 0 then
                if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                    Player.position.y = Player.position.y + (PLAYER_SPEED);
                    PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                else
                    PLAYER_MOVE = nil;
                    PLAYER_MOVE_STATE = 0;
                    LAST_MOVE_TIME = os.time();
                end
            elseif PLAYER_MOVE == "RIGHT" then
                if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                    Player.position.x = Player.position.x + (PLAYER_SPEED);
                    PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                else
                    PLAYER_MOVE = nil;
                    PLAYER_MOVE_STATE = 0;
                    LAST_MOVE_TIME = os.time();
                end
            elseif PLAYER_MOVE == "LEFT" and PlayerCoords.x > 0 then
                if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                    Player.position.x = Player.position.x - (PLAYER_SPEED);
                    PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                else
                    PLAYER_MOVE = nil;
                    PLAYER_MOVE_STATE = 0;
                    LAST_MOVE_TIME = os.time();
                end
            elseif PLAYER_MOVE == "UP_RIGHT" and PlayerCoords.y > 0 then
                if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                    Player.position.y = Player.position.y - (PLAYER_SPEED);
                    Player.position.x = Player.position.x + (PLAYER_SPEED);
                    PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                else
                    PLAYER_MOVE = nil;
                    PLAYER_MOVE_STATE = 0;
                    LAST_MOVE_TIME = os.time();
                end
            elseif PLAYER_MOVE == "UP_LEFT" and PlayerCoords.y > 0 and PlayerCoords.x > 0 then
                if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                    Player.position.y = Player.position.y - (PLAYER_SPEED);
                    Player.position.x = Player.position.x - (PLAYER_SPEED);
                    PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                else
                    PLAYER_MOVE = nil;
                    PLAYER_MOVE_STATE = 0;
                    LAST_MOVE_TIME = os.time();
                end
            elseif PLAYER_MOVE == "DOWN_RIGHT" and PlayerCoords.y >= 0 then
                if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                    Player.position.y = Player.position.y + (PLAYER_SPEED);
                    Player.position.x = Player.position.x + (PLAYER_SPEED);
                    PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                else
                    PLAYER_MOVE = nil;
                    PLAYER_MOVE_STATE = 0;
                    LAST_MOVE_TIME = os.time();
                end
            elseif PLAYER_MOVE == "DOWN_LEFT" and PlayerCoords.y >= 0 and PlayerCoords.x > 0 then
                if PLAYER_MOVE_STATE < MAX_PLAYER_MOVE then
                    Player.position.y = Player.position.y + (PLAYER_SPEED);
                    Player.position.x = Player.position.x - (PLAYER_SPEED);
                    PLAYER_MOVE_STATE = PLAYER_MOVE_STATE + 1
                else
                    PLAYER_MOVE = nil;
                    PLAYER_MOVE_STATE = 0;
                    LAST_MOVE_TIME = os.time();
                end
            end
            if PLAYER_MOVE ~= nil then
                LAST_PLAYER_MOVE = PLAYER_MOVE;
                LAST_MOVE_TIME = os.time();
            end

        end

        -- update player state if idle
        if KEYS["right"].state == 0 and LAST_PLAYER_MOVE == "RIGHT" and KEYS["right"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_RIGHT";
            LAST_MOVE_TIME = os.time();
        elseif KEYS["left"].state == 0 and LAST_PLAYER_MOVE == "LEFT" and KEYS["left"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_LEFT";
            LAST_MOVE_TIME = os.time();
        elseif KEYS["up"].state == 0 and LAST_PLAYER_MOVE == "UP" and KEYS["up"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_UP";
            LAST_MOVE_TIME = os.time();
        elseif KEYS["down"].state == 0 and LAST_PLAYER_MOVE == "DOWN" and KEYS["down"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_DOWN";
            LAST_MOVE_TIME = os.time();
        elseif KEYS["up"].state == 0 and KEYS["right"].state == 0 and LAST_PLAYER_MOVE == "UP_RIGHT" and KEYS["up"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_UP_RIGHT";
            LAST_MOVE_TIME = os.time();
        elseif KEYS["up"].state == 0 and KEYS["left"].state == 0 and LAST_PLAYER_MOVE == "UP_LEFT" and KEYS["up"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_UP_LEFT";
            LAST_MOVE_TIME = os.time();
        elseif KEYS["down"].state == 0 and KEYS["right"].state == 0 and LAST_PLAYER_MOVE == "DOWN_RIGHT" and KEYS["down"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_DOWN_RIGHT";
            LAST_MOVE_TIME = os.time();
        elseif KEYS["down"].state == 0 and KEYS["left"].state == 0 and LAST_PLAYER_MOVE == "DOWN_LEFT" and KEYS["down"].state == 0 then
            LAST_PLAYER_MOVE = "IDLE_DOWN_LEFT";
            LAST_MOVE_TIME = os.time();
        end
        

        -- update player animation
        if PLAYER_ANIMATION < 120 then
            PLAYER_ANIMATION = PLAYER_ANIMATION + 1;
        else
            PLAYER_ANIMATION = 0;
        end
    end

end