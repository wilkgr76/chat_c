--[[
Allows players to colour their chat messages.
Source code: https://github.com/wilkgr76/chat_c

Dependiences: default (included in minetest_game)
Optional dependiences: intllib

Forum topic: https://forum.minetest.net/viewtopic.php?f=9&t=16814
License: AGPLv3
--]]

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

minetest.register_privilege("chat_c", {
  description = S("Allows players to colour their chat messages."),
  give_to_singleplayer = true,
  give_to_admin = true,  
})

local helper = {
  {"r","red",3},
  {"g","green",3},
  {"b","blue",3},
  {"lg","lightgreen",4},
  {"lb","lightblue",4},
  {"p","pink",3},
}

minetest.register_on_chat_message(function(name, message)
  if minetest.get_player_privs(name, {chat_c = true}) then
    for _, row in ipairs(helper) do
      if string.find(message, row[1].." ") == 1 then
              local msg = core.colorize(row[2], string.sub(message,row[3]))
              minetest.chat_send_all("<" .. name .. "> " .. msg)
            minetest.log("action", ("CHAT: <" .. name .. "> " .. msg))
          return true
      end
    end
  end
end)

minetest.register_chatcommand("public_warning", {
   params = S("<text>"),
   description = S("Sends a public warning to all players."),
   privs = {basic_privs = true},
   func = function(name, param)
      local msg = core.colorize("red", param);
      minetest.chat_send_all(msg);
       minetest.log("action", ("PUBLIC WARNING BY " .. name .. ": " .. msg));
   end,
})

-- Log
if minetest.settings:get_bool("log_mods") then
	minetest.log("action", S(("[MOD] Coloured-chat loaded")))
end
