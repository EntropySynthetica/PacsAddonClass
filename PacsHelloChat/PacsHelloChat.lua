-- Initialize our Namespace Table
PacsHelloChat = {}
 
PacsHelloChat.name = "PacsHelloChat"
PacsHelloChat.version = "1.0.0"

-- Run This when ESO loads our addon in. 
function PacsHelloChat.OnAddonLoad(event, addonName)
    -- ESO will call this function for every addon loaded.  Only Initialize when this addon is loaded.
    if addonName == PacsHelloChat.name then
        PacsHelloChat.Initialize()
    end
end

-- After our addon is loaded into memory we run this to do any first time setup.
function PacsHelloChat.Initialize()
    -- Grab any variables our program may need to run. 
    PacsHelloChat.PlayerName = GetDisplayName()

    -- Call any functions our program needs
    PacsHelloChat.SayHello()
end

-- Function to Say Hello to you in chat. 
function PacsHelloChat.SayHello()
    d("Hello " .. PacsHelloChat.PlayerName .. ". How Are You Today?")
end

-- Ask ESO to to tell our addon when it loads each addon into memory. 
EVENT_MANAGER:RegisterForEvent(PacsHelloChat.name, EVENT_ADD_ON_LOADED, PacsHelloChat.OnAddonLoad)