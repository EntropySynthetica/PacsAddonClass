# PacsAddonClass
Code Examples from my Live Coding ESO addons class. 

## Summary of addons in this class
PacsHelloChat, A simple addon that displays a welcome message when you log in. 

PacsinCombat, Shows a message in your chat box when you enter and leave combat. 

HelloPacrooti, Adds new slash commands to summon and dismiss Pacrooti

## ESO Folder Paths

ESO Addons are stored in:
`c:\Users\<username>\Documents\Elder Scrolls Online\live\AddOns\`

ESO Saved Variables are stored in:
`c:\Users\<username>\Documents\Elder Scrolls Online\live\SavedVariables\`

## LUA Basics

### Printing to the chat box
`d("Your text goes here")`

### Assigning Variables

Integers `int = 42`

Strings `string = "Hello World"`

Tables `table = {key1 = 'value1', key2 = false}`

Tables can also be referenced in dot notation.  `var = table.key1`

### If clauses

```
if var == ` then
  d("Do Something")
else
  d("Do something else")
end
```

### Functions

Assigning a function
```
function myFunction()
  var = 1 + 1
  return var
end
```

### Calling a function
```
myFunction()
```

### Loops

```
while num > 1 do
  num = num - 1 
end
```


## Eso Addon structure

All ESO Addons are defined by a folder with at least a manifest file, and a LUA code file.

At startup ESO will look inside each folder within the base ESO Addons folder for a manifest file.  The manifest file must have the same name as the folder and end with the extension .txt. This file defines the meta data for your addon such as the author name, version number, which ESO version the addon is compatible with, and any required dependencies. 

## Arguments for the .txt file

Most of the addon arguments will start with \#\#

`## Title:` 
How the name of your Addon will appear in ESO.

`## Author:`
Author name of your Addon. 

`## Description:`
Addon Description to appear in ESO

`## Version:`
The version number of your app.  It must be in the Semantic versioning format of Major. Minor. Patch.  If ESO detects two apps with the same name it will load the one with the highest version number. 


`## APIVersion:`
This is the version of the ESO API your addon is compatible with.  If the versions listed here don't match the current version of ESO API your app will be listed as "Out of Date".  You can have multiple versions listed, delimited by a space. 


`## DependsOn:`
The name of any Addons or Libraries required by your application.  These must be installed or your addon will fail to load.  


`## SavedVariables:`
Setting a name here will enable your addon to save any variables to disk.  The name you set will be a table name you can reference in your LUA code.  Variables get saved to disk only when logging out of the game, or when performing a /reloadui. 

The last option to define in your manifest file would be the name of the LUA file your application will launch on load.  There is no need to put the /#/# before the filename. 