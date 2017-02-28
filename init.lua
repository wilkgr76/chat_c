minetest.register_privilege("warning", {description = "Can send warning message to all players", give_to_singleplayer=false})

minetest.register_on_chat_message(function(name, message)
	if string.find(message, "r ") == 1 then
		local msg = core.colorize("red", string.sub(message,3));
		minetest.chat_send_all("<" .. name .. "> " .. msg);
	elseif string.find(message, "g ") == 1 then
		local msg = core.colorize("green", string.sub(message,3));
		minetest.chat_send_all("<" .. name .. "> " .. msg);
	elseif string.find(message, "b ") == 1 then
		local msg = core.colorize("blue", string.sub(message,3));
		minetest.chat_send_all("<" .. name .. "> " .. msg);
	elseif string.find(message, "lg ") == 1 then
		local msg = core.colorize("lightgreen", string.sub(message,4));
		minetest.chat_send_all("<" .. name .. "> " .. msg);
	elseif string.find(message, "lb ") == 1 then
		local msg = core.colorize("lightblue", string.sub(message,4));
		minetest.chat_send_all("<" .. name .. "> " .. msg);
	elseif string.find(message, "p ") == 1 then
		local msg = core.colorize("pink", string.sub(message,3));
		minetest.chat_send_all("<" .. name .. "> " .. msg);
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
