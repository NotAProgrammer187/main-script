local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "CodeR",
    Icon = "eye", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "CodeR 🔥",
    LoadingSubtitle = "by Xyen",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Code Rogue",
       Subtitle = "Key System",
       Note = "Join our discord server to get key", -- Use this to tell the user how to get a key
       FileName = "coderogue", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"https://pastebin.com/raw/2fngAWBh"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("Main", nil) -- Title, Image
 local AutomaticSection = MainTab:CreateSection("👁 Automatic")


 Rayfield:Notify({
   Title = "Sucessfully Executed CodeR",
   Content = "Notification Content",
   Duration = 6.5,
   Image = "gitlab",
})

-- AutoShake Toggle
local autoShakeEnabled = false
local autoShakeConnection

-- AutoShake Functionality
local function autoShake()
    if ShakeMode == "Navigation" then
        task.wait()
        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end
            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            task.wait(0.2)
            GuiService.SelectedObject = button
            if GuiService.SelectedObject == button then
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
            end
            task.wait(0.1)
            GuiService.SelectedObject = nil
        end, function(err)
        end)
    elseif ShakeMode == "Mouse" then
        task.wait()
        xpcall(function()
            local shakeui = PlayerGui:FindFirstChild("shakeui")
            if not shakeui then return end
            local safezone = shakeui:FindFirstChild("safezone")
            local button = safezone and safezone:FindFirstChild("button")
            local pos = button.AbsolutePosition
            local size = button.AbsoluteSize
            VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, true, LocalPlayer, 0)
            VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, false, LocalPlayer, 0)
        end, function(err)
        end)
    end
end

-- Start AutoShake
local function startAutoShake()
    if autoShakeConnection or not autoShakeEnabled then return end
    autoShakeConnection = RunService.RenderStepped:Connect(autoShake)
end

-- Stop AutoShake
local function stopAutoShake()
    if autoShakeConnection then
        autoShakeConnection:Disconnect()
        autoShakeConnection = nil
    end
end

-- Toggle Button for AutoShake
local AutoShakeToggle = MainTab:CreateToggle({
   Name = "Auto Shake",
   CurrentValue = false,
   Flag = "AutoShakeToggle",
   Callback = function(Value)
       autoShakeEnabled = Value
       if autoShakeEnabled then
           startAutoShake()
       else
           stopAutoShake()
       end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Auto Cast",
   Callback = function()
      while wait(0) do
         game:GetService("Players").LocalPlayer.Backpack["Flimsy Rod"].events.cast:FireServer(100,1)
      end
   end,
})



local Button = MainTab:CreateButton({
   Name = "Auto Equip Best",
   Callback = function()
      while wait(0) do
         game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100,false)
      end
   end,
})