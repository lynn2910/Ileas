local b='6V972q4bnWhCyt+RfM0EKOodpuUsawgP3YeNB/FHjGDcXTmJl5iv8zI1SxQZLkA2r' -- You will need this for encoding/decoding

-- encoding
function enc(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end


-- don't use enc and dec functions
-- use only b

-- decoding
function dec(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

local saveBase = {
  saveDir = "./save",
}

save = Class:new(saveBase);





function save:generateRandomId()
  math.randomseed(os.time());
  local random = math.random;
  local template ='xxxxxxxxxxxx4x'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
        return string.format('%x', v)
    end)
end

function save:encryptData(data)
  -- header
  local header = "";
  -- add every data.header values to header as format "key=value\n"
  for k,v in pairs(data.header) do
    header = header .. k .. "=" .. v .. "\n";
  end
  local body = enc(table.toString(data));
  local saveData = "[header]\n" .. header .. "\n[body]\n" .. body;
  return saveData;
end


function save:saveGame(data, id)
  if not id then
    local randomId = self:generateRandomId();
    data.header.id = randomId;
    id = randomId
  end
  local encryptedData = self:encryptData(data);
  local file = io.open(self.saveDir .. "/" .. id .. ".lmay", "w");
  file:write(encryptedData);
  file:close();
end

local function stringToTable(str)
  if type(str) ~= "string" then return error("argument must be a string") end
  return load("return "..str)()
end

function save:loadGameFile(id, body)
  local file = io.open(self.saveDir .. "/" .. id .. ".lmay", "r");
  if file then
    local getBody = body or false;
    local header = {};
    local body = {};
    local state = "HEADER"
    for l in file:lines() do
      if l == "[header]" then
        state = "HEADER"
      elseif l == "[body]" then
        state = "BODY"
      elseif #l > 0 then
        if state == "HEADER" then
          -- header data
          local k,v = l:match("(.+)=(.+)");
          header[k] = v;
        elseif state == "BODY" and getBody then
          -- body data
          body = stringToTable(dec(l));
        end
      end
    end
    file:close();
    if getBody then
      return { header = header, body = body };
    else
      return header
    end
  else
    return nil
  end
end