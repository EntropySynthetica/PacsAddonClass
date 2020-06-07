-- Initialize our Namespace Table
HelloPacrooti = {}
 
HelloPacrooti.name = "HelloPacrooti"
HelloPacrooti.version = "1.0.0"


-- Summon Pacrooti!!!
function HelloPacrooti.summon_pacrooti()
    SetCrownCrateNPCVisible(true)
end


-- Dismiss Pacrooti
function HelloPacrooti.dismiss_pacrooti()
    SetCrownCrateNPCVisible(false)
end


SLASH_COMMANDS["/hellopacrooti"] = HelloPacrooti.summon_pacrooti
SLASH_COMMANDS["/byepacrooti"] = HelloPacrooti.dismiss_pacrooti