local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local localPlayer = Players.LocalPlayer
local args = {
"Left Arm",
1,
{
SoundPart = "Left Arm",
DebounceTime = 0.1,
HitBoxTime = 0.1,
Hitter = "Left Arm",
HitBoxStart = 0.1,
AnimSpeed = 1.137,
ComboEndTime = 0.1,
Damage = 1000
}
}
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local fists = character:WaitForChild("Fists")
local eventsFolder = fists:WaitForChild("EventsFolder")
local swingEvent = eventsFolder:WaitForChild("Swing")
local isRunning = false
 
local function loop()
while isRunning do
swingEvent:FireServer(unpack(args))
wait(0.2)
end
end
 
UserInputService.InputBegan:Connect(function(input)
if input.KeyCode == Enum.KeyCode.F then
isRunning = not isRunning
if isRunning then
spawn(loop)
end
end
end)