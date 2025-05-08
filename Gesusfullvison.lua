-- Gesus Hack GUI for Roblox Mobile (with Ghost Hub Rotating Button + Nameless Admin)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Clear any previous GUIs
pcall(function()
    LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("GesusHack"):Destroy()
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GesusHack"
ScreenGui.Parent = PlayerGui

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 580)
Frame.Position = UDim2.new(0, 20, 0.2, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.3
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "GESUS HACK"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.BackgroundTransparency = 1
Title.Parent = Frame

-- Button creation function
local function createButton(name, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.5
    btn.TextColor3 = Color3.fromRGB(0, 255, 0)
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    btn.Parent = Frame

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        btn.TextColor3 = Color3.fromRGB(0, 255, 0)
    end)
    btn.MouseButton1Click:Connect(callback)
end

-- Starting Y position
local y = 40
local spacing = 40

-- Button List
createButton("Switch to R6", y, function()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if character:FindFirstChildOfClass("Humanoid") then
        character.Humanoid:ApplyDescription(game:GetService("Players"):GetHumanoidDescriptionFromUserId(LocalPlayer.UserId))
        print("Switched to R6")
    end
end)

y += spacing
createButton("ESP", y, function()
    -- Replace old ESP with new ESP script
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwezxc123zz/FreeCheats/main/ESPBloodDebt.lua"))()
end)

y += spacing
createButton("Speed", y, function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

y += spacing
createButton("Fly Menu", y, function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Fly-V3-16477"))()
end)

y += spacing
createButton("Noclip", y, function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    game:GetService("RunService").Stepped:Connect(function()
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end)

y += spacing
createButton("Teleport Forward", y, function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = root.CFrame + root.CFrame.LookVector * 10
    end
end)

y += spacing
createButton("Invisible", y, function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-script-20557"))()
end)

y += spacing
createButton("Explode", y, function()
    Instance.new("Explosion", workspace).Position = LocalPlayer.Character.HumanoidRootPart.Position
end)

y += spacing
createButton("God Mode", y, function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if char and char:FindFirstChild("Humanoid") then
        local humanoid = char.Humanoid
        humanoid.Health = humanoid.MaxHealth
        humanoid.Died:Connect(function()
            humanoid.Health = humanoid.MaxHealth
        end)
    end
end)

y += spacing
createButton("TP to Player", y, function()
    local targetPlayer = nil
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            targetPlayer = player
            break
        end
    end
    if targetPlayer and targetPlayer.Character then
        LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
    end
end)

y += spacing
createButton("Infinite Yield", y, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

y += spacing
createButton("FE Bypass", y, function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-FE-Bypass-Gui-12350"))()
end)

y += spacing
createButton("Script Dex", y, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
end)

y += spacing
createButton("Tiger X", y, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/Tiger-X-V3/main/Tiger%20X%20V3.5%20Fixed"))()
end)

-- Ghost Hub Button (rotating)
y += spacing
local ghostBtn = Instance.new("TextButton")
ghostBtn.Size = UDim2.new(1, -20, 0, 40)
ghostBtn.Position = UDim2.new(0, 10, 0, y)
ghostBtn.Text = "Ghost Hub"
ghostBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ghostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ghostBtn.Font = Enum.Font.Gotham
ghostBtn.TextScaled = true
ghostBtn.Parent = Frame

task.spawn(function()
    while true do
        ghostBtn.Rotation = (ghostBtn.Rotation + 1) % 360
        task.wait()
    end
end)

ghostBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
end)

-- Nameless Admin button
y += spacing
createButton("Nameless Admin", y, function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Nameless-Admin-35212"))()
end)