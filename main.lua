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


local Button = MainTab:CreateButton({
   Name = "Auto Cast",
   Callback = function()
      while wait(0) do
         game:GetService("Players").LocalPlayer.Backpack["Flimsy Rod"].events.cast:FireServer(100,1)
      end
   end,
})



local Button = MainTab:CreateButton({
   Name = "Auto Reel(Blatant)",
   Callback = function()
         game:GetService("ReplicatedStorage").events.reelfinished:FireServer(100,false)
   end,
})