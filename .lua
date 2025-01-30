-- dehash
loadstring(game:HttpGet(('https://raw.githubusercontent.com/UnclesVan/AdoPtMe-/refs/heads/main/renameremotes.lua')))()



-- Main Map

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShootingStarCollected = ReplicatedStorage.API:WaitForChild("ShootingStarCollected")
local player = game.Players.LocalPlayer

-- Create GUI elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local CountLabel = Instance.new("TextLabel")
CountLabel.Size = UDim2.new(0, 300, 0, 50)
CountLabel.Position = UDim2.new(0.5, -150, 0, 20) -- Centered at the top
CountLabel.Font = Enum.Font.SourceSans
CountLabel.Text = "Stars Collected from MainMap: 0"
CountLabel.TextSize = 70
CountLabel.TextColor3 = Color3.new(1, 1, 1)
CountLabel.BackgroundTransparency = 1
CountLabel.TextScaled = true
CountLabel.Parent = ScreenGui

local totalStarsCollected = 0  -- Initialize a variable to keep track of stars collected

-- Update the star count when the event is received
ShootingStarCollected.OnClientEvent:Connect(function(currentStarCount)
    CountLabel.Text = "Stars Collected from MainMap: " .. tostring(currentStarCount)
end)

-- Function to collect stars from MainMap in a continuous loop
local function collectStarsLoop()
    local currentMapName = "MainMap"

    while true do
        for starID = 1, 1000 do  -- Loop through star IDs from 1 to 1000
            local args = {
                [1] = currentMapName,
                [2] = tostring(starID)
            }

            -- Fire the server to collect the star
            ShootingStarCollected:FireServer(unpack(args))

            -- Increment the count of collected stars locally
            totalStarsCollected += 1
            CountLabel.Text = "Stars Collected from MainMap: " .. tostring(totalStarsCollected)

            wait(1)  -- Introduce a delay to prevent overwhelming the server
        end

        wait(2)  -- Wait period after collecting all stars from MainMap before restarting the loop
    end
end

-- Start the continuous collection of stars
collectStarsLoop()
