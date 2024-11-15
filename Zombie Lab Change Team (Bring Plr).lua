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
	Player.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(2, 0, -2)
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
repeat wait() until plr.Character:FindFirstChild("Virus") or plr.Backpack:FindFirstChild("Virus")
for i = 1, 25 do
EquipTool("Virus")
Bring(Player)
ClickTool("Virus")
task.wait()
end
Notif("(Success) Virus "..Player.DisplayName,3)
else
Notif("(Error) No Player Found",3)
end
elseif Player.Team == game.Teams.Zombie then
if Player ~= nil then
Notif("(Success) Cure "..Player.DisplayName,3)
GiveItem("Cure")
repeat wait() until plr.Character:FindFirstChild("Cure") or plr.Backpack:FindFirstChild("Cure")
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

local destruct = Instance.new("ScreenGui")
local open = Instance.new("TextButton")
local close = Instance.new("TextButton")
local main = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local line = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local scripts = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local CureVirus = Instance.new("TextButton")
local Virus = Instance.new("TextButton")
local Cure = Instance.new("TextButton")
local player = Instance.new("TextBox")

--Properties:

destruct.Name = "destruct"
destruct.Parent = game.CoreGui
destruct.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

open.Name = "open"
open.Parent = destruct
open.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
open.BorderSizePixel = 0
open.Size = UDim2.new(0, 200, 0, 50)
open.Font = Enum.Font.Roboto
open.Text = "Open"
open.TextColor3 = Color3.fromRGB(255, 255, 255)
open.TextSize = 14.000
open.MouseButton1Click:Connect(function()
open.Visible = false
close.Visible = true
main.Visible = true
end)

close.Name = "close"
close.Parent = destruct
close.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
close.BorderSizePixel = 0
close.Size = UDim2.new(0, 200, 0, 50)
close.Font = Enum.Font.Roboto
close.Text = "Close"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextSize = 14.000
close.MouseButton1Click:Connect(function()
open.Visible = true
close.Visible = false
main.Visible = false
end)

main.Name = "main"
main.Parent = destruct
main.BackgroundColor3 = Color3.fromRGB(76, 76, 76)
main.BackgroundTransparency = 0.3
main.BorderSizePixel = 0
main.Position = UDim2.new(0.268847764, 0, 0.372854918, 0)
main.Size = UDim2.new(0, 325, 0, 239)
main.Visible = false
main.Active = true

local UserInputService = game:GetService("UserInputService")

local gui = main

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui:TweenPosition(UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.05, true)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.292307675, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 134, 0, 25)
TextLabel.Font = Enum.Font.Roboto
TextLabel.Text = "NoobHubV1"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 17.000

line.Name = "line"
line.Parent = main
line.BackgroundColor3 = Color3.fromRGB(84, 84, 84)
line.BorderSizePixel = 0
line.Position = UDim2.new(0, 0, 0.106986806, 0)
line.Size = UDim2.new(0, 325, 0, 6)

ImageLabel.Parent = main
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.184615389, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 25, 0, 25)
ImageLabel.Image = "http://www.roblox.com/asset/?id=4483345998"
ImageLabel.ScaleType = Enum.ScaleType.Fit

scripts.Name = "scripts"
scripts.Parent = main
scripts.Active = true
scripts.BackgroundColor3 = Color3.fromRGB(63, 63, 63)
scripts.BackgroundTransparency = 1
scripts.BorderSizePixel = 0
scripts.Position = UDim2.new(0, 0, 0.134782612, 0)
scripts.Size = UDim2.new(0, 325, 0, 173)
scripts.CanvasSize = UDim2.new(0, 0, 1.150, 0)

UIGridLayout.Parent = scripts
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 100, 0, 30)

CureVirus.Name = "CureVirus"
CureVirus.Parent = scripts
CureVirus.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
CureVirus.BorderSizePixel = 0
CureVirus.Size = UDim2.new(0, 200, 0, 50)
CureVirus.Font = Enum.Font.Roboto
CureVirus.Text = "Human/Zombie"
CureVirus.TextColor3 = Color3.fromRGB(255, 255, 255)
CureVirus.TextSize = 14.000
CureVirus.MouseButton1Down:Connect(function()
local Player = player.Text
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

Virus.Name = "Virus"
Virus.Parent = scripts
Virus.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Virus.BorderSizePixel = 0
Virus.Size = UDim2.new(0, 200, 0, 50)
Virus.Font = Enum.Font.Roboto
Virus.Text = "Give Virus"
Virus.TextColor3 = Color3.fromRGB(255, 255, 255)
Virus.TextSize = 14.000
Virus.MouseButton1Down:Connect(function()
GiveItem("Virus")
end)

Cure.Name = "Cure"
Cure.Parent = scripts
Cure.BackgroundColor3 = Color3.fromRGB(53, 53, 53)
Cure.BorderSizePixel = 0
Cure.Size = UDim2.new(0, 200, 0, 50)
Cure.Font = Enum.Font.Roboto
Cure.Text = "Give Cure"
Cure.TextColor3 = Color3.fromRGB(255, 255, 255)
Cure.TextSize = 14.000
Cure.MouseButton1Down:Connect(function()
GiveItem("Cure")
end)

player.Name = "player"
player.Parent = main
player.BackgroundColor3 = Color3.fromRGB(85, 85, 85)
player.BorderSizePixel = 0
player.Position = UDim2.new(0.0246153846, 0, 0.870292902, 0)
player.Size = UDim2.new(0, 310, 0, 23)
player.ClearTextOnFocus = true
player.Font = Enum.Font.SourceSans
player.PlaceholderColor3 = Color3.fromRGB(152, 152, 152)
player.PlaceholderText = "PLAYER"
player.Text = ""
player.TextColor3 = Color3.fromRGB(255, 255, 255)
player.TextSize = 14.000
