function initPlayer(data)
  Player = Class:new(data);
  Player.name = "Player";

  Player.position = { x = 10*64; y = 10*64 };

  function Player:getCoords()
    return  {
      realX = self.position.x;
      realY = self.position.y;
      x = trunc(self.position.x / 64, 0);
      y = trunc(self.position.y / 64, 0);
      _caseSize = 65;
    }
  end
end