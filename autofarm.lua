local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-backups/main/uwuware-v1.lua"))()
local client = game:GetService("Players").LocalPlayer
local infarm = false
local cancelled = false
game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WARNING!";
            Text = "Dont spam the auto farm only click one time"})
game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WARNING!";
            Text = "Dont spam the auto farm only click one time"})
game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WARNING!";
            Text = "Dont spam the auto farm only click one time"})
game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WARNING!";
            Text = "Dont spam the auto farm only click one time"})
game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WARNING!";
            Text = "Dont spam the auto farm only click one time"})
game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WARNING!";
            Text = "Dont spam the auto farm only click one time"})
game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WARNING!";
            Text = "Dont spam the auto farm only click one time"})
local function farm()
infarm = true
--// Services
local players = game:GetService("Players")
--// Workspace
local stages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
local penguin, gold = workspace:WaitForChild("ChangeCharacter"), workspace:WaitForChild("ClaimRiverResultsGold")
--// Other
local client = players.LocalPlayer
--// Main
---------
_G.Busy = true
while _G.Busy do
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = Vector3.new(0, -4, 0)
bodyVelocity.Parent = client.Character.HumanoidRootPart
for i = 1, 9 do
    if not client.Character or not client.Character:FindFirstChild("Humanoid") then
        repeat wait() until client.Character and client.Character:FindFirstChild("Humanoid")
    end
    client.Character.HumanoidRootPart.CFrame = stages["CaveStage"..i].DarknessPart.CFrame wait(0.1)
    if not _G.Busy then
        client.Character.Humanoid.Health = 0
        exit(0)
    end
    if i == 1 then
        wait(4)
    else
        wait(2)
    end
    gold:FireServer()
end
penguin:FireServer("PenguinCharacter")
client.Character:Remove()
repeat wait() 
until client.Character and client.Character:FindFirstChild("HumanoidRootPart")
end
end
local main = library:CreateWindow("AutoFarm By Cl1cker#1978  ")
main:AddToggle({text = "Autofarm", flag = "autofarm", callback = function(toggled)
cancelled = not toggled
if toggled then
    if not infarm then
        farm()
    end
end
end})
main:AddToggle({text = "Anti Afk", flag = "stopfarm", callback = function(toggled)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end})
main:AddButton({text = "Stop Farm", flag = "stopfarm", callback = function(toggled)
_G.Busy = false
end})
library:Init()
