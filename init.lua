minetest.register_privilege("warning", {description = "Can send warning message to all players", give_to_singleplayer=false})

local helper = {
  {"r","red",3},
  {"g","green",3},
  {"b","blue",3},
  {"lg","lightgreen",4},
  {"lb","lightblue",4},
  {"p","pink",3},
}

minetest.register_on_chat_message(function(name, message)
  for _, row in ipairs(helper) do
    if string.find(message, row[1].." ") == 1 then
	local msg = core.colorize(row[2], string.sub(message,row[3]))
	minetest.chat_send_all("<" .. name .. "> " .. msg)
        return true
    end
  end
end)

minetest.register_chatcommand("public_warning", {
   params = "<text>",
   description = "Send red chat message",
   privs = {warning=true},
   func = function(name, param)
      local msg = core.colorize("red", param);
      minetest.chat_send_all(msg);
   end,
})
