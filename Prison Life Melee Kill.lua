-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Open = Instance.new("TextButton")
local Close = Instance.new("TextButton")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Open.Parent = ScreenGui
Open.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Open.Position = UDim2.new(0, 0, 0.533834577, 0)
Open.Size = UDim2.new(0, 109, 0, 39)
Open.Font = Enum.Font.SourceSans
Open.Text = "Open"
Open.TextColor3 = Color3.fromRGB(0, 0, 0)
Open.TextScaled = true
Open.TextSize = 1.000
Open.TextWrapped = true
Open.MouseButton1Click:Connect(function()
Open.Visible = false
Close.Visible = true
Frame.Visible = true
end)

Close.Parent = ScreenGui
Close.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Close.Position = UDim2.new(0, 0, 0.533834577, 0)
Close.Size = UDim2.new(0, 109, 0, 39)
Close.Font = Enum.Font.SourceSans
Close.Text = "Close"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 1.000
Close.TextWrapped = true
Close.MouseButton1Click:Connect(function()
Open.Visible = true
Close.Visible = false
Frame.Visible = false
end)

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Frame.Position = UDim2.new(0.0799492374, 0, 0.483815432, 0)
Frame.Size = UDim2.new(0, 292, 0, 171)
Frame.Visible = false
Frame.Active = true
Frame.Archivable = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.157534242, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "meleekill plr script"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.157534242, 0, 0.350877196, 0)
TextBox.Size = UDim2.new(0, 200, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
TextButton.Position = UDim2.new(0.311643839, 0, 0.713450253, 0)
TextButton.Size = UDim2.new(0, 109, 0, 39)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "MELEEKILL"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

local plr = game.Players.LocalPlayer

function getPlayer(Player)
	local function findPlayer(stringg)
	        if (stringg == ("me")) then
			return plr
		else
			for _, v in pairs(game.Players:GetPlayers()) do
				if (stringg:lower() == (v.Name:lower()):sub(1, #stringg)) or (stringg:lower() == (v.DisplayName:lower()):sub(1, #stringg)) then return v end
			end
		end
	end
	return findPlayer(Player)
end

local function MeleeKill(Player)
local Player = getPlayer(Player)
game.ReplicatedStorage.meleeEvent:FireServer(Player)
end

local function Goto(Player)
local Player = getPlayer(Player)
plr.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
end

local function AntiS()
        if plr.Character.Humanoid.Sit == true then
        plr.Character.Humanoid.Sit = false
        end
end

TextButton.MouseButton1Click:Connect(function()
local savedcf = plr.Character.HumanoidRootPart.Position
local Player = TextBox.Text
for i = 1, 50 do
Goto(Player)
MeleeKill(Player)
AntiS()
task.wait()
end
plr.Character.HumanoidRootPart.CFrame = CFrame.new(savedcf)
end)
