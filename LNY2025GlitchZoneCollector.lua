-- LNY2025GlitchZoneCollector 


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShootingStarCollected = ReplicatedStorage.API:WaitForChild("ShootingStarCollected")
local player = game.Players.LocalPlayer

-- Create GUI elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player:WaitForChild("PlayerGui")

local CountLabel = Instance.new("TextLabel")
CountLabel.Size = UDim2.new(0, 300, 0, 50)
CountLabel.Position = UDim2.new(0.5, -150, 0, 80) -- Positioned below the MainMap label
CountLabel.Font = Enum.Font.SourceSans
CountLabel.Text = "Stars Collected from LNY2025GlitchZone: 0"
CountLabel.TextSize = 70
CountLabel.TextColor3 = Color3.new(1, 1, 1)
CountLabel.BackgroundTransparency = 1
CountLabel.TextScaled = true
CountLabel.Parent = ScreenGui

local totalStarsCollected = 0  -- Initialize a variable to keep track of stars collected

-- Update the star count when the event is received
ShootingStarCollected.OnClientEvent:Connect(function(currentStarCount)
    CountLabel.Text = "Stars Collected from LNY2025GlitchZone: " .. tostring(currentStarCount)
end)

-- Function to collect stars from LNY2025GlitchZone in a continuous loop
local function collectStarsLoop()
    local currentMapName = "LNY2025GlitchZone"

    while true do
        for starID = 1, 100 do  -- Loop through star IDs (adjust the range as necessary)
            local args = {
                [1] = currentMapName,
                [2] = tostring(starID)
            }

            -- Fire the server to collect the star
            ShootingStarCollected:FireServer(unpack(args))

            -- Increment the count of collected stars locally
            totalStarsCollected += 1
            CountLabel.Text = "Stars Collected from LNY2025GlitchZone: " .. tostring(totalStarsCollected)

            wait(1)  -- Introduce a delay to prevent overwhelming the server
        end

        wait(2)  -- Wait period after collecting all stars before restarting the loop
    end
end

-- Start the continuous collection of stars

collectStarsLoop()
