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
            game.Players.LocalPlayer.Character.Humanoid.Jumppower = V-- The function that takes place when the slider changes
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
            
            if Value == true then
               local Players = game:GetService("Players"):GetChildren()
            local highlight = Instance.new("Highlight")
            highlight.Name = "Highlight"
          
      
            for i, v in pairs(Players) do
               repeat task.wait() until v.Character
               local highlightClone = highlight:Clone()
               highlightClone.Adornee = v.Character
               highlightClone.Parent = v.Character:FindFirstChild("HumanoidRootPart")
            end
      
      
            game.Players.PlayerAdded:Connect(function(player)
               repeat task.wait() until player.Character
               local highlightClone = highlight:Clone()
               highlightClone.Adornee = player.Character
               highlightClone.Parent = player.Character:FindFirstChild("HumanoidRootPart")
            end)
         else
            highlight:Destroy()
            highlightClone:Destroy()
      
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

      local Button = Tab2:CreateButton({
         Name = "Infinite Yield",
         Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
         end,
      })



     -- Keybinds --

     local Keybind = Tab4:CreateKeybind({
      Name = "Panic Keybind",
      CurrentKeybind = "Period",
      HoldToInteract = false,
      Flag = "PanicKeybind", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
      Callback = function(Keybind)
         local UIS = game:GetService("UserInputService")
         
         if UIS.InputBegan == Enum.KeyCode.Period then
            Rayfield:Destroy()
         end-- The function that takes place when the keybind is pressed
      -- The variable (Keybind) is a boolean for whether the keybind is being held or not (HoldToInteract needs to be true)
      end,
   })
