local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
local Settings = {
AimLock = {
    Enabled = true,
    Aimlockkey = "q",
    Prediction = 0.130340,
    Aimpart = 'HumanoidRootPart',
},
Settings = {
    Thickness = 3.5,
    Transparency = 1,
    Color = Color3.fromRGB(205,92,92),
    FOV = true
}
}
Notify({
Description = "Loading..";
Title = "Lock UwU";
Duration = 2;
});
wait(2)
Notify({
Description = "Loaded! Enjoy Locking c:";
Title = "Lock UwU";
Duration = 2;
});
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local Inset = game:GetService("GuiService"):GetGuiInset().Y
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer
local Line = Drawing.new("Line")
local Circle = Drawing.new("Circle")
local Plr = nil
Mouse.KeyDown:Connect(function(KeyPressed)
if KeyPressed == (Settings.AimLock.Aimlockkey) then
    if Settings.AimLock.Enabled == true then
        Settings.AimLock.Enabled = false
        Plr = FindClosestPlayer()
        Notify({
        Description = "Unlocked";
        Title = "Lock UwU";
        Duration = 1.5;
        });
    elseif Settings.AimLock.Enabled == false then
        Settings.AimLock.Enabled = true
        Plr = FindClosestPlayer()
        Notify({
        Description = "Locked On :  " .. tostring(Plr.Character.Humanoid.DisplayName);
        Title = "Lock UwU";
        Duration = 1.5;
        });
    end
end
end)
function FindClosestPlayer()
local ClosestDistance, ClosestPlayer = math.huge, nil;
for _, Player in next, game:GetService("Players"):GetPlayers() do
    if Player ~= LocalPlayer then
        local Character = Player.Character
        if Character and Character.Humanoid.Health > 1 then 
            local Position, IsVisibleOnViewPort = CurrentCamera:WorldToViewportPoint(Character.HumanoidRootPart.Position)
            if IsVisibleOnViewPort then
                local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude
                if Distance < ClosestDistance then
                    ClosestPlayer = Player
                    ClosestDistance = Distance
                end
            end
        end
    end
end
return ClosestPlayer, ClosestDistance
end
RunService.Heartbeat:connect(function()
if Plr:FindFirstChild("Information"):FindFirstChild("KO").Value == true and Settings.AimLock.Enabled == true then
    pcall(function()
        if Plr ~= nil then
            Plr = nil
        end
        if Settings.AimLock.Enabled ~= false then
            Settings.AimLock.Enabled = false
        end
    end)
end
if Settings.AimLock.Enabled == true then
    local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[Settings.AimLock.Aimpart].Position + (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction))
    Line.Color = Settings.Settings.Color
    Line.Transparency = Settings.Settings .Transparency
    Line.Thickness = Settings.Settings .Thickness
    Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
    Line.To = Vector2.new(Vector.X, Vector.Y)
    Line.Visible = true
    Circle.Position = Vector2.new(Mouse.X, Mouse.Y + Inset)
    Circle.Visible = Settings.Settings.FOV
    Circle.Thickness = 1.5
    Circle.Thickness = 2
    Circle.Radius = 60
    Circle.Color = Settings.Settings.Color
elseif Settings.AimLock.FOV == true then
    Circle.Visible = true
else
    Circle.Visible = false
    Line.Visible = false
end
end)
local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
local args = {...}
if Settings.AimLock.Enabled and getnamecallmethod() == "FireServer" and args[2] == "MousePos" then
    args[3] = Plr.Character[Settings.AimLock.Aimpart].Position + (Plr.Character[Settings.AimLock.Aimpart].Velocity * Settings.AimLock.Prediction)
    return old(unpack(args))
end
return old(...)
end)
