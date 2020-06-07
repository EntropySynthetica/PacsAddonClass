-- Load Required Libraries
local LAM2 = LibAddonMenu2

-- Initialize our Namespace Table
PacsInCombat = {}
 
PacsInCombat.name = "PacsInCombat"
PacsInCombat.version = "1.0.0"

-- Detect if our Addon has loaded into Memory yet, if it has kick off our init function
function PacsInCombat.OnAddOnLoaded(event, addonName)
  if addonName == PacsInCombat.name then
    PacsInCombat.Initialize()
  end
end

-- This is were we run stuff that needs to happen when our addon first runs. 
function PacsInCombat.Initialize()
  -- Call the function that sets up our menu window.
  PacsInCombat.CreateSettingsWindow()

  -- Load any saved variables we have into memory.
  PacsInCombat.savedVariables = ZO_SavedVars:NewCharacterIdSettings("PacsInCombatSavedVariables", 1, nil, {})

  -- Ask ESO to call the our Combat State function when there is a change in your combat status. 
  EVENT_MANAGER:RegisterForEvent(PacsInCombat.name, EVENT_PLAYER_COMBAT_STATE, PacsInCombat.OnPlayerCombatState)
end

-- This function gets called when there is a change in your combat status. 
function PacsInCombat.OnPlayerCombatState(event, CombatState)

    if CombatState then
      if PacsInCombat.savedVariables.enableInCombat == true then
        d("Entering combat.")
      end

    else
      if PacsInCombat.savedVariables.enableInCombat == true then
        d("Exiting combat.")
      end

    end
end

-- This function defines the layout of our menu via LibAddonMenu 2.0
function PacsInCombat.CreateSettingsWindow()
  local panelData = {
      type = "panel",
      name = "Pacrooti's In Combat",
      displayName = "Pacrooti's In Combat",
      author = "LadyWinry",
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
      }
  }

  LAM2:RegisterOptionControls("PacsInCombat_settings", optionsData)

end

-- Tell ESO to let us know when our addon has loaded.
EVENT_MANAGER:RegisterForEvent(PacsInCombat.name, EVENT_ADD_ON_LOADED, PacsInCombat.OnAddOnLoaded)