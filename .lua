-- dehash
loadstring(game:HttpGet(('https://raw.githubusercontent.com/UnclesVan/AdoPtMe-/refs/heads/main/renameremotes.lua')))()


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ScreenGui = Instance.new("ScreenGui")

local ShootingStarCollected = ReplicatedStorage.API:WaitForChild("ShootingStarCollected")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

ScreenGui.Parent = playerGui

-- Create a Frame to hold the UI elements
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.4, 0) -- Adjusted height to fit three labels
frame.Position = UDim2.new(0.35, 0, 0.05, 0) -- Centered at the top
frame.BackgroundTransparency = 0.5 -- Slightly transparent background
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Parent = ScreenGui

-- Create TextLabel for MainMap
local mainMapLabel = Instance.new("TextLabel")
mainMapLabel.Size = UDim2.new(1, 0, 0.33, 0) -- Takes a third of the height of the frame
mainMapLabel.Position = UDim2.new(0, 0, 0, 0)
mainMapLabel.Text = "Collecting Stars in MainMap..."
mainMapLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainMapLabel.BackgroundTransparency = 1
mainMapLabel.TextScaled = true
mainMapLabel.Parent = frame

-- Create TextLabel for LNY2025GlitchZone
local glitchZoneLabel = Instance.new("TextLabel")
glitchZoneLabel.Size = UDim2.new(1, 0, 0.33, 0) -- Takes another third of the height
glitchZoneLabel.Position = UDim2.new(0, 0, 0.33, 0)
glitchZoneLabel.Text = "Collecting Stars in LNY2025GlitchZone..."
glitchZoneLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
glitchZoneLabel.BackgroundTransparency = 1
glitchZoneLabel.TextScaled = true
glitchZoneLabel.Parent = frame

-- Create TextLabel for MoonInterior
local moonInteriorLabel = Instance.new("TextLabel")
moonInteriorLabel.Size = UDim2.new(1, 0, 0.33, 0) -- Takes the final third of the height
moonInteriorLabel.Position = UDim2.new(0, 0, 0.67, 0)
moonInteriorLabel.Text = "Collecting Stars in MoonInterior..."
moonInteriorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
moonInteriorLabel.BackgroundTransparency = 1
moonInteriorLabel.TextScaled = true
moonInteriorLabel.Parent = frame

-- Function to update the label text accordingly
local function updateCollectingText(mapType, starID)
    if mapType == "MainMap" then
        mainMapLabel.Text = "Collecting star ID " .. starID .. " in MainMap"
    elseif mapType == "LNY2025GlitchZone" then
        glitchZoneLabel.Text = "Collecting star ID " .. starID .. " in LNY2025GlitchZone"
    elseif mapType == "MoonInterior" then
        moonInteriorLabel.Text = "Collecting star ID " .. starID .. " in MoonInterior"
    end
end

-- Existing collection loops
local function collectStarsLoopMainMap()
    local currentMapName = "MainMap"

    while true do
        for starID = 100, 1000 do -- Adjusting to your ID range
            updateCollectingText(currentMapName, starID)
            ShootingStarCollected:FireServer(currentMapName, tostring(starID))
            wait(1) -- Adjust the wait time if needed
        end
        wait(2) -- Wait before it repeats the collection
    end
end

local function collectStarsLoopGlitchZone()
    local currentMapName = "LNY2025GlitchZone"

    while true do
        for starID = 200, 1200 do -- Adjusting to your ID range
            updateCollectingText(currentMapName, starID)
            ShootingStarCollected:FireServer(currentMapName, tostring(starID))
            wait(1) -- Adjust the wait time if needed
        end
        wait(2) -- Wait before it repeats the collection
    end
end

local function collectStarsLoopMoonInterior()
    local currentMapName = "MoonInterior"

    while true do
        for starID = 300, 1300 do -- Adjusted range for MoonInterior
            updateCollectingText(currentMapName, starID)
            ShootingStarCollected:FireServer(currentMapName, tostring(starID))
            wait(1) -- Adjust the wait time if needed
        end
        wait(2) -- Wait before it repeats the collection
    end
end

-- Start the loops in parallel
coroutine.wrap(collectStarsLoopMainMap)()
coroutine.wrap(collectStarsLoopGlitchZone)()
coroutine.wrap(collectStarsLoopMoonInterior)()
















-- Main Map

--local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local ShootingStarCollected = ReplicatedStorage.API:WaitForChild("ShootingStarCollected")
--local player = game.Players.LocalPlayer

-- Create GUI elements
--local ScreenGui = Instance.new("ScreenGui")
--ScreenGui.Parent = player:WaitForChild("PlayerGui")

--local CountLabel = Instance.new("TextLabel")
--CountLabel.Size = UDim2.new(0, 300, 0, 50)
--CountLabel.Position = UDim2.new(0.5, -150, 0, 20) -- Centered at the top
--CountLabel.Font = Enum.Font.SourceSans
--CountLabel.Text = "Stars Collected from MainMap: 0"
--CountLabel.TextSize = 70
--CountLabel.TextColor3 = Color3.new(1, 1, 1)
--CountLabel.BackgroundTransparency = 1
--CountLabel.TextScaled = true
--CountLabel.Parent = ScreenGui

--local totalStarsCollected = 0  -- Initialize a variable to keep track of stars collected

-- Update the star count when the event is received
--ShootingStarCollected.OnClientEvent:Connect(function(currentStarCount)
  --  CountLabel.Text = "Stars Collected from MainMap: " .. tostring(currentStarCount)
--end)

-- Function to collect stars from MainMap in a continuous loop
--local function collectStarsLoop()
   -- local currentMapName = "MainMap"

 --   while true do
    --    for starID = 1, 1000 do  -- Loop through star IDs from 1 to 1000
         --   local args = {
              --  [1] = currentMapName,
              --  [2] = tostring(starID)
        --    }

            -- Fire the server to collect the star
          --  ShootingStarCollected:FireServer(unpack(args))

            -- Increment the count of collected stars locally
           -- totalStarsCollected += 1
          --  CountLabel.Text = "Stars Collected from MainMap: " .. tostring(totalStarsCollected)

         --   wait(1)  -- Introduce a delay to prevent overwhelming the server
      --  end

    --    wait(2)  -- Wait period after collecting all stars from MainMap before restarting the loop
  --  end
--end

-- Start the continuous collection of stars
collectStarsLoop()
