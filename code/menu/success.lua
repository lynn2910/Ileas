local boxHeight, boxWidth = 600, 800

function successMenu()
  local middleHeight, middleWidth = math.floor(HEIGHT / 2), math.floor(WIDTH / 2);
  local x, y = middleWidth-(boxWidth/2), middleHeight-(boxHeight/2);
  love.graphics.setColor(0, 0, 0, 1);
  love.graphics.rectangle("fill", x, y, boxWidth, boxHeight);
  love.graphics.setColor(255, 255, 255, 1);
  love.graphics.printf("Cette fonctionnalitée n'est pas encore accessible.", 0, middleHeight, WIDTH, "center", 0);
  love.graphics.printf("[exit]", 0, middleHeight+23, WIDTH, "center", 0);
end;