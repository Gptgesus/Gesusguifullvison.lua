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

-- Main Frame (background)
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

-- Scrolling Frame to allow scrolling
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -40)
ScrollFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollFrame.BackgroundTransparency = 0.5
ScrollFrame.ScrollBarThickness = 10
ScrollFrame.Parent = Frame

-- UIListLayout for positioning buttons vertically
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollFrame

-- Button creation function
local function createButton(name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -20, 0, 40)
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.BackgroundTransparency = 0.5
    btn.TextColor3 = Color3.fromRGB(0, 255, 0)
    btn.Font = Enum.Font.Gotham
    btn.TextScaled = true
    btn.Parent = ScrollFrame

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

-- Send notification on run
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Gesus",
    Text = "Make by Thailand",
    Duration = 5
})

-- Button List
createButton("piano", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-UNIVERSAL-PIANO-AUTOPLAY-SCRIPT-INSANELY-ACCURRATE-19550"))()
end)

createButton("ESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/qwezxc123zz/FreeCheats/main/ESPBloodDebt.lua"))()
end)

createButton("Speed", function()
    LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

createButton("Fly Menu", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Fly-V3-16477"))()
end)

createButton("Noclip", function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    game:GetService("RunService").Stepped:Connect(function()
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end)

createButton("Teleport Forward", function()
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = root.CFrame + root.CFrame.LookVector * 10
    end
end)

createButton("Invisible", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-script-20557"))()
end)

createButton("Explode", function()
    Instance.new("Explosion", workspace).Position = LocalPlayer.Character.HumanoidRootPart.Position
end)

createButton("God Mode", function()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    if char and char:FindFirstChild("Humanoid") then
        local humanoid = char.Humanoid
        humanoid.Health = humanoid.MaxHealth
        humanoid.Died:Connect(function()
            humanoid.Health = humanoid.MaxHealth
        end)
    end
end)

createButton("TP to Player", function()
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

createButton("Infinite Yield", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

createButton("FE Bypass", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-FE-Bypass-Gui-12350"))()
end)

createButton("Script Dex", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/MainTreeUhh/UniversalScript/main/KeylessDexExplorer"))()
    end)

createButton("Tiger X", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/Tiger-X-V3/main/Tiger%20X%20V3.5%20Fixed"))()
end)

createButton("System Broken", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
end)

local ghostBtn = Instance.new("TextButton")
ghostBtn.Size = UDim2.new(1, -20, 0, 40)
ghostBtn.Text = "Ghost Hub"
ghostBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ghostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ghostBtn.Font = Enum.Font.Gotham
ghostBtn.TextScaled = true
ghostBtn.Parent = ScrollFrame

task.spawn(function()
    while true do
        ghostBtn.Rotation = (ghostBtn.Rotation + 1) % 360
        task.wait()
    end
end)

ghostBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub"))()
end)

createButton("Nameless Admin", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Nameless-Admin-35212"))()
end)

createButton("รออัพเดท", function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "ข้อมูล",
        Text = "โปรดรอการอัพเดทในภายหลัง!",
        Duration = 5
    })
end)
