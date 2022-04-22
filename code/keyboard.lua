function keyboard(key, state, held)
  if state == 1 or (state == 2 and held >= KEYS[".data"].heldTime and math.round(held / KEYS[".data"].heldTimeBetween) > KEYS[key].last) then
    KEYS[key].last = math.round(held / KEYS[".data"].heldTimeBetween);

    print("Touch: " .. key)

    if STATE == "menu" then
      -- menu
      if MENU_CTG == "main" then
        if key == "right" then
          if EXIT_DIALOG then
            EXIT_SELECTED = (EXIT_SELECTED + 1) % 2
          end
        elseif key == "left" then
          if EXIT_DIALOG then
            EXIT_SELECTED = (EXIT_SELECTED - 1) % 2
          end
        elseif key == "down" and not EXIT_DIALOG then
          MENU_SELECTED = (5 + (MENU_SELECTED + 1)) % 5
        elseif key == "up" and not EXIT_DIALOG then
          MENU_SELECTED = (5 + (MENU_SELECTED - 1)) % 5
        elseif key == "return" then
          -- check what is the category
          if MENU_SELECTED == 0 then
            -- new game
            print("new game")
            MENU_CTG = "new";
          elseif MENU_SELECTED == 1 then
            -- load game
            print("load game")
            MENU_CTG = "load"
          elseif MENU_SELECTED == 2 then
            -- options
            print("options")
            MENU_CTG = "options"
          elseif MENU_SELECTED == 3 then
            -- success
            print("success")
            MENU_CTG = "success"
          elseif MENU_SELECTED == 4 then
            -- exit
            if EXIT_DIALOG == true then
              if EXIT_SELECTED == 1 then
                -- keep open
                print("keep open")
                EXIT_DIALOG = false;
                EXIT_SELECTED = 1;
              else
                love.event.quit(0)
              end
            else
              EXIT_DIALOG = true
            end
          end
        end
      elseif key == "escape" and table.contains({"success", "new", "load"}, MENU_CTG) then
        MENU_CTG = "main";
      elseif MENU_CTG == "options" then
        if OPTIONS_CTG == "select" then
          if key == "escape" then
            MENU_CTG = "main";
          end
        end
      end
    end

  end
end




function love.keypressed(key)
  if KEYS[key] then
    KEYS[key].state = 1;
  end
end


function love.keyreleased(key)
  if KEYS[key] then
    KEYS[key].state = 3;
  end
end