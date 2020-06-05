-- Required Libraries
local LAM2 = LibAddonMenu2

-- Initialize our Namespace Table
PacsInCombat = {}
 
PacsInCombat.name = "PacsInCombat"
PacsInCombat.version = "1.0.0"
 
-- Initialize our Variables
function PacsInCombat:Initialize()
  PacsInCombat.CreateSettingsWindow()
  PacsInCombat.savedVariables = ZO_SavedVars:NewCharacterIdSettings("PacsInCombatSavedVariables", 1, nil, {})

  enableDebug = PacsInCombat.savedVariables.enableDebug

  self.inCombat = IsUnitInCombat("player")

  EVENT_MANAGER:RegisterForEvent(self.name, EVENT_PLAYER_COMBAT_STATE, self.OnPlayerCombatState)
end

function PacsInCombat.OnAddOnLoaded(event, addonName)
  if addonName == PacsInCombat.name then
    PacsInCombat:Initialize()

    -- Debug output if we have that enabled. 
    if enableDebug == true then
      d("Pacrooti's In Combat Loaded.")
    end
  
  end
end

function PacsInCombat.OnPlayerCombatState(event, inCombat)

    if inCombat ~= PacsInCombat.inCombat then
      PacsInCombat.inCombat = inCombat
   
      if inCombat then
        if PacsInCombat.savedVariables.enableInCombat == true then
          d("Entering combat.")
        end
      else
        if PacsInCombat.savedVariables.enableInCombat == true then
          d("Exiting combat.")
        end
      end
   
    end
end

--  Settings Menu Function via LibAddonMenu-2.0
function PacsInCombat.CreateSettingsWindow()
  local panelData = {
      type = "panel",
      name = "Pacrooti's In Combat",
      displayName = "Pacrooti's In Combat",
      author = "Erica Z",
      version = PacsInCombat.version,
      slashCommand = "/pic",
      registerForRefresh = true,
      registerForDefaults = true,
  }

  local cntrlOptionsPanel = LAM2:RegisterAddonPanel("PacsInCombat_settings", panelData)


  local optionsData = {
      [1] = {
          type = "header",
          name = "In Combat Status",
      },

      [2] = {
          type = "checkbox",
          name = "Enable In Combat",
          default = true,
          getFunc = function() return PacsInCombat.savedVariables.enableInCombat end,
          setFunc = function(newValue) PacsInCombat.savedVariables.enableInCombat = newValue end,
      },

      [3] = {
          type = "header",
          name = "Debug Messages",
      },

      [4] = {
          type = "checkbox",
          name = "Enable Debug Messages",
          default = false,
          getFunc = function() return PacsInCombat.savedVariables.enableDebug end,
          setFunc = function(newValue) PacsInCombat.savedVariables.enableDebug = newValue end,
      }
  }

  LAM2:RegisterOptionControls("PacsInCombat_settings", optionsData)

end

EVENT_MANAGER:RegisterForEvent(PacsInCombat.name, EVENT_ADD_ON_LOADED, PacsInCombat.OnAddOnLoaded)