-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 85, 255)
Frame.Position = UDim2.new(0.0799492374, 0, 0.483815432, 0)
Frame.Size = UDim2.new(0, 292, 0, 171)
Frame.Active = true
Frame.Archivable = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.157534242, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Virus And Cure Player script"
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
TextBox.Text = "PLAYER"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
TextButton.Position = UDim2.new(0.311643839, 0, 0.713450253, 0)
TextButton.Size = UDim2.new(0, 109, 0, 39)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Virus/Cure"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true

local plr = game.Players.LocalPlayer

function Tween(Obj, Prop, New, Time)
	if not Time then
		Time = .5
	end
	local TweenService = game:GetService("TweenService")
	local info = TweenInfo.new(
		Time, 
		Enum.EasingStyle.Quart, 
		Enum.EasingDirection.Out, 
		0, 
		false,
		0
	)
	local propertyTable = {
		[Prop] = New,
	}

	TweenService:Create(Obj, info, propertyTable):Play()
end

function Notif(Text,Dur)
	task.spawn(function()
		if not Dur then
			Dur = 1.5
		end
		local Notif = Instance.new("ScreenGui")
		local Frame_1 = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		Notif.Parent = (game:GetService("CoreGui") or gethui())
		Notif.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		Frame_1.Parent = Notif
		Frame_1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		Frame_1.BackgroundTransparency=1
		Frame_1.BorderSizePixel = 0
		Frame_1.Position = UDim2.new(0, 0, 0.0500000007, 0)
		Frame_1.Size = UDim2.new(1, 0, 0.100000001, 0)
		TextLabel.Parent = Frame_1
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.TextTransparency =1
		TextLabel.Size = UDim2.new(1, 0, 1, 0)
		TextLabel.Font = Enum.Font.Highway
		TextLabel.Text = Text or "Text not found"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 21.000
		Tween(Frame_1,"BackgroundTransparency",0.350,.5)
		Tween(TextLabel,"TextTransparency",0,.5)
		wait(Dur+.7)
		Tween(Frame_1,"BackgroundTransparency",1,.5)
		Tween(TextLabel,"TextTransparency",1,.5)
		wait(.7)
		Notif:Destroy()
	end)
	return
end

function GetPlayer(Player)
        local function findPlayer(stringg)
		for _, v in pairs(game.Players:GetPlayers()) do
			if (stringg:lower() == (v.Name:lower()):sub(1, #stringg)) or (stringg:lower() == (v.DisplayName:lower()):sub(1, #stringg)) then return v end
		end
	end
	return findPlayer(Player)
end

local function GiveItem(Item)
	if Item == "Virus" then
	if game.Players.LocalPlayer.Character:FindFirstChild("Virus") or game.Players.LocalPlayer.Backpack:FindFirstChild("Virus") then
        -- nothing
	else
        game.ReplicatedStorage.Events.GiveVirus:FireServer()
	end
	elseif Item == "Cure" then
	if game.Players.LocalPlayer.Character:FindFirstChild("Cure") or game.Players.LocalPlayer.Backpack:FindFirstChild("Cure") then
        -- nothing
	else
        game.ReplicatedStorage.Events.GiveCure:FireServer()
	end
	end
end

function ClickTool(Tool)
	plr.Character:FindFirstChild(Tool):Activate()
end

local function EquipTool(Tool)
	plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(Tool))
end

function Bring(Player)
	plr.Character.HumanoidRootPart.CFrame = Player.Character.HumanoidRootPart.CFrame * CFrame.new(-2, 0, 2)
end

local function ChangeTeam(Player)
	local Player = GetPlayer(Player)
if Player.Character.Humanoid.Health == 0 then
Notif("(Error) Player Dead")
else
if Player.Team == game.Teams.Human then
if Player ~= nil then
Notif("(Success) Virus "..Player.DisplayName,3)
GiveItem("Virus")
task.wait(0.3)
for i = 1, 25 do
EquipTool("Virus")
Bring(Player)
ClickTool("Virus")
task.wait()
end
else
Notif("(Error) No Player Found",3)
end
elseif Player.Team == game.Teams.Zombie then
if Player ~= nil then
Notif("(Success) Cure "..Player.DisplayName,3)
GiveItem("Cure")
task.wait(0.3)
for i = 1, 25 do
EquipTool("Cure")
Bring(Player)
ClickTool("Cure")
task.wait()
end
else
Notif("(Error) No Player Found",3)
end
end
end
end

TextButton.MouseButton1Click:Connect(function()
local Player = TextBox.Text
if Player == "me" then
if plr.Team == game.Teams.Human then
GiveItem("Virus")
Notif("(Success) Virus "..plr.DisplayName)
elseif plr.Team == game.Teams.Zombie then
GiveItem("Cure")
Notif("(Success) Cure "..plr.DisplayName)
end
else
ChangeTeam(Player)
end
end)
