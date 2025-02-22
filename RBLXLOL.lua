local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


    -- Window --

    local Window = Rayfield:CreateWindow({
        Name = "RBLXLOL V1.0",
        Icon = "code-xml", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
        LoadingTitle = "RBLXLOL V1.0",
        LoadingSubtitle = "by BackshotMaster",
        Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

        ConfigurationSaving = {
           Enabled = true,
           FolderName = "RBLXLOL Cfg", -- Create a custom folder for your hub/game
           FileName = "RBLXLOL Hub"
        },

        Discord = {
           Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
           Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
           RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },

        KeySystem = false, -- Set this to true to use our key system
        KeySettings = {
           Title = "Untitled",
           Subtitle = "Key System",
           Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
           FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
           SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
           GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
           Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
        }
     })

     -- Tabs --

     local Tab = Window:CreateTab("Simple Scripts", "file-code-2") -- Title, Image
     local Tab2 = Window:CreateTab("Advanced Scripts", "terminal") -- Title, Image
     local Tab3 = Window:CreateTab("Troll Scripts", "skull") -- Title, Image
     local Tab4 = Window:CreateTab("Keybinds", "keyboard") -- Title, Image

     -- Sliders --

     local Slider = Tab:CreateSlider({
        Name = "Walkspeed Slider",
        Range = {16, 80},
        Increment = 1,
        Suffix = "Walkspeed",
        CurrentValue = 16,
        Flag = "SpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(V)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V   -- The function that takes place when the slider changes
        -- The variable (Value) is a number which correlates to the value the slider is currently at
        end,
     })

     local Slider = Tab:CreateSlider({
        Name = "Jumppower Slider",
        Range = {50, 100},
        Increment = 1,
        Suffix = "Jumppower",
        CurrentValue = 50,
        Flag = "JumpSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(V)
            game.Players.LocalPlayer.Humanoid.JumpHeight = V-- The function that takes place when the slider changes
        -- The variable (Value) is a number which correlates to the value the slider is currently at
        end,
     })
     local Slider = Tab:CreateSlider({
        Name = "FOV Slider",
        Range = {70, 100},
        Increment = 1,
        Suffix = "FOV",
        CurrentValue = 70,
        Flag = "FOVSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(V)
            game:GetService('Workspace').Camera.FieldOfView = V -- The function that takes place when the slider changes
        -- The variable (Value) is a number which correlates to the value the slider is currently at
        end,
     })

     -- Toggles --

      local Toggle = Tab2:CreateToggle({
         Name = "ESP Toggle (Wallhack)",
         CurrentValue = false,
         Flag = "ESPToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
         Callback = function (Value)
            local Sense = loadstring(game:HttpGet('https://sirius.menu/sense'))()
         
            if Value == true then
               pcall(function() loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua'))() end)
         end

         end,
      })

      -- Buttons --
   
      local Button = Tab2:CreateButton({
         Name = "Dex Explorer",
         Callback = function()
            loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
         end,
      })





     -- Keybinds --

     local Keybind = Tab4:CreateKeybind({
        Name = "PANIC BUTTON",
        CurrentKeybind "F1",
        HoldToInteract = false,
        Flag = "PanicKeybind", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
        Callback = function(Keybind)
         local UIS = game:GetService("UserInputService")
         
         if UIS.InputBegan == Enum.KeyCode.F1 then
            Rayfield:Destroy()
         end

        end,
     })
