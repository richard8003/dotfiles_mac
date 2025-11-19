-- helper function to type strings
function sendString(str)
	hs.eventtap.keyStrokes(str)
end

-- exempel-hotkey direkt i Hammerspoon

-- please
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "A", function()
	sendString(" please")
end)

-- academy
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "B", function()
	sendString("academy")
end)

-- affiliation
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "C", function()
	sendString("affiliation")
end)

-- federation
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "D", function()
	sendString("federation")
end)

-- page
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "E", function()
	sendString("page")
end)

-- question
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "F", function()
	sendString("question")
end)

-- register
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "G", function()
	sendString("register")
end)

-- registration
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "H", function()
	sendString("registration")
end)

-- event
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "I", function()
	sendString("event")
end)

-- user
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "J", function()
	sendString("user")
end)

-- access
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "K", function()
	sendString("access")
end)

-- account
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "L", function()
	sendString("account")
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "M", function()
	hs.eventtap.keyStrokes("Thank you for your email.")
	hs.timer.doAfter(0.05, function()
		hs.eventtap.keyStroke({}, "return")
	end)
end)

-- organiser
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "N", function()
	sendString("organiser")
end)

-- Smoothcomp
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "O", function()
	sendString("Smoothcomp")
end)

-- email address
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "P", function()
	sendString("email address")
end)

-- associated
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "Q", function()
	sendString("associated")
end)

-- Have a nice day!
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	sendString("Have a nice day!")
end)

-- admin
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "T", function()
	sendString("admin")
end)

-- johansson@smoothcomp.com 
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "U", function()
	sendString("johansson@smoothcomp.com")
end)

-- richard.johansson.8003@gmail.com
hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "V", function()
	sendString("richard.johansson.8003@gmail.com")
end)
