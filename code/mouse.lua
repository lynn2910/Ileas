local function mouseBetween(minX, minY, maxX, maxY, x, y)
  return (x > minX and x < maxX and y > minY and y < maxY);
end


function mouse(btn, x, y, state, held)
  if state == 1 or (state == 2 and held >= MOUSE[".data"].heldTime and math.round(held / MOUSE[".data"].heldTimeBetween) > MOUSE[btn].last) then
    MOUSE[btn].last = math.round(held / MOUSE[".data"].heldTimeBetween);
    print("Mouse touch: " .. btn)
    
    if MENU_CTG == "load" then
      local boxHeight, boxWidth = BOX_LOAD_BOX_HEIGHT, BOX_LOAD_BOX_WIDTH;
      local middleHeight, middleWidth = math.floor(HEIGHT / 2), math.floor(WIDTH / 2);
      local minX, minY = middleWidth-(boxWidth/2), middleHeight-(boxHeight/2);
      if mouseBetween(minX+30, minY+30, minX+32+30,minY+32+30, x, y) then
        print("reload saves")
        files = getAllSaves();
      end
    end

  end
end


function love.mousepressed(x, y, button, istouch, presses)
  if MOUSE[button] then
    MOUSE[button].state = 1;
    MOUSE[button].x = x;
    MOUSE[button].y = y;
  end
end

function love.mousereleased(x, y, button, istouch, presses)
  if MOUSE[button] then
    MOUSE[button].state = 3;
  end
end