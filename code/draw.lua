dofile("code/menu/success.lua");
dofile("code/menu/options.lua");
dofile("code/menu/load.lua");
dofile("code/menu/new.lua");

function love.draw()
  if STATE == "menu" then
    local middleHeight, middleWidth = math.floor(HEIGHT / 2), math.floor(WIDTH / 2);
    love.graphics.draw(assets.background, 0, 0, 0, 1, 1);
    
    if MENU_CTG == "main" then
      love.graphics.setFont(MENU_DEFAULT_FONT);
      if MENU_SELECTED == 0 then  love.graphics.setColor(200, 0, 0, 1); else love.graphics.setColor(255, 255, 255, 1); end;
      love.graphics.printf("Nouvelle partie", 0, middleHeight-100, WIDTH, "center", 0); 
      if MENU_SELECTED == 1 then  love.graphics.setColor(200, 0, 0, 1); else love.graphics.setColor(255, 255, 255, 1); end;
      love.graphics.printf("Charger une partie", 0, middleHeight-50, WIDTH, "center", 0);
      if MENU_SELECTED == 2 then  love.graphics.setColor(200, 0, 0, 1); else love.graphics.setColor(255, 255, 255, 1); end;
      love.graphics.printf("Options", 0, middleHeight, WIDTH, "center", 0);
      if MENU_SELECTED == 3 then  love.graphics.setColor(200, 0, 0, 1); else love.graphics.setColor(255, 255, 255, 1); end;
      love.graphics.printf("Succès", 0, middleHeight+50, WIDTH, "center", 0);
      if MENU_SELECTED == 4 then  love.graphics.setColor(200, 0, 0, 1); else love.graphics.setColor(255, 255, 255, 1); end;
      love.graphics.printf("Quitter", 0, middleHeight+100, WIDTH, "center", 0);
      love.graphics.setFont(DEFAULT_FONT);
    else
      -- menu category
      if MENU_CTG == "success" then
        successMenu();
      elseif MENU_CTG == "options" then
        optionsMenu();
      elseif MENU_CTG == "new" then
        newGame();
      elseif MENU_CTG == "load" then
        loadGame();
      end
    end

    love.graphics.setColor(255, 255, 255, 1);
    love.graphics.printf("by Communauté du rab", 20, HEIGHT-20, WIDTH, "left", 0);


    -- exit dialog
    if EXIT_DIALOG then
      local x, y = middleWidth-(450/2), middleHeight-(125/2);
      love.graphics.setColor(0, 0, 0, 1);
      love.graphics.rectangle("fill", x, y, 450, 125);
      love.graphics.setColor(255, 255, 255, 1);
      love.graphics.printf("Etes-vous sûr de vouloir quitter ?", 0, middleHeight-42, WIDTH, "center", 0);
      if EXIT_SELECTED == 0 then  love.graphics.setColor(200, 0, 0, 1); else love.graphics.setColor(255, 255, 255, 1); end;
      love.graphics.printf("Oui", 0, middleHeight+13, WIDTH-75, "center", 0);
      if EXIT_SELECTED == 1 then  love.graphics.setColor(200, 0, 0, 1); else love.graphics.setColor(255, 255, 255, 1); end;
      love.graphics.printf("Non", 0, middleHeight+13, WIDTH+75, "center", 0);
    end

    love.graphics.setColor(255, 255, 255, 1);
  end
end

